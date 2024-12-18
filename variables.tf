variable "nombre" {
  default = "tunombre"
}

variable "location" {
  default = "West Europe"
}

variable "vnet" {
  type = list(string)
  default = [ "192.168.0.0/16" ]
}

variable "subnet" {
  type = list(string)
  default = [ "192.168.1.0/24" ]
}