variable "security_group_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_port" {
  type = list(any)
}

variable "sg_cidr" {
  type = list(string)
}

