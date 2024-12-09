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
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraform123424252"
    container_name       = "eastus"
    key                  = "default.tfstate"
  }
}