variable "digitalocean_api_token" {
  default = "~/.ssh/api_token"
  description = "DigitalOcean API token"
}

variable "private_key" {
  default = "~/.ssh/prod_ssh_key"
  description = "Certificate PROD Private SSH key"
}

variable "qa_private_key" {
  default = "~/.ssh/qa_ssh_key"
  description = "Certificate QA Private SSH key"
}

variable "public_key" {
  default = [ 41439907 ]
  description = "Certificate PROD Public SSH key"
}

variable "qa_public_key" {
  default = [ 41439907 ]
  description = "Certificate QA Public SSH key"
}

variable "digitalocean_project" {
  default = "Tourissmo Prod"
  description = "DigitalOcean Project Name PROD"
}

variable "digitalocean_qa_project" {
  default = "Tourissmo QA"
  description = "DigitalOcean Project Name QA"
}

variable "digitalocean_project_description" {
  default = "Production environment of Tourissmo project"
  description = "DigitalOcean Project Description PROD"
}

variable "digitalocean_qa_project_description" {
  default = "Staging environment of Tourissmo project"
  description = "DigitalOcean Project Description PROD"
}

variable "digitalocean_project_environment" {
  default = "Production"
  description = "DigitalOcean Project Environment PROD"
}

variable "digitalocean_qa_project_environment" {
  default = "Staging"
  description = "DigitalOcean Project Environment QA"
}

variable "digitalocean_vpc_name" {
  default = "tourissmo-prod-vpc"
  description = "DigitalOcean PROD VPC Network Name"
}

variable "digitalocean_qa_vpc_name" {
  default = "tourissmo-qa-vpc"
  description = "DigitalOcean QA VPC Network Name"
}

variable "digitalocean_vpc_ip_range" {
  default = "10.0.10.0/24"
  description = "DigitalOcean PROD VPC Network IP Range"
}

variable "digitalocean_qa_vpc_ip_range" {
  default = "10.0.20.0/24"
  description = "DigitalOcean QA VPC Network IP Range"
}

variable "digitalocean_vpc_description" {
  default = "Production environment in Amsterdam 3"
  description = "DigitalOcean PROD VPC Description"
}

variable "digitalocean_qa_vpc_description" {
  default = "Staging environment in Amsterdam 3"
  description = "DigitalOcean QA VPC Description"
}

variable "digitalocean_droplet" {
  default = "prod-instance"
  description = "Droplet Instance Name PROD"
}

variable "digitalocean_qa_droplet" {
  default = "qa-instance"
  description = "Droplet Instance Name QA"
}

variable "environment_folder" {
  default = "./environment/prod/"
  description = "Environment Folder PROD"
}

variable "environment_qa_folder" {
  default = "./environment/qa/"
  description = "Environment Folder QA"
}

variable "digitalocean_firewall" {
  default = "firewall-prod-instance"
  description = "Firewall Rule Instance Name PROD"
}

variable "digitalocean_qa_firewall" {
  default = "firewall-qa-instance"
  description = "Firewall Rule Instance Name QA"
}
