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

   tags = {
    UserUuid       = var.user_uuid
    
   }
}