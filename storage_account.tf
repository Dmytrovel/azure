module "resource_group_st" {
  count = var.storage_account_enable ? 1 : 0

  source                     = "./modules/resource_group"
  custom_resource_group_name = "rg-${var.env}-${var.location}-${var.project}"
  project                    = var.project
  env                        = var.env
  location                   = var.location
  tags                       = var.tags
}

module "azurerm_storage_account" {
  count = var.storage_account_enable ? 1 : 0

  source = "./modules/storage_account"
  conf = {
    name                     = "st${var.env}${var.location}${var.project}"
    resource_group_name      = module.resource_group_st[0].name
    location                 = var.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags                     = var.tags

    network_rules = {
      ip_rules = ["0.0.0.0/0"]
    }
  }
}
