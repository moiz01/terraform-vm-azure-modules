

# Azure Provider source and version being used
terraform {
  required_version = ">=1.0.0,<2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  # Configuration options
  features {}
  skip_provider_registration = true
}


##############
# Create VNET
###############

resource "azurerm_virtual_network" "primary" {
  name                = var.network_info.vnet_name
  resource_group_name = var.network_info.rg_name
  address_space       = [var.network_info.vnet_cidr]
  location            = var.network_info.region

  tags = merge(
    local.tags,
    {
      name = "${var.network_info.vnet_name}"
    }
  )
  # depends_on = [azurerm_resource_group.rg]
}


###############################
# Create Public  Web Subnets [DMZ]
#################################
resource "azurerm_subnet" "web" {
  count                = length(var.network_info.web_subnet_names)
  name                 = var.network_info.web_subnet_names[count.index]
  resource_group_name  = var.network_info.rg_name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["192.168.0.0/24"]
  # address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index)]
  depends_on = [azurerm_virtual_network.primary]

}
###############################
# Create Public  API Subnets 
#################################
resource "azurerm_subnet" "api" {
  count                = length(var.network_info.api_subnet_names)
  name                 = var.network_info.api_subnet_names[count.index]
  resource_group_name  = var.network_info.rg_name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["192.168.1.0/24"]
  # address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index)]
  depends_on = [azurerm_virtual_network.primary]

}

###############################
# Create Private App Subnets 
#################################
resource "azurerm_subnet" "app" {
  count                = length(var.network_info.app_subnet_names)
  name                 = var.network_info.app_subnet_names[count.index]
  resource_group_name  = var.network_info.rg_name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["192.168.3.0/24"]
  # address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index)]
  depends_on = [azurerm_virtual_network.primary]

}
###############################
# Create Private  Data Subnets 
#################################
resource "azurerm_subnet" "data" {
  count                = length(var.network_info.data_subnet_names)
  name                 = var.network_info.data_subnet_names[count.index]
  resource_group_name  = var.network_info.rg_name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["192.168.4.0/24"]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql"]
  # address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index)]
  depends_on = [azurerm_virtual_network.primary]

}

###############################
# Create Management Subnets 
#################################
resource "azurerm_subnet" "mgt" {
  count                = length(var.network_info.mgt_subnet_names)
  name                 = var.network_info.mgt_subnet_names[count.index]
  resource_group_name  = var.network_info.rg_name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["192.168.5.0/24"]

  # address_prefixes = [cidrsubnet(var.vnet_cidr, 8, count.index)]
  depends_on = [azurerm_virtual_network.primary]

}
locals {

  tags = {
    Environment = "Production"
    Department  = "Finance"
    CreatedBy   = "Terraform"
  }
}

