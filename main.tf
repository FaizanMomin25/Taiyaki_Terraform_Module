module "vpc" {
  source             = "./Modules/01_VPC"
  cidr_block         = var.cidr_block
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  availability_zone  = var.availability_zone
}

module "alb_sg" {
  source              = "./Modules/03_SECURITY_GROUP"
  security_group_name = var.alb_security_group_name
  vpc_id              = module.vpc.vpc_id
  sg_port             = var.alb_sg_port
  sg_cidr             = var.alb_sg_cidr
}

module "alb" {
  source                 = "./Modules/02_ALB"
  lb_name                = var.lb_name
  lb_security_group_name = [module.alb_sg.security_group_id]
  lb_subnets             = module.vpc.public_subnet_ids
  lb_type                = var.lb_type
}

module "web_sg" {
  source              = "./Modules/03_SECURITY_GROUP"
  security_group_name = var.web_security_group_name
  vpc_id              = module.vpc.vpc_id
  sg_port             = var.web_sg_port
  sg_cidr             = var.web_sg_cidr
}

module "app_sg" {
  source              = "./Modules/03_SECURITY_GROUP"
  security_group_name = var.app_security_group_name
  vpc_id              = module.vpc.vpc_id
  sg_port             = var.app_sg_port
  sg_cidr             = var.app_sg_cidr
}

module "rds_sg" {
  source              = "./Modules/03_SECURITY_GROUP"
  security_group_name = var.rds_security_group_name
  vpc_id              = module.vpc.vpc_id
  sg_port             = var.rds_sg_port
  sg_cidr             = var.rds_sg_cidr
}

module "ssh_key" {
  source              = "./Modules/05_SSH"
  ssh_key_name        = var.ssh_key_name
  ssh_public_key_path = var.ssh_public_key_path

}
module "web_ec2" {
  source          = "./Modules/04_EC2"
  ami_id          = var.web_ami_id
  instance_type   = var.web_instance_type
  ssh_key_name    = module.ssh_key.ssh_key_name
  subnet_id       = module.vpc.public_subnet_ids[0]
  security_groups = [module.web_sg.security_group_id]
}

module "app_ec2" {
  source          = "./Modules/04_EC2"
  ami_id          = var.app_ami_id
  instance_type   = var.app_instance_type
  ssh_key_name    = module.ssh_key.ssh_key_name
  subnet_id       = module.vpc.private_subnet_ids[1]
  security_groups = [module.app_sg.security_group_id]
}

module "RDS" {
  source                    = "./Modules/06_RDS"
  private_subnet_group_name = var.rds_private_subnet_group_name
  subnet_ids                = module.vpc.private_subnet_ids[*]
  identifier                = var.rds_identifier
  db_name                   = var.rds_db_name
  engine                    = var.rds_engine
  engine_version            = var.rds_engine_version
  instance_class            = var.rds_instance_class
  username                  = var.rds_username
  vpc_security_group_ids    = [module.rds_sg.security_group_id]
  port                      = var.rds_port
  backup_retention_period   = var.rds_backup_retention_period
}

module "S3_bucket" {
  source = "./Modules/07_S3_BUCKET"
  bucket = var.taiyaki_bucket
block_public_acls = var.taiyaki_block_public_acls
block_public_policy = var.taiyaki_block_public_policy
ignore_public_acls = var.taiyaki_ignore_public_acls
restrict_public_buckets = var.taiyaki_restrict_public_buckets
}