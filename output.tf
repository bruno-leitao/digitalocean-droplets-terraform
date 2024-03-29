output "qa_ip_address" {
  value = digitalocean_droplet.instance.ipv4_address
}

output "qa_api_status" {
  value = digitalocean_droplet.instance.status
}
