resource "aws_s3_bucket" "b" {
  bucket = "my-pras-test-bucket"
  acl    = "private"

  tags = {
    Name        = "pras-bucket"
    Environment = "Dev"
  }
}
