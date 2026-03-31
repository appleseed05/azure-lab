# -----------
# --- VMs ---
# -----------

# Server Ubuntu - external
resource "azurerm_linux_virtual_machine" "tf_azure_vm-ext" {
  name                = var.azure_vm-ext
  location            = azurerm_resource_group.tf_azure_rg.location
  resource_group_name = azurerm_resource_group.tf_azure_rg.name
  size                = var.azure_vm-size-linux

  admin_username                  = var.azure_admin-username
  disable_password_authentication = false
  admin_password                  = var.azure_adminpassword

  network_interface_ids = [
    azurerm_network_interface.tf_azure_nic-ext.id
  ]

  admin_ssh_key {
    username   = var.azure_admin-username
    public_key = tls_private_key.tf_tls_ssh-key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  depends_on = [
    local_sensitive_file.tf_local_ssh-private-key,
    azurerm_ssh_public_key.tf_azure_ssh-key
  ]
}

# Server Ubuntu - internal
resource "azurerm_linux_virtual_machine" "tf_azure_vm-int" {
  name                = var.azure_vm-int
  location            = azurerm_resource_group.tf_azure_rg.location
  resource_group_name = azurerm_resource_group.tf_azure_rg.name
  size                = var.azure_vm-size-linux

  admin_username                  = var.azure_admin-username
  disable_password_authentication = false
  admin_password                  = var.azure_adminpassword

  network_interface_ids = [
    azurerm_network_interface.tf_azure_nic-int.id
  ]

  admin_ssh_key {
    username   = var.azure_admin-username
    public_key = tls_private_key.tf_tls_ssh-key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  depends_on = [
    local_sensitive_file.tf_local_ssh-private-key,
    azurerm_ssh_public_key.tf_azure_ssh-key
  ]
}

# Jumphost Ubuntu - jmp
resource "azurerm_linux_virtual_machine" "tf_azure_vm-jmp" {
  name                = var.azure_vm-jmp
  location            = azurerm_resource_group.tf_azure_rg.location
  resource_group_name = azurerm_resource_group.tf_azure_rg.name
  size                = var.azure_vm-size-linux

  admin_username                  = var.azure_admin-username
  disable_password_authentication = false
  admin_password = var.azure_adminpassword

  network_interface_ids = [
    azurerm_network_interface.tf_azure_nic-jmp.id
  ]

  admin_ssh_key {
    username   = var.azure_admin-username
    public_key = tls_private_key.tf_tls_ssh-key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  custom_data = base64encode(<<-CLOUDINIT
    #cloud-config
    package_update: true
    package_upgrade: true

    packages:
      - ubuntu-desktop
      - xrdp
      - firefox

    runcmd:
      # allow xrdp to use TLS certs
      - usermod -aG ssl-cert xrdp
      - systemctl enable --now xrdp

      # (Optional but commonly needed) allow RDP through UFW if you use it
      - ufw allow 3389/tcp || true

      # reboot to ensure GUI is properly initialized
      - reboot
  CLOUDINIT
  )

  depends_on = [
    local_sensitive_file.tf_local_ssh-private-key,
    azurerm_ssh_public_key.tf_azure_ssh-key
  ]
}
