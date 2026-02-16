
module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}



module "network" {
  source    = "./modules/network"
  rg_name   = module.resource_group.rg_name
  location  = var.location
  vnet_name = var.vnet_name
}



module "sql" {
  source           = "./modules/sql"
  rg_name          = module.resource_group.rg_name
  location         = var.location
  sql_server_name  = var.sql_server_name
  sql_admin        = var.sql_admin
  sql_password     = var.sql_password
}



module "cosmos" {
  source      = "./modules/cosmos"
  rg_name     = module.resource_group.rg_name
  location    = var.location
  cosmos_name = var.cosmos_name
}



module "adf" {
  source   = "./modules/adf"
  rg_name  = module.resource_group.rg_name
  location = var.location
  adf_name = var.adf_name
}



module "sql_private_endpoint" {
  source           = "./modules/private_endpoint"
  rg_name          = module.resource_group.rg_name
  location         = var.location
  subnet_id        = module.network.subnet_id
  resource_id      = module.sql.sql_server_id
  subresource_name = "sqlServer"
  name             = "sql-private-endpoint"
}

module "cosmos_private_endpoint" {
  source           = "./modules/private_endpoint"
  rg_name          = module.resource_group.rg_name
  location         = var.location
  subnet_id        = module.network.subnet_id
  resource_id      = module.cosmos.cosmos_id
  subresource_name = "Sql"
  name             = "cosmos-private-endpoint"
}

module "adf_objects" {
  source            = "./modules/adf_objects"
  adf_id            = module.adf.adf_id
  sql_server_name   = module.sql.sql_server_name
  cosmos_name       = module.cosmos.cosmos_name
}
module "private_dns" {
  source   = "./modules/private_dns"
  rg_name  = module.resource_group.rg_name
  vnet_id  = module.network.vnet_id
}
module "rbac" {
  source         = "./modules/rbac"
  sql_scope      = module.sql.sql_server_id
  cosmos_scope   = module.cosmos.cosmos_id
  principal_id   = module.adf.adf_principal_id
}
