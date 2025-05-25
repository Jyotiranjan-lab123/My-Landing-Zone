resource "azurerm_network_interface" "name" {
    for_each = var.nic-details
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    
    ip_configuration {
        name                          = "test1"
        subnet_id                    = data.azurerm_subnet.datasource[each.key].id
        private_ip_address_allocation = "Dynamic"
    }
  
}