#VPC outputs
output "vpc_id" {
  value = aws_vpc.defaultVPC.id
}

#Subnet outputs
output "subnet_id" {
  value = aws_subnet.subnets[*].id
}

#Security groups outputs
output "SG_id" {
  value = aws_security_group.DefaultSecurityGroups.id
}