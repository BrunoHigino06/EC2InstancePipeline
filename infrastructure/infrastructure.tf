#Target groups
resource "aws_lb_target_group" "MainTG" {
    count = length(var.MainTG_name)
    name        = var.MainTG_name[count.index]
    port        = var.MainTG_port[count.index]
    protocol    = var.MainTG_protocol[count.index]
    target_type = var.MainTG_target_type[count.index]
    vpc_id      = var.MainTG_vpc_id

    tags = {
      "name" = var.MainTG_name[count.index]
    }

}

#Application load balance
resource "aws_lb" "DefaulALB" {
  name               = var.DefaulALB.name
  internal           = var.DefaulALB.internal
  load_balancer_type = var.DefaulALB.load_balancer_type
  security_groups    = var.DefaulALB_security_groups
  subnets            = var.DefaulALB_subnets
  enable_deletion_protection = false

  tags = {
      "name" = var.DefaulALB.name
    }

    depends_on = [
      aws_lb_target_group.MainTG
    ]
}

#Launch template
1