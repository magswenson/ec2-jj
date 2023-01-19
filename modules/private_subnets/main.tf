resource "aws_subnet" "private_subnet" {
  vpc_id                  = var.aws_vpc_id
  cidr_block              = var.cidr_private_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.private_subnet_name
  }
}