provider "azurerm" {
  version             = "~> 2.15"
  features {}
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "contosome"

    workspaces {
      name = "caf-terraform-landingzones-tfc-appservice"
    }
  }
}

locals {
  landingzone_tag = {
    "landingzone" = basename(abspath(path.module))
  }
  tags = merge(var.tags, local.landingzone_tag)
}

locals {
  prefix = "ESTFC"
}