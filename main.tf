resource "azurerm_resource_group" "rg" {
  name     = "RG-${var.nombre}"
  location = var.location
}

