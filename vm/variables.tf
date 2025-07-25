
variable "vm_info" {
  type = object({
    name                   = string
    size                   = string
    admin_username         = string
    zone                   = optional(string, null)
    rg_name                = string
    location               = string
    script_path            = string
    public_key_path        = string
    public_key_name        = string
    private_key_name       = string
    network_interface_name = string
    public_ip_name         = string
    os_disk_caching        = string
    os_disk_storage_account_type = string
    # source_image_reference_publisher = string
    # source_image_reference_offer=string
    # source_image_reference_sku=string
    # source_image_reference_version=string
    tags                  = map(string)




  })
  default = {
    name                   = ""
    size                   = ""
    admin_username         = ""
    zone                  = ""
    rg_name                = ""
    location               = ""
    script_path            = ""
    public_key_path        = ""
    public_key_name        = ""
    private_key_name       = ""
    network_interface_name = ""
    public_ip_name         = ""
    os_disk_caching        = ""
    os_disk_storage_account_type = ""
    # source_image_reference_publisher = ""
    # source_image_reference_offer=""
    # source_image_reference_sku=""
    # source_image_reference_version=""
    tags                  = {}

  }



}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "sig_resource_group" {
  description = "Resource group containing the Shared Image Gallery"
  type        = string
  default     = "myResourceGroup"
}

variable "gallery_name" {
  description = "Shared Image Gallery name"
  type        = string
  default     = "myGallery"
}

variable "image_definition_name" {
  description = "Image definition name"
  type        = string
  default     = "myImageDefinition"
}

variable "image_version" {
  description = "Image version"
  type        = string
  default     = "1.0.0"
}


