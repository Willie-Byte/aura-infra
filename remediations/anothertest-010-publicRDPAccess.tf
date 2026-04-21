resource "azurerm_network_security_group" "example" {
  name                = "prod-rdp-nsg"
  location            = "East US"
  resource_group_name = "example-resource-group"

  security_rule {
    name                       = "Deny-RDP-From-Internet"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}