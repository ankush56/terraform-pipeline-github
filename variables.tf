# Define variables
variable "resource_group_location" {
    default = "eastus"
}

variable "resource_group_name" {
    default = "terraform-pipe-rg1"
}

variable "acr_name" {
    default = "acr1gapipe"
}