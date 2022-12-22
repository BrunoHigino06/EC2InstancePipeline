#Default VPC
resource "aws_default_vpc" "defaultVPC" {
  tags = {
    Name = var.defaultVPC.name
  }
}

#Subnets
resource "aws_subnet" "subnets" {
    count = length(var.subnets_cidr_block)
    vpc_id     = aws_default_vpc.defaultVPC.id
    cidr_block = var.subnets_cidr_block[count.index]
    availability_zone = var.subnet_az[count.index]
    tags = {
        Name = var.subnets_names[count.index]
    }
}

#Internet gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_default_vpc.defaultVPC.id

  tags = {
    Name = var.IGW.name
  }
}

#Route table
resource "aws_route_table" "DefaultRT" {
    vpc_id = aws_default_vpc.defaultVPC.id
    tags = {
        Name = var.DefaultRT.name
    }
}

#Routes
#Route to internet
resource "aws_route" "DefaultRoute" {
  route_table_id = aws_route_table.DefaultRT.id
  gateway_id = aws_internet_gateway.IGW.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_internet_gateway.IGW,
    aws_route_table.DefaultRT
  ]
}

# Route table association
resource "aws_route_table_association" "RT_associate" {
  count = length(var.subnets_names)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.DefaultRT.id
  depends_on = [
    aws_route_table.DefaultRT
  ]
}

#Default Network ACL
resource "aws_network_acl" "DefaultACL" {
    vpc_id = aws_default_vpc.defaultVPC.id

    tags = {
        Name = var.DefaultACL.name
    }
}

#Network ACL Association
resource "aws_network_acl_association" "ACL_Association" {
    count = length(var.subnets_names)
    network_acl_id = aws_network_acl.DefaultACL.id
    subnet_id = aws_subnet.subnets[count.index].id
}

#Default Network ACL rules
resource "aws_network_acl_rule" "DefaultACL_rules" {
  count = length(var.DefaultACL_cidr_block)
  network_acl_id = aws_network_acl.DefaultACL.id
  rule_number    = var.DefaultACL_rule_number[count.index]
  egress         = var.DefaultACL_egress[count.index]
  protocol       = var.DefaultACL_protocol[count.index]
  rule_action    = var.DefaultACL_rule_action[count.index]
  cidr_block     = var.DefaultACL_cidr_block[count.index]
  from_port      = var.DefaultACL_from_port[count.index]
  to_port        = var.DefaultACL_to_port[count.index]
}

#Default Security group
resource "aws_security_group" "DefaultSecurityGroups" {
  vpc_id = aws_vpc.defaultVPC.id
  name = var.DefaultSecurityGroups.name
  description = "Security group for the instaces"
  tags = {
    Name = var.DefaultSecurityGroups.name
  }

  depends_on = [
    aws_vpc.defaultVPC
  ]
}

#Default Security group rules
#Ingress Rules
resource "aws_security_group_rule" "DefaultIngress" {
  type              = "ingress"
  from_port         = var.DefaultIngress.from_port
  to_port           = var.DefaultIngress.to_port
  protocol          = var.DefaultIngress.protocol
  cidr_blocks       = [var.DefaultIngress.cidr_blocks]
  security_group_id = aws_security_group.DefaultSecurityGroups.id
  depends_on = [
    aws_security_group.SecurityGroups
  ]
}

#Egress Rules
resource "aws_security_group_rule" "DefaultEgress" {
  type              = "egress"
  from_port         = var.DefaultIngress.from_port
  to_port           = var.DefaultIngress.to_port
  protocol          = var.DefaultIngress.protocol
  cidr_blocks       = [var.DefaultIngress.cidr_blocks]
  security_group_id = aws_security_group.DefaultSecurityGroups.id
  depends_on = [
    aws_security_group.SecurityGroups
  ]  
}