pipeline {
    agent any
    environment {
        ARM_ACCESS_KEY = credentials('TF-AZURE-BACKEND')
        CLOUDFLARE_API_TOKEN = credentials('cloudflare_api_token')
        CLOUDFLARE_ZONE_ID = credentials('cloudflare_zone_id')
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'master', credentialsId: 'AZUREREPOS', 
                    url: 'https://<github-repo-url>'
            }
        }

        stage('Check Files') {
            steps {
                sh 'ls -la'
            }
        }

        stage('Select Cloud Provider') {
            steps {
                script {
                    def cloudProvider = input(
                        message: "Select Cloud Provider", 
                        parameters: [choice(name: 'Provider', choices: ['AWS-DNS', 'AZURE-DNS'], description: 'Choose AWS or Azure DNS Which you want to apply')]
                    )

                    if (cloudProvider == 'AWS-DNS') {
                        sh 'cp modules/aws/aws-dns.tf main.tf'
                    } else {
                        sh 'cp modules/azure/azure-dns.tf main.tf'
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan and Review The Changes') {
            steps {
                sh '''
                terraform plan \
                    -var "cloudflare_api_token=${CLOUDFLARE_API_TOKEN}" \
                    -var "cloudflare_zone_id=${CLOUDFLARE_ZONE_ID}"
                '''
            }
        }

        stage('Approval for Apply') {
            steps {
                script {
                    def userInput = input(
                        message: "Apply Terraform Changes?", 
                        parameters: [choice(name: 'Proceed', choices: ['No', 'Yes'], description: 'Select Yes to Apply')]
                    )
                    
                    if (userInput == 'Yes') {
                        sh '''
                        terraform apply -auto-approve \
                            -var "cloudflare_api_token=${CLOUDFLARE_API_TOKEN}" \
                            -var "cloudflare_zone_id=${CLOUDFLARE_ZONE_ID}"
                        '''
                    } else {
                        echo "Terraform Apply Skipped!"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Terraform changes applied successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
