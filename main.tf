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

module "infrastructure" {
  source = ".\\infrastructure\\"
  providers = {
    aws = aws.us
   }
  
  #Target group inputs
  MainTG_name = var.MainTG_name
  MainTG_port = var.MainTG_port
  MainTG_protocol = var.MainTG_protocol
  MainTG_target_type = var.MainTG_target_type
  MainTG_vpc_id = module.network.vpc_id

  #Application load balance inputs
  DefaulALB = {
    name = var.DefaulALB.name
    internal = var.DefaulALB.internal
    load_balancer_type = var.DefaulALB.load_balancer_type
  }

  DefaulALB_security_groups = [module.network.SG_id]
  DefaulALB_subnets = [module.network.subnet_id[0], module.network.subnet_id[1]]

  #Load balancer listner inputs
  MainListner = {
    port = var.MainListner.port
    protocol = var.MainListner.protocol
    type = var.MainListner.type
  }

  #Launch template inputs
  MainTemplate = {
    name = var.MainTemplate.name
    image_id = var.MainTemplate.image_id
    instance_type = var.MainTemplate.instance_type
    vpc_security_group_ids = module.network.SG_id
    resource_type = var.MainTemplate.resource_type

  }

  #Autoscaling group inputs

  vpc_zone_identifier = [module.network.subnet_id[0], module.network.subnet_id[1]]

  #Blue autoscaling group inputs
  Blue_AutoScalingGroup = {
    name = var.Blue_AutoScalingGroup.name
    desired_capacity = var.Blue_AutoScalingGroup.desired_capacity
    max_size = var.Blue_AutoScalingGroup.max_size
    min_size = var.Blue_AutoScalingGroup.min_size
    version = var.Blue_AutoScalingGroup.version
    weightBlue = var.Blue_AutoScalingGroup.weightBlue
  }

  #Green autoscaling group
  Green_AutoScalingGroup = {
    name = var.Green_AutoScalingGroup.name
    desired_capacity = var.Green_AutoScalingGroup.desired_capacity
    max_size = var.Green_AutoScalingGroup.max_size
    min_size = var.Green_AutoScalingGroup.min_size
    version = var.Green_AutoScalingGroup.version
    weightGreen = var.Green_AutoScalingGroup.weightGreen
  }

  depends_on = [
    module.network
  ]
}