resource "azurerm_resource_group" "rg-block" {
  for_each = var.rg-details
  name     = each.value.name
  location = each.value.location

}
