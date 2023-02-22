variable "azurerm_resource_group_name" {
    type        = string
    # default     = "Baghlava"
    description = "The name of the Azure resource group."
}

variable "azurerm_resource_group_location" {
    type        = string
    # default     = "West US 3"
    description = "The location of the resource group."
}

variable "virtual_network_name" {
    type        = string
    # default = "BaghlavaVM-vnet"
    description = "The name of the virtual network."
}

variable "sql_server_name" {
    type        = string
    # default     = "omgthissqlserverworks"
    description = "The name of the SQL Server instance."
}

variable "sql_server_version" {
    type        = string
    # default     = "12.0"
    description = "The name of the SQL Server instance."
}

variable "administrator_login" {
    type        = string
    # default = "logintobaghlava"
    description = "Specifies the name of the SQL administrator."
}

variable "administrator_login_password" {
    type        = string
    # default = "passwordBaghlava9"
    description = "Specifies the password of the SQL administrator."
}

variable "server_id" {
    type        = string
    # default = "test-1844"
    description = "The resource ID of the SQL Server on which to create the Firewall Rule."
}

variable "address_space" {
    type        = list(string)
    # default     = ["10.0.0.0/16"]
    description = "The address space that is used the virtual network."
}

variable "function_app_name" {
    type        = string
    # default     = "baghlava-app-nombre"
    description = "The name of the function app."
}

variable "function_app_count" {
    type        = number
    # default     = 2
    description = "Number of function apps user may want to create."
}

# locals {
#   total_function_app_count = var.function_app_default_count > 0 ? var.function_app_default_count : input("Enter the number of function apps to create: ")
# }

variable "function_app_name_prefix" {
    type        = string
    # default     = "test-baghlava-"
    description = "The unique name you want to use for your function."
}

variable "firewall_name" {
    type        = string
    # default     = "test-firewall-baghlava"
    description = "The name of the Firewall."
}

variable "app_service_plan_name" {
    type        = string
    # default = "test-app-baghlava"
    description = "The name of the service plan."
}

# variable "app_service_plan_id" {
#     type        = number
#     default     = 0
#     description = "The ID of the App Service Plan within which to create this Function App."
# }

variable "service_plan_tier" {
    type        = string
    # default     = "Standard" 
    description = "value"
}

variable "service_plan_size" {
    type        = string
    # default     = "S1" 
    description = "The size of the service plan"
}

variable "storage_account_name" {
    type        = string
    # default     = "testaccount" 
    description = "The name of the storage account."
}

variable "storage_account_access_key" {
    type        = string
    # default     = "passwordbaghlava" 
    description = "The access key of the storage account."
}

variable "logic_app_name" {
    type        = string
    # default     = "baghlava" 
    description = "The name of the logic app."
}

variable "logic_app_count" {
    type        = number
    default     = 2
    description = "Number of logic apps by default."
}

variable "logic_app_name_prefix" {
    type        = string
    # default     = "logic-name" 
    description = "The unique name you want to use for your function."
}



