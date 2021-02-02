resource "aws_subnet" "public_1" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr_1
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet us-east-1a"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidr_2
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public Subnet us-east-1b"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet us-east-1a"
  }
}

output "public_subnet_id_1" {
  value = aws_subnet.public_1.id
}

output "public_subnet_id_2" {
  value = aws_subnet.public_2.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}