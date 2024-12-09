variable "conf" {
  type = object({
    name                       = string
    resource_group_name        = string
    location                   = string
    account_tier               = optional(string)
    account_replication_type   = string
    tags                       = optional(map(string))
    https_traffic_only_enabled = optional(bool, true)
    min_tls_version            = optional(string, "TLS1_2")
    access_tier                = optional(string, "Hot")
    network_rules = object({
      default_action = optional(string, "Deny")
      bypass         = optional(set(string), ["AzureServices"])
      ip_rules       = list(string)
    })
  })
  description = "configuration"
}