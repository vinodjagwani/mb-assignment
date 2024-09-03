# modules/s3/main.tf

resource "aws_s3_bucket" "this" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.this.bucket
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  depends_on = [aws_s3_bucket_public_access_block.example]
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "AllowGetObjects"
    Statement = [
      {
        Sid       = "AllowPublic"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.this.arn}/**"
      }
    ]
  })
}
