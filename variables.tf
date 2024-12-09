variable "env" {
  type        = string
  description = "Environment name"
  default     = "default"
}

variable "key_vault_enable" {
  type        = bool
  description = "key_vault_enable"
}

variable "storage_account_enable" {
  type        = bool
  description = "storage account enable"
}

variable "tags" {
  type        = map(any)
  description = "tags"
  default     = {}
}

variable "location" {
  type        = string
  description = "location of deployed resources"
  default     = ""
}

variable "project" {
  type        = string
  description = "project name"
  default     = "test"
}