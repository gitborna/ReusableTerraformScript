# Provides configuration details for the Azure Terraform provider
provider "azurerm" {
  features {}
}

# Provides the Resource Group to logically contain resources
module "azurerm_resource_group" {
  source = "azurerm_resource_group"
  
} 

# Provides the Resource Group to logically contain resources
resource "azurerm_resource_group" "rg" {
  name      = var.azurerm_resource_group_name
  location  = var.azurerm_resource_group_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
}

resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location      
  version                      = var.sql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

# To allow azure services and resources to access the server 
resource "azurerm_sql_firewall_rule" "firewall" {
  name                    = var.firewall_name
  server_name             = azurerm_sql_server.sql_server.name
  resource_group_name     = azurerm_resource_group.rg.name
  start_ip_address        = "0.0.0.0"
  end_ip_address          = "0.0.0.0" 

}

resource "azurerm_app_service_plan" "service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FunctionApp"
  
  sku {
    tier = var.service_plan_tier
    size = var.service_plan_size
  }
}

resource "azurerm_function_app" "function_app" {
  count                      = var.function_app_count
  name                       = "${var.function_app_name_prefix}-${count.index + 1}"
  # name                       = format("%s-%d", ["${var.function_app_name_prefix}-${count.index + 1}"])
  # name                       = var.function_app_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.service_plan.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
}

resource "azurerm_logic_app_workflow" "logic_apps" {
  count               = var.logic_app_count
  name                = "${var.logic_app_name_prefix}-${count.index}"
  # name                = format("%s-%d", ["${var.logic_app_name_prefix}-${count.index}"])
  # name                = var.logic_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}