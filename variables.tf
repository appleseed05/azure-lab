####################
### Azure tenant ###
####################
variable "azure_sub-id" {
  type          = string
  description   = "Azure provider subscription ID"
}

variable "azure_tenant-id" {
  type          = string
  description   = "Azure provider tenant ID"
}

variable "azure_client-id" {
  type          = string
  description   = "Azure provider client ID"
}

variable "azure_client-secret" {
  type          = string
  description   = "Azure provider client secret"
}

#####################
### Azure general ###
#####################
variable "azure_region" {
  type          = string
  description   = "Azure resources type region"
  default       = "France Central"
}

variable "azure_tag-owner" {
  type          = string
  description   = "Azure tag owner name"
}

variable "azure_tag-env" {
  type          = string
  description   = "Azure tag environment name"
  default       = "lab"
}

###################################################
### Azure Resource Group / VNET / Subnet / CIDR ###
###################################################
variable "azure_rg" {
  type          = string
  description   = "Azure resource type resource group"
}

variable "azure_vnet" {
  type          = string
  description   = "Azure resources type virtual network"
}

variable "azure_sub-ext" {
  type          = string
  description   = "Azure resources type subnet - external subnet"
}

variable "azure_sub-int" {
  type          = string
  description   = "Azure resources type subnet - internal subnet"
}

variable "azure_sub-adm" {
  type          = string
  description   = "Azure resources type subnet - admin subnet"
}

variable "azure_sub-jmp" {
  type          = string
  description   = "Azure resources type subnet - jumphost subnet"
}

variable "azure_cidr-vnet" {
  type          = string
  description   = "Azure resources type VNET CIDR"
}

variable "azure_cidr-sub-ext" {
  type          = string
  description   = "Azure resources type subnet CIDR"
}

variable "azure_cidr-sub-int" {
  type          = string
  description   = "Azure resources type subnet CIDR"
}

variable "azure_cidr-sub-adm" {
  type          = string
  description   = "Azure resources type subnet CIDR"
}

variable "azure_cidr-sub-jmp" {
  type          = string
  description   = "Azure resources type subnet CIDR"
}

#########################
### Azure Route table ###
#########################
variable "azure_route" {
  type          = string
  description   = "Azure resources type route"
}

variable "azure_rt-sub-ext" {
  type          = string
  description   = "Azure resources type route for subnet external"
}

variable "azure_rt-sub-int" {
  type          = string
  description   = "Azure resources type route for subnet internal"
}

variable "azure_rt-sub-adm" {
  type          = string
  description   = "Azure resources type route for subnet internal"
}

##################################
### Azure Resource Credentials ###
##################################
variable "azure_ssh-key" {
  type          = string
  description   = "Azure resources type ssh key"
}

variable "azure_ssh-username" {
  type        = string
  description = "Azure resources type username for VM ssh account"
  default     = "f5ssh"
}

variable "azure_admin-username" {
  type        = string
  description = "Azure resources type username for VM admin account"
  default     = "f5user"
}

variable "azure_admin-password" {
  type          = string
  description   = "Azure resources type password for admin account"
  sensitive     = true
}

#######################################
### Azure Gateway / IP / Interfaces ###
#######################################
variable "azure_natgw" {
  type = string
  description = "Azure resources type NAT gateway"
}

variable "azure_pip-nat" {
  type = string
  description = "Azure resources type Public IP for NAT"
}

variable "azure_pip-jmp" {
  type = string
  description = "Azure resources type Public IP for Jumphost"
}

variable "azure_nic-ext" {
  type = string
  description = "Azure resources type Interface for External"
}

variable "azure_nic-int" {
  type = string
  description = "Azure resources type Interface for Internal"
}

variable "azure_nic-jmp" {
  type = string
  description = "Azure resources type Interface for Jumphost"
}

variable "azure_nic-xc-slo" {
  type = string
  description = "Azure resources type Interface for XC CE SLO"
}

variable "azure_nic-xc-sli" {
  type = string
  description = "Azure resources type Interface for XC CE SLI"
}

variable "azure_nic-ext-ip" {
  type = string
  description = "Azure resources type Private IP for External"
}

variable "azure_nic-int-ip" {
  type = string
  description = "Azure resources type Private IP for Internal"
}

variable "azure_nic-jmp-ip" {
  type = string
  description = "Azure resources type Private IP for Jumphost"
}

variable "azure_nic-xc-slo-ip" {
  type = string
  description = "Azure resources type Private IP for XC CE SLO"
}

variable "azure_nic-xc-sli-ip" {
  type = string
  description = "Azure resources type Private IP for XC CE SLI"
}

variable "nic-ext-ip-addr" {
  type        = string
  description = "Azure resources type Private IP static address for External"
}

variable "nic-int-ip-addr" {
  type        = string
  description = "Azure resources type Private IP static address for Internal"
}

variable "nic-jmp-ip-addr" {
  type        = string
  description = "Azure resources type Private IP static address for Jumphost"
}

variable "nic-xc-slo-ip-addr" {
  type        = string
  description = "Azure resources type Private IP static address for XC CE SLO"
}

variable "nic-xc-sli-ip-addr" {
  type        = string
  description = "Azure resources type Private IP static address for XC CE SLI"
}

###########################
### Azure NSG and Rules ###
###########################
variable "azure_nsg-jmp" {
  type = string
  description = "Azure resources type Network Security Group"
}

variable "azure_nsg-allow-rdp" {
  type = string
  description = "Azure resources type NSG rule allow RDP"
}

variable "azure_nsg-allow-ssh" {
  type = string
  description = "Azure resources type NSG rule allow SSH"
}

#########################
### Azure VM settings ###
#########################
variable "azure_vm-size-linux" {
  type        = string
  description = "Azure resources type VM size"
  default     = "Standard_B2s"
}

variable "azure_vm-size-xc-ce" {
  type        = string
  description = "Azure resources type VM size"
  default     = "Standard_D8_v4"
}

variable "azure_vm-ext" {
  type = string
  description = "Azure resources type VM for External VM"
}

variable "azure_vm-int" {
  type = string
  description = "Azure resources type VM for Internal VM"
}

variable "azure_vm-jmp" {
  type = string
  description = "Azure resources type VM for Jumphost VM"
}

variable "azure_vm-xc-ce" {
  type = string
  description = "Azure resources type VM for F5 XC Customer Edge VM"
}

##########################
### SSH key generation ###
##########################
variable "tls_ssh-key-path-private-win" {
  type        = string
  description = "SSH private key path for Windows"
  default     = ".\\my-key-ed25519"
  sensitive   = true
}

variable "tls_ssh-key-path-public-win" {
  type        = string
  description = "SSH private key path for Windows"
  default     = ".\\my-key-ed25519.pub"
  sensitive   = true
}

################################
### Public IP list (for NSG) ###
################################
/*
variable "allowed-ip" {
  type        = list(string)
  description = "Public IP allowed in Azure NSG rules"
}

variable "allowed-pip" {
  type = string
  description = "Allowed Public IP in Azure NSG rules"
}
*/
variable "allowed-pips" {
  type = list(string)
  description = "Allowed Public IP in Azure NSG rules"
}

#############################
### F5 XC API Certificate ###
#############################
variable "f5xc_api-p12-file" {
  type        = string
  description = "F5XC tenant api key"
}

variable "f5xc_api-url" {
  type        = string
  description = "F5XC tenant url"
}

variable "f5xc_smsv2-site-name" {
  type        = string
  description = "F5XC SMSv2 site name"
}

variable "f5xc_smsv2-site-token" {
  type        = string
  description = "F5XC SMSv2 site token"
}

variable "f5xc_namespace-name" {
  type        = string
  description = "F5XC Namespace name"
}