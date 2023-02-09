provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "website1-bucket" {
  bucket = var.bucket
    tags = {
    // Name        = "CI/CD Demo"
    Environment = "Test"
  } 
}
 
resource "aws_s3_bucket_website_configuration" "website1-configuration" {
  bucket = aws_s3_bucket.website-bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  } 
}
  
  resource "aws_s3_bucket_acl" "bucket1-acl" {
  bucket = aws_s3_bucket.website-bucket.id
   acl    = var.acl
}
  
  resource "aws_s3_bucket_policy" "bucket1-policy" {
  bucket = aws_s3_bucket.website-bucket.id
  policy = file(var.policy)
}
