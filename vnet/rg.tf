# data "azurerm_resource_group" "existing" {
#   name = var.network_info.rg_name
# }

# resource "azurerm_resource_group" "rg" {
#   count    = data.azurerm_resource_group.existing.name == "" ? 1 : 0
#   name     = var.network_info.rg_name
#   location = var.network_info.region
#   tags = merge(local.tags, {
#     Name = "Network RG"
#   })
# }
