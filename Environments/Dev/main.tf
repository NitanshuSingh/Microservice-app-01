module "rg" {
  source          = "../../Modules/azurerm_resource_group"
  resource_groups = var.rg
}

module "aks" {
  depends_on  = [module.rg]
  source      = "../../Modules/azurerm_azure_kubernetes_service"
  aks_cluster = var.aks_cluster
}