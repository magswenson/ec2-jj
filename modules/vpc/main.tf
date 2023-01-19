resource "aws_vpc" "vpc_instances" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc_instances.id
  cidr_block              = var.cidr_private_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch
  depends_on              = [aws_vpc.vpc_instances]

  tags = {
    Name = var.private_subnet_name
  }
}

resource "aws_internet_gateway" "igw_instances" {
  vpc_id     = aws_vpc.vpc_instances.id
  depends_on = [aws_vpc.vpc_instances]

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "route_table_instances" {
  vpc_id     = aws_vpc.vpc_instances.id
  depends_on = [aws_internet_gateway.igw_instances]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_instances.id
  }
}

resource "aws_route_table_association" "associate_igw" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_table_instances.id
  depends_on     = [aws_route_table.route_table_instances]
}
