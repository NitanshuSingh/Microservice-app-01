module "rg" {
  source = "../../Modules/azurerm_resource_group"
  resource_groups = var.rg
}

module "aks" {
depends_on = [ module.rg ]
  source = "../../Modules/azurerm_azure_kubernetes_service"
  aks_cluster = var.aks_cluster

}

variable "rg" {
  type = map(object({
    rg_name = string
    location = string
    managed_by = string
    tags = map(string)  
  }))
}

variable "aks_cluster" {
  type = map(object({
    cluster_name = string
    location = string
    rg_name = string
    kubernetes_version = string
    node_pool = map(object({ 
      name = string
      vm_size = string
      node_count = number
      os_disk_size_gb = optional(number)
      type = optional(string)
      zones = optional(list(string))
      min_count = optional(number)
      max_count = optional(number)
    })) 
    network_plugin = map(string)
    network_policy = map(string)
    tags = map(string)
  }))
}