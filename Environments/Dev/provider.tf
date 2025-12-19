terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  #   backend "" {

  #   }
}

provider "azurerm" {
  subscription_id = "9eb6dd3b-7d3d-4d3a-82fa-3747ca6f588e"
  features {}
}

