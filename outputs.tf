output "cosmosdb_sql_containers" {
  description = "All cosmosdb_sql_container resources"
  value       = azurerm_cosmosdb_sql_container.cosmosdb_sql_containers
}
output "cosmosdb_sql_containers_account_name" {
  description = "List of account_name values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.account_name]
}
output "cosmosdb_sql_containers_analytical_storage_ttl" {
  description = "List of analytical_storage_ttl values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.analytical_storage_ttl]
}
output "cosmosdb_sql_containers_autoscale_settings" {
  description = "List of autoscale_settings values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.autoscale_settings]
}
output "cosmosdb_sql_containers_conflict_resolution_policy" {
  description = "List of conflict_resolution_policy values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.conflict_resolution_policy]
}
output "cosmosdb_sql_containers_database_name" {
  description = "List of database_name values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.database_name]
}
output "cosmosdb_sql_containers_default_ttl" {
  description = "List of default_ttl values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.default_ttl]
}
output "cosmosdb_sql_containers_indexing_policy" {
  description = "List of indexing_policy values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.indexing_policy]
}
output "cosmosdb_sql_containers_name" {
  description = "List of name values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.name]
}
output "cosmosdb_sql_containers_partition_key_kind" {
  description = "List of partition_key_kind values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.partition_key_kind]
}
output "cosmosdb_sql_containers_partition_key_paths" {
  description = "List of partition_key_paths values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.partition_key_paths]
}
output "cosmosdb_sql_containers_partition_key_version" {
  description = "List of partition_key_version values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.partition_key_version]
}
output "cosmosdb_sql_containers_resource_group_name" {
  description = "List of resource_group_name values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.resource_group_name]
}
output "cosmosdb_sql_containers_throughput" {
  description = "List of throughput values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.throughput]
}
output "cosmosdb_sql_containers_unique_key" {
  description = "List of unique_key values across all cosmosdb_sql_containers"
  value       = [for k, v in azurerm_cosmosdb_sql_container.cosmosdb_sql_containers : v.unique_key]
}

