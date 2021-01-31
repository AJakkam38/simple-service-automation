resource "aws_route_table" "main_vpc_public" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }

    tags = {
        Name = "Public Subnets Route Table for Main VPC"
    }
}

resource "aws_route_table_association" "main_vpc_public" {
    subnet_id = var.public_subnet_id
    route_table_id = var.public_route_table_id
}

resource "aws_route_table" "main_vpc_private" {
    vpc_id = var.vpc_id

    tags = {
        Name = "Local Route Table for Isolated Private Subnet"
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