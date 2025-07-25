output "vnet_id" {
  value = azurerm_virtual_network.primary.id
}
output "public_subnets_ids" {
  value = azurerm_subnet.web[0].id
}
output "web1_nic_id" {
  value = azurerm_network_interface.web1.id

}
output "web2_nic_id" {
  value = azurerm_network_interface.web2.id

}

output "public_ip_address" {
  value = azurerm_public_ip.pip[0].ip_address

}
