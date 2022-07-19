provider "aws" {
  region = "eu-central-1"
}

#############   S3  bucket   ###############

resource "aws_s3_bucket" "terraform_state" {
  bucket = "shamrockoo4tune-tf-state"

  # accidential deletion preventor
  lifecycle {
    prevent_destroy = true
  }
}


# enable s3 versioning
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}


# enable s3 encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" 
    }
  }
}


# block public access to s3
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


#############   Dynamo  DB   ###############

resource "aws_dynamodb_table" "tf_locks" {
  name         = "tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

