#https://registry.terraform.io/providers/hashicorp/aws/latest/docs
resource "aws_s3_bucket" "website_bucket" {
  # Bucket Naming Rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
   bucket = var.bucket_name.result

   tags = {
    UserUuid       = var.user_uuid
    
   }
}