module "rgmodule" {
  source     = "../../Modules/Resource_group"
  rg-details = var.rg

}
module "stgmodule" {
  depends_on      = [module.rgmodule]
  source          = "../../Modules/Storage_account"
  storage-details = var.storage-module
}
module "vnetmodule" {
  depends_on   = [module.rgmodule]
  source       = "../../Modules/vnet"
  vnet-details = var.rkvnet
}
module "subnetmodule" {
  depends_on     = [module.vnetmodule]
  source         = "../../Modules/Subnet"
  subnet-details = var.rksubnet
}
module "nicmodule" {
  depends_on  = [module.rgmodule, module.vnetmodule, module.subnetmodule]
  source      = "../../Modules/Nic"
  nic-details = var.nic-details

}
module "mypip" {
  depends_on = [module.rgmodule, module.vnetmodule, module.subnetmodule, module.nicmodule]
  source     = "../../Modules/pip"
  public_ip  = var.pip

}
module "vm_module" {
  depends_on = [module.rgmodule, module.vnetmodule, module.subnetmodule, module.nicmodule, module.mypip]
  source     = "../../Modules/vm"
  vm_details = var.virtualm

}
module "bastion-bsblock" {
  source        = "../../Modules/bastion"
  bastion_hosts = var.bsdetails
  depends_on    = [module.rgmodule, module.vnetmodule, module.subnetmodule, module.nicmodule, module.mypip]

}
module "lbmodule" {
  source     = "../../Modules/Lb"
  lbdetails  = var.lb
  depends_on = [module.rgmodule, module.vnetmodule, module.subnetmodule, module.nicmodule, module.mypip]

}
module "vnpmodule" {
  source = "../../Modules/vnetpeering"
  vnetpeer = var.peering-details
  depends_on = [ module.rgmodule, module.vnetmodule ]
  
}
module "nsgmodule" {
  source = "../../Modules/Nsg"
  depends_on = [ module.rgmodule, module.vm_module ]
  mynsg = var.nsgdetails
}