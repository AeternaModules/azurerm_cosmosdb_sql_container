output "cosmosdb_sql_containers_id" {
  description = "Map of id values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cosmosdb_sql_containers_account_name" {
  description = "Map of account_name values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.account_name if v.account_name != null && length(v.account_name) > 0 }
}
output "cosmosdb_sql_containers_analytical_storage_ttl" {
  description = "Map of analytical_storage_ttl values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.analytical_storage_ttl if v.analytical_storage_ttl != null }
}
output "cosmosdb_sql_containers_autoscale_settings" {
  description = "Map of autoscale_settings values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.autoscale_settings if v.autoscale_settings != null && length(v.autoscale_settings) > 0 }
}
output "cosmosdb_sql_containers_conflict_resolution_policy" {
  description = "Map of conflict_resolution_policy values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.conflict_resolution_policy if v.conflict_resolution_policy != null && length(v.conflict_resolution_policy) > 0 }
}
output "cosmosdb_sql_containers_database_name" {
  description = "Map of database_name values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.database_name if v.database_name != null && length(v.database_name) > 0 }
}
output "cosmosdb_sql_containers_default_ttl" {
  description = "Map of default_ttl values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.default_ttl if v.default_ttl != null }
}
output "cosmosdb_sql_containers_indexing_policy" {
  description = "Map of indexing_policy values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.indexing_policy if v.indexing_policy != null && length(v.indexing_policy) > 0 }
}
output "cosmosdb_sql_containers_name" {
  description = "Map of name values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cosmosdb_sql_containers_partition_key_kind" {
  description = "Map of partition_key_kind values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.partition_key_kind if v.partition_key_kind != null && length(v.partition_key_kind) > 0 }
}
output "cosmosdb_sql_containers_partition_key_paths" {
  description = "Map of partition_key_paths values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.partition_key_paths if v.partition_key_paths != null && length(v.partition_key_paths) > 0 }
}
output "cosmosdb_sql_containers_partition_key_version" {
  description = "Map of partition_key_version values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.partition_key_version if v.partition_key_version != null }
}
output "cosmosdb_sql_containers_resource_group_name" {
  description = "Map of resource_group_name values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "cosmosdb_sql_containers_throughput" {
  description = "Map of throughput values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.throughput if v.throughput != null }
}
output "cosmosdb_sql_containers_unique_key" {
  description = "Map of unique_key values across all cosmosdb_sql_containers, keyed the same as var.cosmosdb_sql_containers"
  value       = { for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : k => v.unique_key if v.unique_key != null && length(v.unique_key) > 0 }
}

