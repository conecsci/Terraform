output "resource_group_name" {
  value = module.resource_group.rg_name
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "cosmos_account_name" {
  value = module.cosmos.cosmos_name
}

output "adf_name" {
  value = module.adf.adf_id
}
