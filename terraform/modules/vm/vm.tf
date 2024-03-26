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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSiDBd5JFbe7vbEE0Udz9StySxG78QwdvVOKLys5Rg29UJBc4AsNFol+R/4J1FqSHe0UqhPaZ6QvEZ7LpfXzNry9dTqJjaJODjub1fru0Rs5GFXI7euHEsl78eyuPpqdxqTZgG/zEY0pTuKIFQaqlpBdVS5lPBu2D1NQeq6Pn0wlI7I6N/bVgL9dSwL4WmU5rQ/zj/kvfEdQh49CiQrxkE2lBBHbQFg9aGo1sod4y/otWF0I/sxteGNLKEKNE5vNhIXBD+XfdOpm5SQQgJAipJgXArgC4ecQC2UfUVsgODR16TXN+aMIO7WLRxAPYlXIqzjod/caKt/ExvW6RPkOSkazt80DkV6VlEBUydooiGpKesdob1zscRFWXBJLv4ckLNXkSriwbWstxcjFdqQjWcI8G34WQ5RMUwSlLZ3NglxAi/jWDT6GhODWFQzcYjgafjtnm8HEx9WhIcGrFWPMOCTd+rrSrzLM+duM9rS2UI9Wddz3/d2XCCs/Y3CKjVnz0= Anil.Bhat@BNGEST-L-99705
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
