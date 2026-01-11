resource "azurerm_cosmosdb_sql_container" "cosmosdb_sql_containers" {
  for_each = var.cosmosdb_sql_containers

  account_name           = each.value.account_name
  database_name          = each.value.database_name
  name                   = each.value.name
  partition_key_paths    = each.value.partition_key_paths
  resource_group_name    = each.value.resource_group_name
  analytical_storage_ttl = each.value.analytical_storage_ttl
  default_ttl            = each.value.default_ttl
  partition_key_kind     = each.value.partition_key_kind
  partition_key_version  = each.value.partition_key_version
  throughput             = each.value.throughput

  dynamic "autoscale_settings" {
    for_each = each.value.autoscale_settings != null ? [each.value.autoscale_settings] : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }

  dynamic "conflict_resolution_policy" {
    for_each = each.value.conflict_resolution_policy != null ? [each.value.conflict_resolution_policy] : []
    content {
      conflict_resolution_path      = conflict_resolution_policy.value.conflict_resolution_path
      conflict_resolution_procedure = conflict_resolution_policy.value.conflict_resolution_procedure
      mode                          = conflict_resolution_policy.value.mode
    }
  }

  dynamic "indexing_policy" {
    for_each = each.value.indexing_policy != null ? [each.value.indexing_policy] : []
    content {
      dynamic "composite_index" {
        for_each = indexing_policy.value.composite_index != null ? [indexing_policy.value.composite_index] : []
        content {
          index {
            order = composite_index.value.index.order
            path  = composite_index.value.index.path
          }
        }
      }
      dynamic "excluded_path" {
        for_each = indexing_policy.value.excluded_path != null ? [indexing_policy.value.excluded_path] : []
        content {
          path = excluded_path.value.path
        }
      }
      dynamic "included_path" {
        for_each = indexing_policy.value.included_path != null ? [indexing_policy.value.included_path] : []
        content {
          path = included_path.value.path
        }
      }
      indexing_mode = indexing_policy.value.indexing_mode
      dynamic "spatial_index" {
        for_each = indexing_policy.value.spatial_index != null ? [indexing_policy.value.spatial_index] : []
        content {
          path = spatial_index.value.path
        }
      }
    }
  }

  dynamic "unique_key" {
    for_each = each.value.unique_key != null ? [each.value.unique_key] : []
    content {
      paths = unique_key.value.paths
    }
  }
}

