
# terraform {
#   required_version = ">=1.0.0,<2.0.0"
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "3.85.0"
#     }
#   }
# }

# backend "s3" {

#   # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
#   # manually, uncomment and fill in the config below.

#   bucket         = "happynewyear2024-stage-state"
#   key            = "stage/data-stores/mysql/terraform.tfstate"
#   region         = "us-east-2"
#   dynamodb_table = "happynewyear2024-stage-locks"
#   encrypt        = true

# }

# Configure the Microsoft Azure Provider
# provider "azurerm" {
#   # Configuration options
#   features {

#   }
#   skip_provider_registration = true
# }


resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_info.name
  location            = var.vm_info.location
  resource_group_name = var.vm_info.rg_name
  size                = var.vm_info.size
  admin_username      = var.vm_info.admin_username
  zone = var.vm_info.zone
  network_interface_ids = [data.azurerm_network_interface.nic.id]
  admin_ssh_key {
    username   = var.vm_info.admin_username
    public_key = file("${var.vm_info.public_key_path}")
  }
    os_disk {
    caching              = var.vm_info.os_disk_caching
    storage_account_type = var.vm_info.os_disk_storage_account_type
  }
    source_image_id = "/subscriptions/${var.subscription_id}/resourceGroups/${var.sig_resource_group}/providers/Microsoft.Compute/galleries/${var.gallery_name}/images/${var.image_definition_name}/versions/${var.image_version}"

  # source_image_reference {
  #   publisher = var.vm_info.source_image_reference_publisher
  #   offer     = var.vm_info.source_image_reference_offer
  #   sku       = var.vm_info.source_image_reference_sku
  #   version   = var.vm_info.source_image_reference_version
    
  # }

  #   source_image_reference {
  #   publisher = "Canonical"
  #   offer     = "0001-com-ubuntu-server-jammy"
  #   sku       = "22_04-lts"
  #   version   = "latest"
  # }
  #   source_image_reference {
  #   publisher = "myOrg2"
  #   offer     = "ubuntu-nginx2"
  #   sku       = "22-04"
  #   version   = "1.0.0"
  # }

  # custom_data = base64encode(data.template_file.init-wp-server.rendered)

  tags       = var.vm_info.tags
  # depends_on = [data.azurerm_public_ip.pip, data.azurerm_network_interface.nic, data.template_file.init-wp-server]
    depends_on = [data.azurerm_public_ip.pip, data.azurerm_network_interface.nic]
}


