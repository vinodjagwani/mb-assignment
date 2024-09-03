# modules/cloudfront/vars.tf

variable "s3_bucket_name" {
  description = "Name of bucket to be created in S3. Must be globally unique."
  type = string
  default = "s3-bucket-name"

}
