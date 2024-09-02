# modules/rds/outputs.tf

output "mariadb_master_id" {
  value = aws_db_instance.mariadb_master.id
}

output "mariadb_replica_id" {
  value = aws_db_instance.mariadb_replica.id
}

