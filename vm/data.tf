# data "template_file" "init-wp-server" {
#   template = file("${path.module}/user-data.tftpl")
# }

data "azurerm_public_ip" "pip" {
  name                = var.vm_info.public_ip_name
  resource_group_name = var.vm_info.rg_name
}

data "azurerm_network_interface" "nic" {
  name                = var.vm_info.network_interface_name
  resource_group_name = var.vm_info.rg_name
}
