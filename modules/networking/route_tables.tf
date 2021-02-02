resource "aws_route_table" "main_vpc_public" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }

    tags = {
        Name = "Public Subnet Route Table for Main VPC"
    }
}

resource "aws_route_table_association" "main_vpc_public_1" {
    subnet_id = var.public_subnet_id_1
    route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "main_vpc_public_2" {
    subnet_id = var.public_subnet_id_2
    route_table_id = var.public_route_table_id
}

resource "aws_route_table" "main_vpc_private" {
    vpc_id = var.vpc_id

    tags = {
        Name = "Private Subnet Route Table for Main VPC"
    }
}

resource "aws_route_table_association" "main_vpc_private" {
    subnet_id = var.private_subnet_id
    route_table_id = var.private_route_table_id
}

output "public_route_table_id" {
    value = aws_route_table.main_vpc_public.id
}

output "private_route_table_id" {
    value = aws_route_table.main_vpc_private.id
}