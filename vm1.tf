resource "azurerm_linux_virtual_machine" "main" {
  name                  = "VM-${var.nombre}-1"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.main1.id]
  size               = "Standard_B1ms"
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
    admin_username = "${var.nombre}"
    admin_password = "${var.nombre}123."
    disable_password_authentication = false
    
    custom_data = base64encode(templatefile("${path.module}/cloud-init1.txt", {
    index_html = file("${path.module}/index1.html")
  }))

  tags = {
    environment = "staging"
  }
}

resource "azurerm_network_interface" "main1" {
  name                = "NIC-${var.nombre}-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ip1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip1.id
  }
}

resource "azurerm_public_ip" "publicip1" {
  name                = "PIP-${var.nombre}-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  domain_name_label = "${var.nombre}${local.random1}"
}