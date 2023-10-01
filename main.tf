terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ramtf"

  #  workspaces {
  #    name = "terra-house-bt"
  #  }
  #}

  #cloud {
  #  organization = "ramtf"
  #  workspaces {
  #    name = "terra-house-bt"
  #  }
  #}    
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}