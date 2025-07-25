


variable "network_info" {
  type = object({
    region            = string
    rg_name           = string
    zones            = optional(list(string), [])
    vnet_name         = string
    vnet_cidr         = string
    web_subnet_names  = list(string)
    api_subnet_names  = list(string)
    app_subnet_names  = list(string)
    data_subnet_names = list(string)
    mgt_subnet_names  = list(string)
    web_nsg_names     = list(string)
    api_nsg_names     = list(string)
    app_nsg_names     = list(string)
    data_nsg_names    = list(string)
    mgt_nsg_names     = list(string)
    web_nic_names     = list(string)
    web_nic_private_ip_addresss = list(string)
    api_nic_names     = list(string)
    app_nic_names     = list(string)
    data_nic_names    = list(string)
    pip_names         = list(string)
    web_rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
    api_rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
    app_rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
    data_rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
    mgt_rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))


  })
  default = {
    region            = "eastus"
    rg_name           = "rg01"
    zones            = []
    vnet_name         = "ntier-primary"
    vnet_cidr         = "192.168.0.0/16"
    web_subnet_names  = ["web1"]
    api_subnet_names  = ["api1"]
    app_subnet_names  = ["app1"]
    data_subnet_names = ["data1"]
    mgt_subnet_names  = ["mgt1"]
    web_nsg_names     = ["web1-nsg"]
    app_nsg_names     = ["app1-nsg"]
    api_nsg_names     = ["api1-nsg"]
    data_nsg_names    = ["data1-nsg"]
    mgt_nsg_names     = ["mgt1-nsg"]

    web_nic_names  = ["web1-nic"]
    web_nic_private_ip_addresss=["92.168.0.20","192.168.0.20"]
    api_nic_names  = ["api1-nic"]
    app_nic_names  = ["app1-nic"]
    data_nic_names = ["data1-nic"]
    pip_names      = ["web1-pip","web2-pip"]

    web_rules = [{
      name                       = "AllowHttp"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 300
      direction                  = "Inbound"

      },
      {
        name                       = "AllowSSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 320
        direction                  = "Inbound"


      },
      {
        name                       = "AllowHTTPS"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 330
        direction                  = "Inbound"


      },
      {
        name                       = "AllowTraffic"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 100
        direction                  = "Inbound"

    }]
    app_rules = [{
      name                       = "AppsToData"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "192.168.3.0/24"
      destination_address_prefix = "192.168.2.0/24"
      access                     = "Allow"
      priority                   = 300
      direction                  = "Inbound"

      },
      {
        name                       = "AllowSSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 320
        direction                  = "Inbound"


      },
      {
        name                       = "DenyAll"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Deny"
        priority                   = 330
        direction                  = "Inbound"


      }
      ]


    api_rules = [{
      name                       = "AllowHttp"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 300
      direction                  = "Inbound"

      },
      {
        name                       = "AllowSSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 320
        direction                  = "Inbound"


      },
      {
        name                       = "AllowHTTPS"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 330
        direction                  = "Inbound"


      },
      {
        name                       = "AllowTraffic"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 100
        direction                  = "Inbound"

    }]


    data_rules = [{
      name                       = "AllowHttp"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 300
      direction                  = "Inbound"

      },
      {
        name                       = "AllowSSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 320
        direction                  = "Inbound"


      },
      {
        name                       = "AllowHTTPS"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 330
        direction                  = "Inbound"


      },
      {
        name                       = "AllowTraffic"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 100
        direction                  = "Inbound"

    }]


    mgt_rules = [{
      name                       = "AllowHttp"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = 300
      direction                  = "Inbound"

      },
      {
        name                       = "AllowSSH"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 320
        direction                  = "Inbound"


      },
      {
        name                       = "AllowHTTPS"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 330
        direction                  = "Inbound"


      },
      {
        name                       = "AllowTraffic"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 100
        direction                  = "Inbound"

    }]




  }
}

# variable "tags" {
#   description = "A map of tags to add to all resources"
#   default     = {}
#   type        = map(string)
# }


