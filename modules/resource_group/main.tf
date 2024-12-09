locals {
  suffix = length(var.suffix) == 0 ? "" : "-${var.suffix}"
  name   = var.custom_resource_group_name == null ? "${var.project}-${var.env}-${var.location}${local.suffix}" : "${var.custom_resource_group_name}${local.suffix}"
}

resource "azurerm_resource_group" "this" {
  name     = local.name
  location = var.location
  tags     = var.tags

  lifecycle {
    prevent_destroy = false
  }
}