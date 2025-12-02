resource "azurerm_resource_group" "rgs" {
  for_each = var.resource_groups
  name = each.value.rg_name
  location = each.value.location
  managed_by = each.value.managed_by
  tags = each.value.tags
}

