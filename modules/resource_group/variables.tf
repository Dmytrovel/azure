variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "custom_resource_group_name" {
  type        = string
  description = "Custom name for Resource Group"
  default     = null
}

variable "suffix" {
  type        = string
  description = "Optional suffix for resource group"
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}