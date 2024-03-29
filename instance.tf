locals {
  instance_image  = "docker-20-04"
  instance_name   = var.digitalocean_qa_droplet
  instance_region = "ams3"
  instance_size   = "s-2vcpu-4gb"

  instance_connection = {
    user    = "root"
    type    = "ssh"
    timeout = "5m"
  }

  instance_firewall = {
    name = var.digitalocean_qa_firewall
  }

  instance_tags = [
    "Staging", "Website", "API", "BO", "Elasticsearch", "Kibana"
  ]
}

resource "digitalocean_project_resources" "digitalocean_project_resources_instance" {
  project = digitalocean_project.project.id
  resources = [
    digitalocean_droplet.instance.urn,
  ]
}
