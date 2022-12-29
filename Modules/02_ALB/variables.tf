variable "lb_name" {
  type = string
}
variable "lb_security_group_name" {
  type = list(any)
}
variable "lb_subnets" {
  type = list(any)
}
variable "lb_type" {
  type = string
}