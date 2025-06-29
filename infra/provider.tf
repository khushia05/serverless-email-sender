terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "rg-khushi-tfstate-01"   # 🟢 REQUIRED: fill in your resource group
    storage_account_name  = "sakhushitfstate01"
    container_name        = "tfstate"
    key                   = "email-sender/dev/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

subscription_id = "bac17140-4441-497d-98ab-773124840802"
client_id       = "ee5e2765-405b-44e9-b64a-eb1b535b0eef"
client_secret   = "_nu8Q~1h5zAYVr5sl0vGrWOm1A7XhOrOo2qmtaOi"
tenant_id       = "e0b560bc-2bf8-446c-afd6-2783dc5130a9"
}
