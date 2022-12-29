resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_subnet_group" "this_pri_subnet_grp" {
  name       = var.private_subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "default" {
  allocated_storage          = 10
  identifier                 = var.identifier
  db_name                    = var.db_name
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  username                   = var.username
  password                   = random_password.password.result
  skip_final_snapshot        = true
  db_subnet_group_name       = aws_db_subnet_group.this_pri_subnet_grp.name
  vpc_security_group_ids     = var.vpc_security_group_ids
  port                       = var.port
  publicly_accessible        = false
  deletion_protection        = false
  backup_retention_period    = var.backup_retention_period
  auto_minor_version_upgrade = true
}