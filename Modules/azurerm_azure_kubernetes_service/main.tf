resource "azurerm_kubernetes_cluster" "aks" {
    for_each = var.aks_cluster
  name                = each.value.cluster_name
  sku_tier            = "Standard"
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = "${each.value.cluster_name}-api"

  kubernetes_version = each.value.kubernetes_version

  // ——— Identity ———
  identity {
    type = "SystemAssigned"
  }

  // ——— Default Node Pool ———
  dynamic "default_node_pool" {
    for_each = each.value.node_pool
    content {
      name                = default_node_pool.value.name
      vm_size             = default_node_pool.value.vm_size
      node_count          = default_node_pool.value.node_count
      os_disk_size_gb     = lookup(default_node_pool.value, "os_disk_size_gb", 50)
      type                = lookup(default_node_pool.value, "type", "VirtualMachineScaleSets")
      zones               = lookup(default_node_pool.value, "zones", ["1","2","3"])
      min_count           = lookup(default_node_pool.value, "min_count", 1)
      max_count           = lookup(default_node_pool.value, "max_count", 3)
    }
    
  }

  // ——— Network ———
  network_profile {
    network_plugin    = each.value.network_plugin
    network_policy    = each.value.network_policy
  }

  // ——— RBAC ———
  role_based_access_control_enabled = true
  # Enables Azure AD integration for RBAC to allow centralized identity management.
  azure_active_directory_role_based_access_control {
    tenant_id = ""
    # 'managed = true' is not a valid attribute for this block in the current provider version.
    # Azure AD RBAC is enabled by default when this block is present.
  }

  // ——— Logging ———
  oms_agent {
    log_analytics_workspace_id = each.value.log_analytics_workspace_id
  }

  // ——— Tags ———
  tags = each.value.tags
}

