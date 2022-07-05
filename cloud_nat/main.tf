terraform {
  required_version = "1.2.3"
}

resource "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"
  name    = var.router_name
  network = var.network_name
  region  = var.network_region
  project = var.project_name

  nats = [{
    name = var.nat_name
  }]
}