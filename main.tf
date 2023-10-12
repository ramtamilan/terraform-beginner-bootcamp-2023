terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ramtf"

  #  workspaces {
  #    name = "terra-house-bt"
  #  }
  #}
  cloud {
    organization = "ramtf"
    workspaces {
      name = "terra-house-bt"
    }
  }    
}
provider "terratowns"{
  endpoint = var.terratowns_endpoint
  user_uuid=var.teacherseat_user_uuid
  token=var.terratowns_access_token
}

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs!
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "gamers-grotto"
  content_version = var.arcanum.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Traditional Meal - Banana Leaf"
  description = <<DESCRIPTION
Banana leaves play a vital role in Indian tradition. Whatever functions or gathering it 
may be, food is served in the wide banana leaves.
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "cooker-cove"
  content_version = var.payday.content_version
}