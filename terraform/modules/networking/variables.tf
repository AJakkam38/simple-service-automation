variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "vpc_id" {}

variable "igw_id" {}

variable "public_subnet_cidr" {
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "public_subnet_id" {}

variable "private_subnet_id" {}

variable "public_route_table_id" {}

variable "private_route_table_id" {}

variable "ssh_sg_id" {}