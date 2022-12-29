resource "aws_security_group" "this_security_group" {
  name   = var.security_group_name
  vpc_id = var.vpc_id
  tags = {
    Name = var.security_group_name
  }
}

resource "aws_security_group_rule" "this_ingress_rules" {
  count             = length(var.sg_port)
  type              = "ingress"
  from_port         = var.sg_port[count.index]
  to_port           = var.sg_port[count.index]
  protocol          = "tcp"
  cidr_blocks       = var.sg_cidr
  security_group_id = aws_security_group.this_security_group.id
}
resource "aws_security_group_rule" "this_egress_rules" {
  count             = length(var.sg_port)
  type              = "egress"
  from_port         = var.sg_port[count.index]
  to_port           = var.sg_port[count.index]
  protocol          = "tcp"
  cidr_blocks       = var.sg_cidr
  security_group_id = aws_security_group.this_security_group.id
}