resource "azurerm_virtual_network_peering" "vnet1" {
    for_each = var.vnetpeer
    name                      = each.value.name
    resource_group_name       = each.value.resource_group_name
    virtual_network_name      = each.value.virtual_network_name
    remote_virtual_network_id = each.value.remote_virtual_network_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "vnet2" {
    for_each = var.vnetpeer
    name                      = each.value.name
    resource_group_name       = each.value.resource_group_name
    virtual_network_name      = each.value.virtual_network_name
    remote_virtual_network_id = each.value.remote_virtual_network_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
}