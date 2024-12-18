terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "xxx"
}

provider "random" {
  # Configuration options
}
