resource "digitalocean_project" "project" {
  name        = var.digitalocean_qa_project
  description = var.digitalocean_qa_project_description
  purpose     = "Service or API"
  environment = var.digitalocean_qa_project_environment
}
