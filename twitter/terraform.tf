terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ksatirli"

    workspaces {
      name = "codified-social-media-twitter"
    }
  }

  required_providers {
    twitter = {
      source  = "paultyng/twitter"
      version = "0.1.0"
    }
  }

  required_version = "1.0.5"
}

provider "twitter" {
  access_token        = var.access_token
  access_token_secret = var.access_token_secret

  consumer_api_key    = var.consumer_api_key
  consumer_api_secret = var.consumer_api_secret
}
