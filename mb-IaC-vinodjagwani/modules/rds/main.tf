# modules/rds/main.tf

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids =  var.private_subnets
  tags = {
    Name = "main-subnet-group"
  }
}

resource "aws_db_instance" "mariadb_master" {
  identifier              = "mariadb-master"
  allocated_storage       = 20
  engine                  = "mariadb"
  engine_version          = "10.6.14"
  instance_class          = "db.t3.micro"
  db_name                 = "mydb"
  username                = "admin"
  password                = "password"  # Change this to a secure password
  parameter_group_name    = "default.mariadb10.6.14"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_db_subnet_group.main.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
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
  replicate_source_db     = aws_db_instance.mariadb_master.id
  parameter_group_name    = "default.mariadb10.6.14"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_db_subnet_group.main.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  tags = {
    Name = "mariadb-replica"
  }
}

