resource "aws_s3_bucket" "terraform-state" {
    bucket = "aj-dev-terraform-state"

    versioning {
        enabled = true
    }

    # Enable server-side encryption by default
    server_side_encryption_configuration {
      rule {
          apply_server_side_encryption_by_default {
              sse_algorithm = "AES256"
          }
      }
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}

terraform {
  backend "s3" {
      bucket = "aj-dev-terraform-state"
      key = "dev/terraform.tfstate"
      region = "us-east-1"

      dynamodb_table = "terraform-locks"
      encrypt = true
  }
}