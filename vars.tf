#Network module vars
#VPC vars
variable "defaultVPC" {
    type = map(any)

    default = {
      "name" = ""
      cidr_block = ""
    }

    description = "VPC variables"
}

#Subnet vars
variable "subnets_names" {
  type = list(string)
  description = "Name of the subnets"
}

variable "subnets_cidr_block" {
    type = list(string)
    description = "List of cidr blocks of public subnets"
}

variable "subnet_az" {
    type = list(string)
    description = "List of cidr blocks of public subnets"
}

#Internet gateway vars
variable "IGW" {
    type = map(any)

    default = {
      "name" = ""
    }

    description = "Internet gateway variables"
}

#Route Table vars
variable "DefaultRT" {
    type = map(any)

    default = {
      "name" = ""
    }

    description = "Route Table variables"
}

#Network ACL vars
variable "DefaultACL" {
    type = map(any)

    default = {
      "name" = ""
    }

    description = "Network ACL variables"
}

#Default Network ACL rules vars
variable "DefaultACL_rule_number" {
    type = list(string)
    description = "Number of the rule for the ACL evaluation"
}

variable "DefaultACL_egress" {
    type = list(string)
    description = "True for egress or False to ingress"
}

variable "DefaultACL_protocol" {
    type = list(string)
    description = "Type of protocol"
}

variable "DefaultACL_rule_action" {
    type = list(string)
    description = "Type of action Allow or Deny"
}

variable "DefaultACL_cidr_block" {
    type = list(string)
    description = "CIDR Block of the subnet to the route"
}

variable "DefaultACL_from_port" {
    type = list(string)
    description = "Start Port of the rule"
}

variable "DefaultACL_to_port" {
    type = list(string)
    description = "End Port of the rule"
}


#Security group vars
variable "DefaultSecurityGroups" {
    type = map(any)

    default = {
      "name" = ""
    }

    description = "Security group variables"
}

#Default Security group rules vars
variable "DefaultSG_rules_type" {
    type = list(string)
    description = "Type of the rule on the security group"
}

variable "DefaultSG_rules_from_port" {
    type = list(string)
    description = "Start Port of the rule"
}

variable "DefaultSG_rules_to_port" {
    type = list(string)
    description = "End Port of the rule"
}

variable "DefaultSG_rules_protocol" {
    type = list(string)
    description = "Protocol used in the rule"
}

variable "DefaultSG_rules_cidr_blocks" {
    type = list(string)
    description = "CIDR block used in the rule"
}

#Infrastructure module
#Target group vars
variable "MainTG_name" {
  type = list(string)
  description = "Name of the subnets"
}

variable "MainTG_port" {
  type = list(string)
  description = "Name of the subnets"
}

variable "MainTG_protocol" {
  type = list(string)
  description = "Name of the subnets"
}

variable "MainTG_target_type" {
  type = list(string)
  description = "Name of the subnets"
}

#Application load balance vars
variable "DefaulALB" {
  type = map(any)

  default = {
    name = ""
    internal = ""
    load_balancer_type = ""
    security_groups = ""
  }

  description = "Default Application load balance variables"
}

#Load balancer listner vars
variable "MainListner" {
  type = map(any)

  default = {
    port = ""
    protocol = ""
    type = ""
    weightBlue = ""
    weightGreen = ""
  }

  description = "Default Application load balance listner variables"
}

#Launch template vars
variable "MainTemplate" {
  type = map(any)

  default = {
    name = ""
    image_id = ""
    instance_type = ""
    resource_type = ""
  }

  description = "Default Application load balance listner variables"
}

#Autoscaling groups vars

#Blue autoscaling group vars
 variable "Blue_AutoScalingGroup" {
  type = map(any)

  default = {
    desired_capacity = ""
    max_size = ""
    min_size = ""
    version = ""
  }

  description = "Blue autoscaling group variables"
}

#Green autoscaling group vars
 variable "Green_AutoScalingGroup" {
  type = map(any)

  default = {
    desired_capacity = ""
    max_size = ""
    min_size = ""
    version = ""
  }

  description = "Green autoscaling group variables"
}