output "bucket_name" {
  description = "Bucket name for out static website hosting"
  value = module.terrahouse_aws.bucket_name
}

output "S3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  value = module.terrahouse_aws.website_endpoint
}
