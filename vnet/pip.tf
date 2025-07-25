resource "azurerm_public_ip" "pip" {
  count               = length(var.network_info.pip_names)
  name                = var.network_info.pip_names[count.index]
  resource_group_name = var.network_info.rg_name
  location            = var.network_info.region
  allocation_method   = "Static"
  sku                 = "Standard"
  zones = var.network_info.zones
  depends_on          = [azurerm_network_security_rule.web]
}