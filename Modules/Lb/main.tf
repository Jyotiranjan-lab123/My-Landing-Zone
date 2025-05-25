resource "azurerm_public_ip" "lbblock" {
    for_each = var.lbdetails
  name                = "PublicIPForLB"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "az_lb" {
    for_each = var.lbdetails
  name                = "TestLoadBalancer"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lbblock[each.key].id
  }
}