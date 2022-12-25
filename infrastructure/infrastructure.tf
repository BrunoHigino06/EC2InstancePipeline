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
#Load balancer listner
resource "aws_lb_listener" "MainListner" {
  load_balancer_arn = aws_lb.DefaulALB.arn
  port              = var.MainListner.port
  protocol          = var.MainListner.protocol

  default_action {
    type             = var.MainListner.type
    forward {
      target_group {
        arn    = aws_lb_target_group.MainTG[0].arn
        weight = var.MainListner.weightBlue
      }

      target_group {
        arn    = aws_lb_target_group.MainTG[1].arn
        weight = var.MainListner.weightGreen
      }
    }
  }
}