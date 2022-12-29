//FOR DB SUBNET GROUP
variable "private_subnet_group_name" {
  type = string
}
variable "subnet_ids" {
  type = list(any)
}

//FOR DB INSTANCE

variable "identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "port" {
  type = number
}

variable "backup_retention_period" {
  type = number
}

