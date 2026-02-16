resource "azurerm_data_factory_linked_service_azure_sql_database" "sql_ls" {
  name            = "AzureSqlLS"
  data_factory_id = var.adf_id
  use_managed_identity = true
}

resource "azurerm_data_factory_linked_service_cosmosdb" "cosmos_ls" {
  name            = "CosmosLS"
  data_factory_id = var.adf_id
}

resource "azurerm_data_factory_pipeline" "copy_pipeline" {
  name            = "CopyCustomersPipeline"
  data_factory_id = var.adf_id

  activities_json = <<JSON
[
  {
    "name": "CopySQLToCosmos",
    "type": "Copy",
    "typeProperties": {
      "source": { "type": "SqlSource" },
      "sink": { "type": "CosmosDbSqlApiSink" }
    }
  }
]
JSON
}
