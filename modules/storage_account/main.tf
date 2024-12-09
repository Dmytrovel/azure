resource "azurerm_storage_account" "this" {
  name                       = var.conf.name
  resource_group_name        = var.conf.resource_group_name
  location                   = var.conf.location
  account_tier               = var.conf.account_tier
  account_replication_type   = var.conf.account_replication_type
  tags                       = var.conf.tags
  access_tier                = var.conf.access_tier
  https_traffic_only_enabled = var.conf.https_traffic_only_enabled

  network_rules {
    default_action = var.conf.network_rules.default_action
    bypass         = var.conf.network_rules.bypass
    ip_rules       = var.conf.network_rules.ip_rules
  }

  identity {
    type = "SystemAssigned"
  }
}
