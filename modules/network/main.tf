resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "private_endpoints" {
  name                 = "private-endpoints-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]

  private_endpoint_network_policies = "Disabled"
}
