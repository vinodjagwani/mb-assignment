output "s3_bucket_id" {
  description = "The name of the bucket"
  value = aws_s3_bucket.this.id
}

output "s3_bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
}
