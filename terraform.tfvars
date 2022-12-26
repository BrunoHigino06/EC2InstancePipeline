#Network module inputs
#VPC inputs
defaultVPC = {
    name = "DefaultVPC"
    cidr_block = "172.0.0.0/16"
}

#Subnet inputs
subnets_names = ["us-east-1a", "us-east-1b"]
subnets_cidr_block = ["172.0.1.0/24", "172.0.2.0/24"]
subnet_az = ["us-east-1a", "us-east-1b"]

#Internet gateway inputs
IGW = {
    name = "IGW"
}

#Route table inputs
DefaultRT = {
    name = "DeafultRT"
}

#Network ACL inputs
DefaultACL = {
    name = "DefaultACL"
}

#Network ACL rules inputs
DefaultACL_rule_number = ["100", "100"]
DefaultACL_egress = ["true", "false"]
DefaultACL_protocol = ["-1", "-1"]
DefaultACL_rule_action = ["allow", "allow"]
DefaultACL_cidr_block = ["0.0.0.0/0", "0.0.0.0/0"]
DefaultACL_from_port = ["0", "0"]
DefaultACL_to_port = ["65535", "65535"]

#Security group inputs
DefaultSecurityGroups = {
    name = "DefaultSG"
}

#Default Security group rules inputs
DefaultSG_rules_type = ["ingress", "egress"]
DefaultSG_rules_from_port = ["0", "0"]
DefaultSG_rules_to_port = ["65535", "65535"]
DefaultSG_rules_protocol = ["-1", "-1"]
DefaultSG_rules_cidr_blocks = ["0.0.0.0/0", "0.0.0.0/0"]

#Infrastructure module inputs
#Target groups inputs
MainTG_name = ["blue", "green"]
MainTG_port = ["80", "80"]
MainTG_protocol = ["HTTP", "HTTP"]
MainTG_target_type = ["instance", "instance"]

#Application load balance inputs
DefaulALB = {
    name = "FronEndALB"
    internal = false
    load_balancer_type = "application"
}

#Load balancer listner inputs
MainListner = {
    port = "80"
    protocol = "HTTP"
    type = "forward"
    weightBlue = "100"
    weightGreen = "0"
}

#Launch template inputs
  MainTemplate = {
    name = "test"
    image_id = "ami-0b5eea76982371e91"
    instance_type = "t2.medium"
    resource_type = "instance"

}

#Autoscaling group inputs
#Blue autoscaling group inputs
Blue_AutoScalingGroup = {
    desired_capacity = "2"
    max_size = "4"
    min_size = "1"
    version = "1"
}

#Green autoscaling group
Green_AutoScalingGroup = {
    desired_capacity = "0"
    max_size = "0"
    min_size = "0"
    version = "1"
}