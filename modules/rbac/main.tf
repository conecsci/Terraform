resource "azurerm_role_assignment" "sql_access" {
  scope                = var.sql_scope
  role_definition_name = "SQL DB Contributor"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "cosmos_access" {
  scope                = var.cosmos_scope
  role_definition_name = "Cosmos DB Built-in Data Contributor"
  principal_id         = var.principal_id
}
