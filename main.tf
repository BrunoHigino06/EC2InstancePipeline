module "network" {
  source = ".\\network\\"
  providers = {
    aws = aws.us
   }

  #VPC inputs
  defaultVPC = {
    name = var.defaultVPC.name
    cidr_block = var.defaultVPC.cidr_block
  }

  #Subnet inputs
  subnets_names = var.subnets_names
  subnets_cidr_block = var.subnets_cidr_block
  subnet_az = var.subnet_az

  #Internet gateway inputs
  IGW = {
    name = var.IGW.name
  }

  #Route table inputs
  DefaultRT = {
    name = var.DefaultRT.name
  }

  #Network ACL inputs
  DefaultACL = {
    name = var.DefaultACL.name
  }

  #Network ACL rules inputs
  DefaultACL_rule_number = var.DefaultACL_rule_number
  DefaultACL_egress = var.DefaultACL_egress
  DefaultACL_protocol = var.DefaultACL_protocol
  DefaultACL_rule_action = var.DefaultACL_rule_action
  DefaultACL_cidr_block = var.DefaultACL_cidr_block
  DefaultACL_from_port = var.DefaultACL_from_port
  DefaultACL_to_port = var.DefaultACL_to_port

  #Security group inputs
  DefaultSecurityGroups = {
    name = var.DefaultSecurityGroups.name
  }

  #Default Security group rules inputs
  DefaultSG_rules_type = var.DefaultSG_rules_type
  DefaultSG_rules_from_port = var.DefaultSG_rules_from_port
  DefaultSG_rules_to_port = var.DefaultSG_rules_to_port
  DefaultSG_rules_protocol = var.DefaultSG_rules_protocol
  DefaultSG_rules_cidr_blocks = var.DefaultSG_rules_cidr_blocks

}