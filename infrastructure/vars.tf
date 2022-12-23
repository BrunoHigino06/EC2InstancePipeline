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
  description = "VPC ID that is associate to the target group"
}

variable "DefaulALB_security_groups" {
  description = "VPC ID that is associate to the target group"
}