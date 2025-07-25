variable "name" {
  description = "The name of the resource group."
  type        = string
  default = ""
  
}
variable "region" {
  description = "The Azure region where the resource group will be created."
  type        = string
  default     = ""
  
}
variable "tags" {
  type = map(string)
  description = "A map of tags to add to all resources"
  default = {
    environment = ""
    Terraform   = ""
    CreatedOn   = ""
    Project     = ""
    Owner       = ""
    Version     = ""
  }
  
}