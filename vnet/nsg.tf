
###########
# Create Web NSG
############
resource "azurerm_network_security_group" "web" {
  count               = length(var.network_info.web_nsg_names)
  name                = var.network_info.web_nsg_names[count.index]
  resource_group_name = var.network_info.rg_name
  location            = var.network_info.region
  tags                = merge(local.tags, { name = "${var.network_info.vnet_name}-${var.network_info.web_nsg_names[count.index]}-nsg" })
  depends_on          = [azurerm_subnet.web]
}

###########
# Create api NSG
############
resource "azurerm_network_security_group" "api" {
  count               = length(var.network_info.api_nsg_names)
  name                = var.network_info.api_nsg_names[count.index]
  resource_group_name = var.network_info.rg_name
  location            = var.network_info.region
  tags                = merge(local.tags, { name = "${var.network_info.vnet_name}-${var.network_info.api_nsg_names[count.index]}-nsg" })
  depends_on          = [azurerm_subnet.api]
}
###########
# Create app NSG
############
resource "azurerm_network_security_group" "app" {
  count               = length(var.network_info.app_nsg_names)
  name                = var.network_info.app_nsg_names[count.index]
  resource_group_name = var.network_info.rg_name
  location            = var.network_info.region
  tags                = merge(local.tags, { name = "${var.network_info.vnet_name}-${var.network_info.app_nsg_names[count.index]}-nsg" })
  depends_on          = [azurerm_subnet.app]
}
###########
# Create data NSG
############
resource "azurerm_network_security_group" "data" {
  count               = length(var.network_info.data_nsg_names)
  name                = var.network_info.data_nsg_names[count.index]
  resource_group_name = var.network_info.rg_name
  location            = var.network_info.region
  tags                = merge(local.tags, { name = "${var.network_info.vnet_name}-${var.network_info.data_nsg_names[count.index]}-nsg" })
  depends_on          = [azurerm_subnet.data]
}

###########
# Create mgt NSG
############
resource "azurerm_network_security_group" "mgt" {
  count               = length(var.network_info.mgt_nsg_names)
  name                = var.network_info.mgt_nsg_names[count.index]
  resource_group_name = var.network_info.rg_name
  location            = var.network_info.region
  tags                = merge(local.tags, { name = "${var.network_info.vnet_name}-${var.network_info.mgt_nsg_names[count.index]}" })
  depends_on          = [azurerm_subnet.mgt]
}
#################
# Create NSG Rules
##################
resource "azurerm_network_security_rule" "web" {
  count                       = length(var.network_info.web_rules)
  name                        = var.network_info.web_rules[count.index].name
  resource_group_name         = var.network_info.rg_name
  network_security_group_name = var.network_info.web_nsg_names[0]
  protocol                    = var.network_info.web_rules[count.index].protocol
  source_port_range           = var.network_info.web_rules[count.index].source_port_range
  destination_port_range      = var.network_info.web_rules[count.index].destination_port_range
  source_address_prefix       = var.network_info.web_rules[count.index].source_address_prefix
  destination_address_prefix  = var.network_info.web_rules[count.index].destination_address_prefix
  access                      = var.network_info.web_rules[count.index].access
  priority                    = var.network_info.web_rules[count.index].priority
  direction                   = var.network_info.web_rules[count.index].direction


  depends_on = [azurerm_network_security_group.web]

}

resource "azurerm_network_security_rule" "api" {
  count                       = length(var.network_info.api_rules)
  name                        = var.network_info.api_rules[count.index].name
  resource_group_name         = var.network_info.rg_name
  network_security_group_name = var.network_info.api_nsg_names[0]
  protocol                    = var.network_info.api_rules[count.index].protocol
  source_port_range           = var.network_info.api_rules[count.index].source_port_range
  destination_port_range      = var.network_info.api_rules[count.index].destination_port_range
  source_address_prefix       = var.network_info.api_rules[count.index].source_address_prefix
  destination_address_prefix  = var.network_info.api_rules[count.index].destination_address_prefix
  access                      = var.network_info.api_rules[count.index].access
  priority                    = var.network_info.api_rules[count.index].priority
  direction                   = var.network_info.api_rules[count.index].direction


  depends_on = [azurerm_network_security_group.api]

}
resource "azurerm_network_security_rule" "app" {
  count                       = length(var.network_info.app_rules)
  name                        = var.network_info.app_rules[count.index].name
  resource_group_name         = var.network_info.rg_name
  network_security_group_name = var.network_info.app_nsg_names[0]
  protocol                    = var.network_info.app_rules[count.index].protocol
  source_port_range           = var.network_info.app_rules[count.index].source_port_range
  destination_port_range      = var.network_info.app_rules[count.index].destination_port_range
  source_address_prefix       = var.network_info.app_rules[count.index].source_address_prefix
  destination_address_prefix  = var.network_info.app_rules[count.index].destination_address_prefix
  access                      = var.network_info.app_rules[count.index].access
  priority                    = var.network_info.app_rules[count.index].priority
  direction                   = var.network_info.app_rules[count.index].direction


  depends_on = [azurerm_network_security_group.app]

}
resource "azurerm_network_security_rule" "data" {
  count                       = length(var.network_info.data_rules)
  name                        = var.network_info.data_rules[count.index].name
  resource_group_name         = var.network_info.rg_name
  network_security_group_name = var.network_info.data_nsg_names[0]
  protocol                    = var.network_info.data_rules[count.index].protocol
  source_port_range           = var.network_info.data_rules[count.index].source_port_range
  destination_port_range      = var.network_info.data_rules[count.index].destination_port_range
  source_address_prefix       = var.network_info.data_rules[count.index].source_address_prefix
  destination_address_prefix  = var.network_info.data_rules[count.index].destination_address_prefix
  access                      = var.network_info.data_rules[count.index].access
  priority                    = var.network_info.data_rules[count.index].priority
  direction                   = var.network_info.data_rules[count.index].direction


  depends_on = [azurerm_network_security_group.data]

}

resource "azurerm_network_security_rule" "mgt" {
  count                       = length(var.network_info.mgt_rules)
  name                        = var.network_info.mgt_rules[count.index].name
  resource_group_name         = var.network_info.rg_name
  network_security_group_name = var.network_info.mgt_nsg_names[0]
  protocol                    = var.network_info.mgt_rules[count.index].protocol
  source_port_range           = var.network_info.mgt_rules[count.index].source_port_range
  destination_port_range      = var.network_info.mgt_rules[count.index].destination_port_range
  source_address_prefix       = var.network_info.mgt_rules[count.index].source_address_prefix
  destination_address_prefix  = var.network_info.mgt_rules[count.index].destination_address_prefix
  access                      = var.network_info.mgt_rules[count.index].access
  priority                    = var.network_info.mgt_rules[count.index].priority
  direction                   = var.network_info.mgt_rules[count.index].direction


  depends_on = [azurerm_network_security_group.mgt]

}