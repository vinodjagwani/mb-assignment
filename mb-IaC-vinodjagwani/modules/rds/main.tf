# modules/rds/main.tf

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group-1"
  subnet_ids =  var.private_subnets
  tags = {
    Name = "main-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "test-rds-sg"
  vpc_id      =  var.vpc_id
}

resource "aws_security_group_rule" "allow_mysql_in" {
  description              = "Allow inbound MySQL connections"
  type                     = "ingress"
  from_port                = "3306"
  to_port                  = "3306"
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.rds_sg.id
  security_group_id        = aws_security_group.rds_sg.id
}

resource "aws_db_instance" "mariadb_master" {
  identifier              = "mariadb-master"
  allocated_storage       =  20
  engine                  = "mariadb"
  engine_version          = "10.6.14"
  instance_class          = "db.t3.micro"
  db_name                 = "mydb"
  username                = "admin"
  password                = "password"  # Change this to a secure password
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  backup_retention_period = 5
  tags = {
    Name = "mariadb-master"
  }
}

resource "aws_db_instance" "mariadb_replica" {
  identifier              = "mariadb-replica"
  allocated_storage       = 20
  engine                  = "mariadb"
  engine_version          = "10.6.14"
  instance_class          = "db.t3.micro"
  replicate_source_db     = aws_db_instance.mariadb_master.identifier
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  depends_on              = ["aws_db_instance.mariadb_master"]
  backup_retention_period = 5
  tags = {
    Name = "mariadb-replica"
  }
}

