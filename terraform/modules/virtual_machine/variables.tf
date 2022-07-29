variable "ami" {
    type = string
    default = "ami-0cff7528ff583bf9a"
}

variable "name" {
    type = string
}

variable "inbound_ports" {
    type = list
}

variable "ssh_key_name" {
    type = string
}
