variable "aks_cluster" {
  description = "Map of AKS cluster definitions"
  type = map(object({
    cluster_name       = string
    location           = string
    rg_name            = string
    kubernetes_version = string
    node_pool          = map(any)
    network_plugin     = string
    network_policy     = string
    tags               = map(string)
  }))
  default = {}
}