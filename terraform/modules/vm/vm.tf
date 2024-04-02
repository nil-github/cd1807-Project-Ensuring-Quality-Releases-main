resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "${var.vm_admin_username}"
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwKIcalZujy9X1pKZcqUCfah+Dv6ObWaLJBv224D1jw5i9WKKHN8r/yIH1z0pNIpRZEgzbVdtS4x1iObNm4rJSqCe7z9KQQ/aZYgPXf0oY6XaQavl7GMOkgmH5waQ05ukYOvMCBmBsYxaKdkIkN7wFyIMlSFz9jSJkjUocEfZvc6dDlAavthi69cEFUbbetUb8r4gD5NolT2nZFb05cq2tcZjitR3OK1+Y+wLhep5bancom5MOtcJ2Qj0wawMAeexCOOCvUwJ+e14tHMm8AiAi4OfUYIQ4X6d2hWI0WDgs+uyK8mQMx4v+AQpVcsY2v2mc9zTS9C71tfzxEeKfA0uLIAItXY+zG8me7j4ouVWUrwoO/1pWB3V1AVEnYThT8Nkz0jWptThDuYIrq+9SrKdgbVr6BFCWA+EfsjM+rh2DcGwG95N4NzQ6iufMchYGHSXhMy+SE7wNHEpDUW8HJCL6z/cplnLa2I90OJEtugq5uzOIoAmG3ZowpPxIFvAtD2U= Anil.Bhat@BNGEST-L-99705
"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
