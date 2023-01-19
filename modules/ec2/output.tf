output "ip_address" {
  value = aws_instance.instance_ec2[*].public_ip
}

output "instances_id" {
  value = aws_instance.instance_ec2[*].id
}

output "private_key" {
  value     = tls_private_key.key_length.private_key_pem
  sensitive = true
}

output "availability_zone" {
  value = aws_instance.instance_ec2[*].availability_zone
}
