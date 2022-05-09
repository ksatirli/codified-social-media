terraform {
  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ksatirli"

    workspaces {
      # see https://app.terraform.io/app/ksatirli/workspaces/codified-social-media-twitter
      name = "codified-social-media-twitter"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/paultyng/twitter/0.1.0
    twitter = {
      source  = "paultyng/twitter"
      version = "0.1.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "1.1.9"
}

# see https://registry.terraform.io/providers/paultyng/twitter/latest/docs
provider "twitter" {
  access_token        = var.access_token
  access_token_secret = var.access_token_secret

  consumer_api_key    = var.consumer_api_key
  consumer_api_secret = var.consumer_api_secret
}
