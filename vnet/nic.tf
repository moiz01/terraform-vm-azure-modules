
##############
# Create Web NIC
##############
resource "azurerm_network_interface" "web1" {
  # count               = length(var.network_info.nic_names)
  name                = var.network_info.web_nic_names[0]
  location            = var.network_info.region
  resource_group_name = var.network_info.rg_name
  ip_configuration {
    name = "internal"
    // todo:
    subnet_id                     = azurerm_subnet.web[0].id
    # private_ip_address_allocation = "Dynamic"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.network_info.web_nic_private_ip_addresss[0]
    public_ip_address_id          = azurerm_public_ip.pip[0].id
  }
  depends_on = [azurerm_public_ip.pip, azurerm_subnet.web]

}
resource "azurerm_network_interface" "web2" {
  # count               = length(var.network_info.nic_names)
  name                = var.network_info.web_nic_names[1]
  location            = var.network_info.region
  resource_group_name = var.network_info.rg_name
  ip_configuration {
    name = "internal"
    // todo:
    subnet_id                     = azurerm_subnet.web[0].id
    # private_ip_address_allocation = "Dynamic"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.network_info.web_nic_private_ip_addresss[1]
    public_ip_address_id          = azurerm_public_ip.pip[1].id
  }
  depends_on = [azurerm_public_ip.pip, azurerm_subnet.web]

}
# resource "azurerm_network_interface" "app" {
#   # count               = length(var.network_info.nic_names)
#   name                = var.network_info.app_nic_names[0]
#   location            = var.network_info.region
#   resource_group_name = var.network_info.rg_name
#   ip_configuration {
#     name = "internal"
#     // todo:
#     subnet_id                     = azurerm_subnet.app[0].id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.pip[1].id
#   }
#   depends_on = [azurerm_public_ip.pip, azurerm_subnet.app]

# }
# resource "azurerm_network_interface" "web2_nic" {
#   # count               = length(var.network_info.nic_names)
#   name                = var.network_info.nic_names[1]
#   location            = var.network_info.region
#   resource_group_name = var.network_info.rg_name
#   ip_configuration {
#     name = "internal"
#     // todo:
#     subnet_id                     = azurerm_subnet.public[1].id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.pip[1].id
#   }
#   depends_on = [azurerm_public_ip.pip, azurerm_subnet.public]

# }



#####################
# NIC NSG ASSOCIATION
#####################

resource "azurerm_network_interface_security_group_association" "web1" {
  network_interface_id      = azurerm_network_interface.web1.id
  network_security_group_id = azurerm_network_security_group.web[0].id
  depends_on                = [azurerm_network_interface.web1, azurerm_network_security_group.web]

}
resource "azurerm_network_interface_security_group_association" "web2" {
  network_interface_id      = azurerm_network_interface.web2.id
  network_security_group_id = azurerm_network_security_group.web[0].id
  depends_on                = [azurerm_network_interface.web2, azurerm_network_security_group.web]

}
# resource "azurerm_network_interface_security_group_association" "app" {
#   network_interface_id      = azurerm_network_interface.app.id
#   network_security_group_id = azurerm_network_security_group.app[0].id
#   depends_on                = [azurerm_network_interface.app, azurerm_network_security_group.app]

# }
# resource "azurerm_network_interface_security_group_association" "web2nsg-nic" {
#   network_interface_id      = azurerm_network_interface.web2_nic.id
#   network_security_group_id = azurerm_network_security_group.nsgs[1].id
#   depends_on                = [azurerm_network_interface.web2_nic, azurerm_network_security_group.nsgs]

# }
# resource "azurerm_network_interface_security_group_association" "app1nsg-nic" {
#   network_interface_id      = azurerm_network_interface.nic[2].id
#   network_security_group_id = azurerm_network_security_group.nsgs[2].id
#   depends_on                = [azurerm_network_interface.nic, azurerm_network_security_group.nsgs]

# }
# resource "azurerm_network_interface_security_group_association" "app2nsg-nic" {
#   network_interface_id      = azurerm_network_interface.nic[3].id
#   network_security_group_id = azurerm_network_security_group.nsgs[3].id
#   depends_on                = [azurerm_network_interface.nic, azurerm_network_security_group.nsgs]

# }
# resource "azurerm_network_interface_security_group_association" "appnsg-nic" {
#   network_interface_id      = azurerm_network_interface.nic[1].id
#   network_security_group_id = azurerm_network_security_group.nsgs[0].id
#   depends_on = [ azurerm_network_interface.nic,azurerm_network_security_group.nsgs ]

# }


# resource "azurerm_network_interface_security_group_association" "datansg-nic" {
#   network_interface_id      = azurerm_network_interface.nic[2].id
#   network_security_group_id = azurerm_network_security_group.nsgs[0].id
#   depends_on = [ azurerm_network_interface.nic,azurerm_network_security_group.nsgs ]

# }