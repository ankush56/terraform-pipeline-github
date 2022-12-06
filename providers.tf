# Terraform docs https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
# Storage account to store terarform state
# Can also be configured backend.tf file
  backend "azurerm" {
    resource_group_name  = "terraform-sg-1"
    storage_account_name = "teragithubpiple1234"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}