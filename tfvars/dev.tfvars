//FOR VPC
cidr_block         = "10.0.0.0/16"
public_cidr_block  = ["10.0.0.0/24", "10.0.1.0/24"]
private_cidr_block = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zone  = ["ap-south-1a", "ap-south-1b"]

//FOR ALB SG

alb_security_group_name = "Taiyaki-alb-sg"
alb_sg_port             = ["80", "443"]
alb_sg_cidr             = ["0.0.0.0/0"]

//FOR ALB

lb_name = "Taiyaki-alb"
lb_type = "application"

//FOR WEB SG

web_security_group_name = "Taiyaki-web-sg"
web_sg_port             = ["80", "443"]
web_sg_cidr             = ["0.0.0.0/0"]

//FOR APP SG

app_security_group_name = "Taiyaki-app-sg"
app_sg_port             = ["8080"]
app_sg_cidr             = ["0.0.0.0/0"]

//FOR RDS SG

rds_security_group_name = "Taiyaki-rds-sg"
rds_sg_port             = ["3306"]
rds_sg_cidr             = ["0.0.0.0/0"]

//FOR WEB EC2 INSTANCE

web_ami_id        = "ami-0cca134ec43cf708f"
web_instance_type = "t2.micro"

//FOR APP EC2 INSTANCE

app_ami_id        = "ami-0cca134ec43cf708f"
app_instance_type = "t2.large"

//FOR  SSH KEY
ssh_key_name        = "Taiyaki-ssh-key"
ssh_public_key_path = "/root/.ssh/id_rsa.pub"


//FOR DB SUBNET GROUP
rds_private_subnet_group_name = "taiyaki-db-subnet-sg"

//FOR DB INSTANCE
rds_identifier              = "taiyaki-rds"
rds_db_name                 = "taiyakidb1"
rds_engine                  = "mysql"
rds_engine_version          = "5.7"
rds_instance_class          = "db.t3.micro"
rds_username                = "root"
rds_port                    = 3306
rds_backup_retention_period = 0

//FOR S3 BUCKET
taiyaki_bucket                  = "taiyaki-web-app-log-bukcet"
taiyaki_block_public_acls       = "true"
taiyaki_block_public_policy     = "true"
taiyaki_ignore_public_acls      = "true"
taiyaki_restrict_public_buckets = "true"