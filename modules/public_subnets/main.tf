resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.aws_vpc_id
  cidr_block              = var.cidr_public_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.public_subnet_name
  }
}

# resource "aws_internet_gateway" "igw_instances" {
#   vpc_id     = var.aws_vpc_id

#   tags = {
#     Name = var.igw_name
#   }
# }

resource "aws_route_table" "route_table_instances" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}

resource "aws_route_table_association" "associate_igw" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_instances.id
  depends_on     = [aws_route_table.route_table_instances]
}
