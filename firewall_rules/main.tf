terraform {
  required_version = "1.2.3"
}
/* 
module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id = var.project_id
  network_name = var.network_name

  rules = [{
    name                    = "allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [
      protocol = "tcp"
      ports    = ["22"]
    ]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
} */


resource "google_compute_firewall" "default" {
  name    = "test"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["foo", "bar"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}