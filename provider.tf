terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}




### Comment it if dont want to use the azure account blob backend
terraform {
  backend "azurerm" {
    resource_group_name   = "Prod-DR"
    storage_account_name  = "tfstatefile"
    container_name        = "tfstate-cloudflare-prod"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  # Explicitly use the access key
  storage_use_azuread = false
}
