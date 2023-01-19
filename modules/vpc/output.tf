output "vpc_id" {
  value = aws_vpc.vpc_instances.id
}

output "subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.igw_instances.id
}
