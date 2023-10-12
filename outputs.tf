output "bucket_name" {
  description = "Bucket name for out static website hosting"
  value = module.home_arcanum_hosting.bucket_name
}

output "S3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  value = module.home_arcanum_hosting.website_endpoint
}

output "cloudfront_url" {
  description = "The Cloudfront Distrubution domain name"
  value = module.home_arcanum_hosting.domain_name
}