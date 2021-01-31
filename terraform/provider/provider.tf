terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.22.0"
      }
  }
}

# Configure the AWS Provider
provider "aws" {
    profile = "default"
    region = var.AWS_REGION
}