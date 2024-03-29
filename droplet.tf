resource "digitalocean_droplet" "instance" {
  image      = local.instance_image
  name       = local.instance_name
  region     = local.instance_region
  size       = local.instance_size
  vpc_uuid   = digitalocean_vpc.vpc.id
  ssh_keys   = var.qa_public_key
  monitoring = true
  tags       = local.instance_tags

  connection {
    host        = self.ipv4_address
    user        = local.instance_connection.user
    type        = local.instance_connection.type
    private_key = var.qa_private_key
    timeout     = local.instance_connection.timeout
  }

  provisioner "file" {
    source      = "./config/"
    destination = "./"
  }

  provisioner "file" {
    source      = var.environment_qa_folder
    destination = "./"
  }

  provisioner "remote-exec" {
    inline = [
      "docker compose -f ./nginx.compose.yaml up -d",
      "docker compose -f ./portainer.compose.yaml up -d",
      "docker compose -f ./elk.compose.yaml --env-file ./.env up -d",
      "docker container restart portainer"]
  }
}
