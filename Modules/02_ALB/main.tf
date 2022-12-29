resource "aws_lb" "this_lb" {
  name                       = var.lb_name
  internal                   = false
  security_groups            = var.lb_security_group_name
  subnets                    = var.lb_subnets
  load_balancer_type         = var.lb_type
  idle_timeout               = 60
  enable_deletion_protection = false
}