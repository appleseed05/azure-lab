terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~>3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.0"
    }
    volterra = {
      source = "volterraedge/volterra"
      version = "0.11.46"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = ">= 2.3.7"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_sub-id
  #client_id       = "<SP_APP_ID>"           # Replace with the appId from the Service Principal
  client_id = "8c93547c-7fef-42d5-a0ec-8836f4ae4d62"
  #client_secret   = "<SP_PASSWORD>"         # Replace with the password from the Service Principal
  client_secret = "3F98Q~hnBsSeFGUFcdO_XVWQb5PGGcXZsOx7SaYh"
  tenant_id       = var.azure_tenant-id
}

provider "volterra" {
  api_p12_file     = var.f5xc_api-p12-file
  url              = var.f5xc_api-url
}
