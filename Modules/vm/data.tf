data "azurerm_network_interface" "nicdatasource" {
  for_each            = var.vm_details
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

