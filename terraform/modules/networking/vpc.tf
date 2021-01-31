resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Main VPC - Internet Gateway"
  }
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.main_igw.id
}
