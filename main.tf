terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.1.0"
    }
  }
  
}
provider "azurerm" {
  features {}
  subscription_id = "5c7e70dd-427e-419b-84ab-4518ed63cf85"
}
################Created Azure Resource Group ###############
resource "azurerm_resource_group" "environmentrg" {
  name     = "${var.Project_Name}-${var.Environment}-rg"
  location = var.location
  tags = {
    Environment = var.Environment
    owner = "henry_anonyei"
  }
}
resource random_string vnet_suffix {
  length = 6
  upper = false
  special = false
}

####################Created a virtual network within the resource group ################
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.Project_Name}-${random_string.vnet_suffix.result}"
  location            = azurerm_resource_group.environmentrg.location
  resource_group_name = azurerm_resource_group.environmentrg.name
  address_space       = ["10.0.0.0/16"]
}
################Created a subnet within the rource group ##################
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.Project_Name}-${random_string.vnet_suffix.result}"
  resource_group_name  = azurerm_resource_group.environmentrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
