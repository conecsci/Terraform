resource "azurerm_cosmosdb_account" "cosmos" {
  name                = var.cosmos_name
  location            = var.location
  resource_group_name = var.rg_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  public_network_access_enabled = false

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "CustomerDB"
  resource_group_name = var.rg_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
}

resource "azurerm_cosmosdb_sql_container" "container" {
  name                = "Customers"
  resource_group_name = var.rg_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
  database_name       = azurerm_cosmosdb_sql_database.db.name
  partition_key_paths = ["/CustomerId"]
}
