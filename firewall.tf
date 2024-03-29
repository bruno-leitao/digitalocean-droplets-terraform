resource "digitalocean_firewall" "firewall_instance" {
  name        = local.instance_firewall.name
  droplet_ids = [digitalocean_droplet.instance.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1-65535"
    source_addresses = [digitalocean_vpc.vpc.ip_range]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "1-65535"
    source_addresses = [digitalocean_vpc.vpc.ip_range]
  }

  inbound_rule {
    protocol         = "icmp"
    port_range       = "1-65535"
    source_addresses = [digitalocean_vpc.vpc.ip_range]
  }

  # SSH Access for management
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = local.managers_ips
  }

  # External access through Cloudflare WAF
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = local.cloudflare_ips
  }

  # Allow Github actions
  dynamic "inbound_rule" {
    for_each = [for chunk in chunklist(data.github_ip_ranges.latest.actions_ipv4[*], 1000) : chunk]

    content {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = inbound_rule.value
    }
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Allow to acesso Supabase Database
  outbound_rule {
    protocol              = "tcp"
    port_range            = "5432"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = [digitalocean_vpc.vpc.ip_range]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = [digitalocean_vpc.vpc.ip_range]
  }

  outbound_rule {
    protocol              = "icmp"
    port_range            = "1-65535"
    destination_addresses = [digitalocean_vpc.vpc.ip_range]
  }
}
