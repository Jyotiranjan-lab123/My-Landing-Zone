rg = {
  rg1 = {
    name     = "my-rg"
    location = "East US"
  }
}
storage-module = {
  stg1 = {
    name                     = "mystorageaccount933"
    resource_group_name      = "my-rg"
    location                 = "East US"
    account_replication_type = "LRS"
    account_tier             = "Standard"

  }
}
rkvnet = {
  vnet1 = {
    name                = "myvnet"
    resource_group_name = "my-rg"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "myvnet2"
    resource_group_name = "my-rg"
    location            = "East US"
    address_space       = ["10.1.0.0/16"]
  }
}
rksubnet = {
  subnet1 = {
    name                 = "mysubnet"
    resource_group_name  = "my-rg"
    virtual_network_name = "myvnet"
    location             = "East US"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "my-rg"
    virtual_network_name = "myvnet"
    location             = "East US"
    address_prefixes     = ["10.0.1.0/26"]
  }
}
nic-details = {
  nic1 = {
    name                 = "mynic"
    resource_group_name  = "my-rg"
    location             = "East US"
    subnet_name          = "mysubnet"
    virtual_network_name = "myvnet"
  }
}
pip = {
  pip1 = {
    name                 = "mynic"
    resource_group_name  = "my-rg"
    location             = "East US"
    subnet_name          = "mysubnet"
    virtual_network_name = "myvnet"
    allocation_method    = "Static"
  }
}
virtualm = {
  vm1 = {
    name                   = "myvm"
    resource_group_name    = "my-rg"
    location               = "East US"
    vm_size                = "Standard_B1s"
    admin_username         = "azureuser"
    admin_password         = "P@ssw0rd1234!"
    network_interface_name = "mynic"
    public_ip_name         = "mypip"
  }
}
bsdetails = {
  bs1 = {
    name                 = "my-bastion-host"
    resource_group_name  = "my-rg"
    location             = "East US"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "myvnet"
    public_ip_name       = "mynic"
  }
}
lb = {
  lb1 = {
    name                 = "my-load-balancer"
    resource_group_name  = "my-rg"
    location             = "East US"
    frontend_ip_name     = "mypip"
    backend_pool_name    = "my-backend-pool"
    probe_name           = "my-probe"
    rule_name            = "my-rule"
    frontend_ip_config   = "PublicIPAddress"
    backend_address_pool = "my-backend-pool"
  }
}
peering-details = {
  peering1 = {
    name                         = "myvnet-to-myvnet2"
    resource_group_name          = "my-rg"
    virtual_network_name         = "myvnet"
    remote_virtual_network_id    = "/subscriptions/0cead613-b99d-4057-9b73-e282208bb4c4/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/myvnet2"

    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
  peering2 = {
    name                         = "myvnet2-to-myvnet"
    resource_group_name          = "my-rg"
    virtual_network_name         = "myvnet2"
    remote_virtual_network_id    = "/subscriptions/0cead613-b99d-4057-9b73-e282208bb4c4/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/vnet1"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = false
    allow_gateway_transit        = false
    use_remote_gateways          = false

  }
}
nsgdetails = {
  nsg1 = {
    name                = "myNewnsg"
    location            = "East US"
    resource_group_name = "my-rg"


  }
}
