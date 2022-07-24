
resource "aws_s3_bucket" "main" {
  acl    = "public-read-write"
  tags = {
      Name = var.project
    }
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}