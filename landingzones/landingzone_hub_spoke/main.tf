provider "azurerm" {
  features {}
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aztfmod"

    workspaces {
      name = "test-landingzone-hub-spoke"
    }
  }
}

locals {
  landingzone_tag = {
    "landingzone" = basename(abspath(path.module))
  }
  tags = merge(var.tags, local.landingzone_tag)
}

data "terraform_remote_state" "landingzone_caf_foundations" {
  backend = "remote"
  config = {
    organization = "aztfmod"
    workspaces = {
      name = "test-landingzone-caf-foundations"
    }
  }
}

locals {
  prefix                     = data.terraform_remote_state.landingzone_caf_foundations.outputs.prefix
  caf_foundations_accounting = data.terraform_remote_state.landingzone_caf_foundations.outputs.blueprint_foundations_accounting
  caf_foundations_security   = data.terraform_remote_state.landingzone_caf_foundations.outputs.blueprint_foundations_security
  global_settings            = data.terraform_remote_state.landingzone_caf_foundations.outputs.global_settings
}