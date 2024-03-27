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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTbt9HS8LajW8oWM19PkUzYMEK59XJ7otp1UwT3r4jat1m9LVQ+3xuLLMBt6+sIIkbnxlZDUO8XxL3cWAi/5UnHdyYIXLdlNInrbYKltHvOJnk8eFmKPVqtwQS45J7giAd5g587q6hkOwrDmPJ5FebhHuBeiJXWj5RYGbqGxuU1ThMfR4us1WeKs3yxN3nvT72eoKS7oM6cMWURghJUjihtnx/0hRigcfGuzF6OXcj8dpa63WKeL4+CtoI4Jq4tAGGZZ9Jkx1alTohFhpfRwLB0ZG51gcn8DWg+mkL6HTrkToLXK02088Ibr/vPr7GGuo7eSGSLE4cYTqy8grgm2js5NmjyvjHt/Z2eIw+32sS41t+E0GUwrWjts0FgdYb1Nrp/Y9Sony68nxRKfRdjZT5vnb82T2GpaiKhZgkEC+U8B+wVr8nScgd2p1p9WyhdvqM44cg/CRJUjZQhsdhk4JPrgPwJTJR6ovnezYfFUdLMU7jtHb7F5nqpkmYnMCjcxE= Anil.Bhat@BNGEST-L-99705"
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
