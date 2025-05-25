resource "azurerm_bastion_host" "bsblock" {
  for_each            = var.bastion_hosts
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "my-ip-configuration"
    subnet_id            = data.azurerm_subnet.data-bastion[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data-pip[each.key].id
  }
}
