output "id" {
  value       = azurerm_storage_account.this.id
  description = "Storage account ID"
}

output "name" {
  value       = azurerm_storage_account.this.name
  description = "Storage account name"
}

output "identity" {
  value       = try(azurerm_storage_account.this.identity, [])
  description = "List of User Assigned Managed Identity IDs"
}
