provider "azurerm" {
  version             = "~> 2.15"
  features {}
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "contosome"

    workspaces {
      name = "caf-terraform-landingzones-tfc"
    }
  }
}

locals {
  landingzone_tag = {
    "landingzone" = basename(abspath(path.module))
  }
  tags = merge(var.tags, local.landingzone_tag)
}

# data "terraform_remote_state" "level0_launchpad" {
#   backend = "azurerm"
#   config = {
#     storage_account_name  = var.lowerlevel_storage_account_name
#     container_name        = var.lowerlevel_container_name 
#     key                   = var.lowerlevel_key
#     resource_group_name   = var.lowerlevel_resource_group_name
#   }
# }

locals {
  prefix = "ESTFC"
}