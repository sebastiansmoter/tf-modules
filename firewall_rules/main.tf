terraform {
  required_version = "1.2.3"
}
resource "google_compute_firewall" "default"{
  name = var.firewall_name
  network = var.network_name
  source_tags =["foo", "bar"]

  deny{
    protocol = "all"
  }
}
resource "google_compute_firewall" "default1"{
  name = var.firewall_name_1
  network = var.network_name
  source_tags =["foo", "bar"]

  allow{
    protocol = "tcp"
    ports = ["22"]
  }
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
    target_tags             = ["foo", "bar"]
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
*/