terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.36.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.2.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_api_token
}

# Get the latest GitHub Actions IP ranges
data "github_ip_ranges" "latest" {}
