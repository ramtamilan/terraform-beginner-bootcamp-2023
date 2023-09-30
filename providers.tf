terraform {
  #cloud {
  #  organization = "ramtf"
  #  workspaces {
  #    name = "terra-house-bt"
  #  }
  #}    
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