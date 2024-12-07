locals {
  location = "eastus"
  project  = "example"
}

module "resource_group_storage" {
  count   = var.storage_account_enable ? 1 : 0
  source  = "data-platform-hq/resource-group/azurerm"
  version = "1.3.0"

  project                    = local.project
  env                        = var.env
  location                   = local.location
  tags                       = var.tags
  custom_resource_group_name = "${var.env}-example"
}

resource "azurerm_storage_account" "example" {
  count                    = var.storage_account_enable ? 1 : 0
  name                     = "${var.env}example"
  resource_group_name      = module.resource_group_storage[0].name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

module "resource_group_key_vault" {
  count   = var.key_vault_enable ? 1 : 0
  source  = "data-platform-hq/resource-group/azurerm"
  version = "1.3.0"

  custom_resource_group_name = "${var.env}-example"
  project                    = local.project
  env                        = var.env
  location                   = local.location
  tags                       = var.tags
}

module "key_vault" {
  count   = var.key_vault_enable ? 1 : 0
  source  = "data-platform-hq/key-vault/azurerm"
  version = "1.5.1"

  location       = local.location
  tags           = var.tags
  resource_group = module.resource_group_key_vault[0].name
  key_vault_name = "${var.env}-example"
  ip_rules = {
    "all_ips" = "0.0.0.0/0"
  }
  purge_protection_enabled = false
}