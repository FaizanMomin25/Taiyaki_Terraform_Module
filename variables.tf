variable "cidr_block" {
  type = string
}

variable "public_cidr_block" {
  type = list(string)
}

variable "private_cidr_block" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}


//FOR ALB SG
variable "alb_security_group_name" {
  type = string
}

variable "alb_sg_port" {
  type = list(any)
}

variable "alb_sg_cidr" {
  type = list(string)
}

// FOR ALB 

variable "lb_name" {
  type = string
}
variable "lb_type" {
  type = string
}

//FOR WEB SG
variable "web_security_group_name" {
  type = string
}

variable "web_sg_port" {
  type = list(any)
}

variable "web_sg_cidr" {
  type = list(string)
}

//FOR APP SG
variable "app_security_group_name" {
  type = string
}

variable "app_sg_port" {
  type = list(any)
}

variable "app_sg_cidr" {
  type = list(string)
}

//FOR RDS SG
variable "rds_security_group_name" {
  type = string
}

variable "rds_sg_port" {
  type = list(any)
}

variable "rds_sg_cidr" {
  type = list(string)
}

//FOR WEB EC2 INSTANCE

variable "web_ami_id" {
  type = string
}
variable "web_instance_type" {
  type = string
}

//FOR APP EC2 INSTANCE

variable "app_ami_id" {
  type = string
}
variable "app_instance_type" {
  type = string
}


//FOR SSH KEY
variable "ssh_key_name" {
  type = string
}
variable "ssh_public_key_path" {
  type = string
}

//FOR DB SUBNET GROUP
variable "rds_private_subnet_group_name" {
  type = string
}
//FOR DB INSTANCE
variable "rds_identifier" {
  type = string
}
variable "rds_db_name" {
  type = string
}
variable "rds_engine" {
  type = string
}
variable "rds_engine_version" {
  type = string
}
variable "rds_instance_class" {
  type = string
}
variable "rds_username" {
  type = string
}
variable "rds_port" {
  type = number
}
variable "rds_backup_retention_period" {
  type = number
}

//FOR S3 BUCKET

variable "taiyaki_bucket" {
  type = string
}

variable "taiyaki_block_public_acls" {
  type = string
}

variable "taiyaki_block_public_policy" {
  type = string
}

variable "taiyaki_ignore_public_acls" {
  type = string
}

variable "taiyaki_restrict_public_buckets" {
  type = string
}