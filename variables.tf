variable "cosmosdb_sql_containers" {
  description = <<EOT
Map of cosmosdb_sql_containers, attributes below
Required:
    - account_name
    - database_name
    - name
    - partition_key_paths
    - resource_group_name
Optional:
    - analytical_storage_ttl
    - default_ttl
    - partition_key_kind
    - partition_key_version
    - throughput
    - autoscale_settings (block):
        - max_throughput (optional)
    - conflict_resolution_policy (block):
        - conflict_resolution_path (optional)
        - conflict_resolution_procedure (optional)
        - mode (required)
    - indexing_policy (block):
        - composite_index (optional, block):
            - index (required, block):
                - order (required)
                - path (required)
        - excluded_path (optional, block):
            - path (required)
        - included_path (optional, block):
            - path (required)
        - indexing_mode (optional)
        - spatial_index (optional, block):
            - path (required)
    - unique_key (block):
        - paths (required)
EOT

  type = map(object({
    account_name           = string
    database_name          = string
    name                   = string
    partition_key_paths    = list(string)
    resource_group_name    = string
    analytical_storage_ttl = optional(number)
    default_ttl            = optional(number)
    partition_key_kind     = optional(string, "Hash")
    partition_key_version  = optional(number)
    throughput             = optional(number)
    autoscale_settings = optional(object({
      max_throughput = optional(number)
    }))
    conflict_resolution_policy = optional(object({
      conflict_resolution_path      = optional(string)
      conflict_resolution_procedure = optional(string)
      mode                          = string
    }))
    indexing_policy = optional(object({
      composite_index = optional(object({
        index = object({
          order = string
          path  = string
        })
      }))
      excluded_path = optional(object({
        path = string
      }))
      included_path = optional(object({
        path = string
      }))
      indexing_mode = optional(string, "consistent")
      spatial_index = optional(object({
        path = string
      }))
    }))
    unique_key = optional(object({
      paths = set(string)
    }))
  }))
}

