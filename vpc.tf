resource "digitalocean_vpc" "vpc" {
  name        = var.digitalocean_qa_vpc_name
  description = var.digitalocean_qa_vpc_description
  region      = "ams3"
  ip_range    = var.digitalocean_qa_vpc_ip_range
}
