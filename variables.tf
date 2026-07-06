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
    partition_key_kind     = optional(string) # Default: "Hash"
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
        index = list(object({
          order = string
          path  = string
        }))
      }))
      excluded_path = optional(object({
        path = string
      }))
      included_path = optional(object({
        path = string
      }))
      indexing_mode = optional(string) # Default: "consistent"
      spatial_index = optional(object({
        path = string
      }))
    }))
    unique_key = optional(object({
      paths = set(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        length(v.indexing_policy.composite_index.index) >= 1
      )
    ])
    error_message = "Each index list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        length(v.partition_key_paths) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.partition_key_version == null || (v.partition_key_version >= 1 && v.partition_key_version <= 2)
      )
    ])
    error_message = "must be between 1 and 2"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.conflict_resolution_policy == null || (v.conflict_resolution_policy.conflict_resolution_path == null || (length(v.conflict_resolution_policy.conflict_resolution_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.conflict_resolution_policy == null || (v.conflict_resolution_policy.conflict_resolution_procedure == null || (length(v.conflict_resolution_policy.conflict_resolution_procedure) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.analytical_storage_ttl == null || (v.analytical_storage_ttl >= -1)
      )
    ])
    error_message = "must be at least -1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.default_ttl == null || (v.default_ttl >= -1)
      )
    ])
    error_message = "must be at least -1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.unique_key == null || (length(v.unique_key.paths) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.indexing_policy == null || (v.indexing_policy.included_path == null || (length(v.indexing_policy.included_path.path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_sql_containers : (
        v.indexing_policy == null || (v.indexing_policy.excluded_path == null || (length(v.indexing_policy.excluded_path.path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_cosmosdb_sql_container's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.CosmosEntityName] len(value) < 1 || len(value) > 255
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: account_name
  #   source:    [from validate.CosmosAccountName] !matched
  # path: database_name
  #   source:    [from validate.CosmosEntityName] len(value) < 1 || len(value) > 255
  # path: partition_key_kind
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conflict_resolution_policy.mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: throughput
  #   source:    [from validate.CosmosThroughput] value < 400
  # path: throughput
  #   source:    [from validate.CosmosThroughput] value%100 != 0
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] !ok
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] v < 1000
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] v%1000 != 0
  # path: indexing_policy.indexing_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

