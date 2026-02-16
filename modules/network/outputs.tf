output "subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
