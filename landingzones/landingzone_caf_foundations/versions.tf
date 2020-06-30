terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "0.4.3"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  required_version = ">= 0.13"
}
