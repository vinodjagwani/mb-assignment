# modules/cloudfront/outputs.tf

output "origin_id" {
  value = local.s3_origin_id
}

output "domain_name" {
  value = local.s3_domain_name
}