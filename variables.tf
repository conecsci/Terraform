variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "VNet Name"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server Name"
  type        = string
}

variable "sql_admin" {
  description = "SQL Admin Username"
  type        = string
}

variable "sql_password" {
  description = "SQL Admin Password"
  type        = string
  sensitive   = true
}

variable "cosmos_name" {
  description = "Cosmos DB Account Name"
  type        = string
}

variable "adf_name" {
  description = "Azure Data Factory Name"
  type        = string
}
