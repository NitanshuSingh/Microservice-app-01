
rg = {
  "dev-rg" = {
    rg_name       = "dev-rg"
    location   = "East US"
    managed_by = "dev-team"
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}

aks_cluster = {
  "dev-aks-cluster" = {
    cluster_name       = "dev-aks-cluster"
    location           = "East US"
    rg_name            = "dev-rg"
    kubernetes_version = "1.24.6"
    node_pool = {
      "default" = {
        name            = "devpool01"
        vm_size         = "Standard_DS2_v2"
        node_count      = 2
        os_disk_size_gb = 100
        type            = "VirtualMachineScaleSets"
        zones           = ["1", "2", "3"]
        min_count       = 2
        max_count       = 5
      }
    }
    network_plugin = "azure"
    network_policy = "calico"
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}