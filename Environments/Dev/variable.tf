variable "rg" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

variable "aks_cluster" {
  type = map(object({
    cluster_name       = string
    location           = string
    rg_name            = string
    kubernetes_version = string
    node_pool = map(object({
      name            = string
      vm_size         = string
      node_count      = number
      os_disk_size_gb = optional(number)
      type            = optional(string)
      zones           = optional(list(string))
      min_count       = optional(number)
      max_count       = optional(number)
    }))
    network_plugin = string
    network_policy = string
    tags           = map(string)
  }))
}