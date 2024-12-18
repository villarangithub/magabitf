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
  subscription_id = "14627d54-7118-4094-b311-9ae36e4f1c42"
}

provider "random" {
  # Configuration options
}