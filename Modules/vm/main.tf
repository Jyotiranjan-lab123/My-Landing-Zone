resource "azurerm_virtual_machine" "vm-block" {
  for_each              = var.vm_details
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [data.azurerm_network_interface.nicdatasource[each.key].id]
    vm_size               = each.value.vm_size

  os_profile {
    computer_name  = "hostname"
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  



  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
 
  os_profile_linux_config {
    disable_password_authentication = false
  }

}
