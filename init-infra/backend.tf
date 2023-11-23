terraform {
   backend "azurerm" {
    resource_group_name  = "paul_backend"
    storage_account_name = "paulterraformbackend"
    container_name       = "paultfstate"
    key                  = "paul-promgraf"
  }
}
