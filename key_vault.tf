module "resource_group_kv" {
  count = var.key_vault_enable ? 1 : 0

  source                     = "./modules/resource_group"
  custom_resource_group_name = "rg-${var.env}-${var.location}-${var.project}"
  project                    = var.project
  env                        = var.env
  location                   = var.location
  tags                       = var.tags
}

module "key_vault" {
  count = var.key_vault_enable ? 1 : 0

  source         = "./modules/key_vault"
  location       = var.location
  tags           = var.tags
  resource_group = module.resource_group_kv[0].name
  key_vault_name = "kv-${var.env}-${var.location}-${var.project}"
  ip_rules = {
    "all_ips" = "0.0.0.0/0"
  }
  purge_protection_enabled = false
}