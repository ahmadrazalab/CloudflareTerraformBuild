# 🌐 Managing Cloudflare DNS with Terraform


ZONE_ID=""
API_TOKEN=""


### tf vars file for token 
cloudflare_api_token = ""
cloudflare_zone_id = ""

## Using Azure Blob Storage for State Backend 
terraform init -migrate-state
export ARM_ACCESS_KEY=""


This repository automates the management of Cloudflare DNS records using **Terraform**.  
It includes scripts to **import existing DNS records**, **generate Terraform configurations**, and **apply changes** efficiently.

---

## 📂 Directory Structure

```
.
├── account-personal/          # Contains different accounts/domains
│   ├── ahmadraza.in/         # Terraform configs for ahmadraza.in
│   ├── kubecloud.in.net/     # Terraform configs for kubecloud.in.net
│   └── users/                # Other Cloudflare-related user settings
├── cf-terraforming/           # Terraforming scripts for Cloudflare
├── import.sh                  # Script to import existing DNS records into Terraform state
├── import.tf                  # Terraform resource blocks generated from Cloudflare records
├── main.tf                    # Main Terraform configuration
├── output.tf                  # Terraform outputs
├── provider.tf                 # Cloudflare provider configuration
├── README.md                   # Documentation (You're reading it!)
├── secret.md                   # Stores API keys and sensitive information (DO NOT SHARE!)
├── terraform.tfstate            # Terraform state file (tracks deployed resources)
├── terraform.tfstate.backup     # Backup of Terraform state
├── terraform.tfvars             # Terraform variables
├── tf-gen.sh                    # Script to generate Terraform resource blocks
└── variables.tf                 # Variable definitions for Terraform

```

---

## 🛠️ **Setup Requirements**
To use this Terraform setup for managing Cloudflare DNS, you need:

### **1️⃣ Cloudflare API Token**
Generate an **API token** with the following permissions:
- **Zone.Zone Read**
- **Zone.DNS Read & Write**

💡 **How to generate API Token**:
1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to **My Profile > API Tokens**
3. Create a custom token with the above permissions
4. Copy and save the token securely (you'll need it for Terraform)

---

### **2️⃣ Cloudflare Zone ID**
Each Cloudflare domain (zone) has a unique **Zone ID**.

💡 **How to find your Zone ID**:
1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Select your domain
3. Under **Overview**, find the **Zone ID** at the bottom of the page.

---

## 🚀 **Step-by-Step Usage**

### **1️⃣ Configure Terraform Provider**
Edit the `provider.tf` file with your API token:
```hcl
provider "cloudflare" {
  api_token = "your-cloudflare-api-token"
}
```
Alternatively, set it as an environment variable:
```sh
export CLOUDFLARE_API_TOKEN="your-cloudflare-api-token"
```

---

### **2️⃣ Generate Terraform Resource Blocks**
Use the `tf-gen.sh` script to fetch existing Cloudflare DNS records and create Terraform configuration:
```sh
bash tf-gen.sh
```
This will generate `import.tf` containing Terraform resource blocks for each DNS record.

---

### **3️⃣ Import Existing Cloudflare DNS Records**
Run the `import.sh` script to import existing records into Terraform state:
```sh
bash import.sh
```
This prevents Terraform from trying to recreate records that already exist.

---

### **4️⃣ Apply Terraform Configuration**
After importing, run Terraform to verify and apply changes:
```sh
terraform init
terraform plan
terraform apply
```

---

## 🔄 **Handling DNS Record Changes**
- **To add new records:** Modify `main.tf` and run `terraform apply`.
- **To update existing records:** Change `main.tf` and run `terraform plan` to preview changes.
- **To remove records:** Delete the record from `main.tf` and run `terraform apply`.

---

## 🔥 **Troubleshooting**
### **🛑 Terraform is trying to recreate existing records**
If `terraform plan` shows it will **recreate existing records**, it's likely because:
- The **import was not done correctly**
- The **imported state differs from the generated Terraform code**

✅ **Solution**: Ensure you **run `import.sh` before `terraform plan`**.

---


## � **How to Use This Module in Your Project**

Add this module to your Terraform project:

```hcl
module "cloudflare_dns" {
  source = "<path-to-this-module>"
  cloudflare_zone_id = var.cloudflare_zone_id
  records = [
    {
      name    = "app"
      type    = "A"
      content = "198.51.100.4"
      ttl     = 1
      proxied = true
    },
    {
      name    = "www"
      type    = "CNAME"
      content = "app.example.com"
      ttl     = 300
      proxied = false
      comment = "Non-proxied www record"
    }
  ]
}
```

**Inputs:**
- `cloudflare_zone_id`: The Cloudflare Zone ID for your domain.
- `records`: List of DNS records to create (see example above).

**Outputs:**
- `dns_records`: Map of all created DNS records and their details.

**Provider:**
You must configure the Cloudflare provider in your root module, e.g.:
```hcl
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
```

**Example `terraform.tfvars`:**
```hcl
cloudflare_api_token = "your-token"
cloudflare_zone_id   = "your-zone-id"
```

---

## 🎯 **Next Steps**
- [ ] Automate DNS updates using CI/CD
- [ ] Manage multiple Cloudflare accounts using workspaces
- [ ] Enhance security by using environment variables for sensitive data

---

## 👤 **Author**
**Ahmad Raza** - [ahmadraza.in](https://ahmadraza.in)  
For more guides, visit: [docs.ahmadraza.in](https://docs.ahmadraza.in) 🚀


---

### **📌 What This README Covers**
✔️ **Terraform setup for Cloudflare DNS**  
✔️ **Generating Terraform configuration from existing records**  
✔️ **Importing existing DNS records into Terraform state**  
✔️ **Managing DNS records efficiently**  
✔️ **Troubleshooting common issues**  
