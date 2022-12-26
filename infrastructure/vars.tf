#Target group vars
variable "MainTG_name" {
  type = list(string)
  description = "Name of the target groups"
}

variable "MainTG_port" {
  type = list(string)
  description = "Port used on the target groups"
}

variable "MainTG_protocol" {
  type = list(string)
  description = "Protocol used on the target groups"
}

variable "MainTG_target_type" {
  type = list(string)
  description = "Type of the target groups"
}

variable "MainTG_vpc_id" {
  type = string
  description = "VPC ID that is associate to the target group"
}

#Application load balance vars
variable "DefaulALB" {
  type = map(any)

  default = {
    name = ""
    internal = ""
    load_balancer_type = ""
  }

  description = "Default Application load balance variables"
}

variable "DefaulALB_subnets" {
  description = "Subnet to be associated with the ALB"
}

variable "DefaulALB_security_groups" {
  description = "Security groups to be associated with the ALB"
}

#Load balancer listner vars
variable "MainListner" {
  type = map(any)

  default = {
    port = ""
    protocol = ""
    type = ""
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
    vpc_security_group_ids = ""
    resource_type = ""
  }

  description = "Default Application load balance listner variables"
}

#Autoscaling groups vars

variable "vpc_zone_identifier" {
  description = "Identification of the subnet used in the autoscaling groups"
}

#Blue autoscaling group vars
 variable "Blue_AutoScalingGroup" {
  type = map(any)

  default = {
    name = ""
    desired_capacity = ""
    max_size = ""
    min_size = ""
    version = ""
    weightBlue = ""
  }

  description = "Blue autoscaling group variables"
}

#Green autoscaling group vars
 variable "Green_AutoScalingGroup" {
  type = map(any)

  default = {
    name = ""
    desired_capacity = ""
    max_size = ""
    min_size = ""
    version = ""
    weightGreen = ""
  }

  description = "Green autoscaling group variables"
}