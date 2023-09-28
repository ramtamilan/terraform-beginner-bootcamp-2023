terraform {
  cloud {
    organization = "ramtf"
    workspaces {
      name = "terra-house-bt"
    }
  }    
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
   }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string

resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length = 16
  special = false
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs

resource "aws_s3_bucket" "example" {
  # Bucket Naming Rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
   bucket = random_string.bucket_name.result

}
output "random_bucket_name_result" {
  value = random_string.bucket_name.result
}
