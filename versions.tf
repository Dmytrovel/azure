terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.116.0" #">=3.105.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "7f408f98-f52a-403a-84e3-aa3401b28e30"
  use_oidc = true
  client_id = "c41f3068-05e1-43ac-909b-95b7190aa073"
  tenant_id = "e66b0a1e-12b0-4051-8027-930b18b8d022"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraform123424252"
    container_name       = "eastus"
    key                  = "default.tfstate"
  }
}