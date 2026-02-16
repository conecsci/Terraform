resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_server_name
  location                     = var.location
  resource_group_name          = var.rg_name
  version                      = "12.0"
  administrator_login          = var.sql_admin
  administrator_login_password = var.sql_password

  public_network_access_enabled = false
}

resource "azurerm_mssql_database" "db" {
  name      = "sqldb"
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "Basic"
}
