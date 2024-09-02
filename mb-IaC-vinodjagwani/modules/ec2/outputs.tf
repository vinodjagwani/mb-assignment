# modules/ec2/outputs.tf

output "ssm_host_id" {
  value = aws_instance.ssm_host.id
}

output "server_id" {
  value = aws_instance.server.id
}

