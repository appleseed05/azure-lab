# Goal  
With this repo, you will deploy a lab environment in MS Azure with several Linux VM and F5 Distributed Cloud (XC) Customer Edge (CE).  

# Content  
This Terraform project will deploy multiple components in MS Azure.  
It includes the following :  
- Azure VNET with subnets and NAT Gateway  
- Azure VM Ubuntu server  
- Azure VM Ubuntu jumphost  
- F5 XC SMSv2 site with CE  


# Requierment:
The script in this repo needs to be run on a machine with following software installed and environment variable defined:  
* Terraform  
* Azure CLI  
* Azure subscription (subscription ID and tenant ID)  
* F5 XC tenant  
* OS environment variable **VES_P12_PASSWORD** for XC API certificate  
* OS environment variable **TF_VAR_azure_admin-password** for VM SSH admin password  

Azure authentication:  
Azure Service Principal is the best option. Terraform provider script includes line for Client ID and Client Secret to use Service Principal.  
If you don't have Azure Service Principal, you can use interactive authentication with Azure CLI by running ```az login``` command. This command needs to be run on the machine executing Terraform.  

F5 XC authentication:  
F5 XC auth offer API certificate or API token.  
XC Customer Edge deployment requires API certificate.  
This certificate needs to be generated before and copied in the same folder as TF files.  
Certificate password must be configured through OS environnement variable ```VES_P12_PASSWORD```. It will be used 

Linux VM does allow ssh connection with password. This require a password to be set. For a minimum of security, the password is in an environment variable called ```TF_VAR_azure_admin-password```. This variable has to be created before launching Terraform deployment.  


# How to use  
Git clone the repo on a machine meeting the requirements.  
Then go in the folder to execute Terraform command:  
```terraform init``` to initialize the project and download Terraform component (based on provider)  
```terraform plan``` to check the deployment  
```terraform apply```to launch the deployment if plan is successful  

This Terraform project has been done and tested on Windows machine. Some adapation is needed for Mac or Linux. Especially for the environment variable to store admin password and path of SSH keys.

Authentication on Azure subscription is done manually with Azure CLI before launching Terraform script.
Using Azure Service Principal is better, but require some permission to configure.

A lot of security shortcut are used in this project. It is for lab purpose only, not for production!

# WARNING:
For Azure VM, username must be the same for admin username and ssh username

XC CE needs site token. It is obfuscated in console with SMS v2, but still used under the hood. Type 1 of site token is used for SMS v2, but not documented.

XC object name can ONLY use lower case alphanumeric caracters and dash. Must start by alphanumeric. 

CE image version comes from Azure marketplace. It is hardcoded on TF and may change in the future. 
