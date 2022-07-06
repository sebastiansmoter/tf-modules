terraform {
  required_version = "1.2.3"
}
resource "google_compute_router" "my-router"{
  name = var.router_name
  network = var.network_name
  bgp{
    asn = 64514
    advertise_mode = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges{
      range = "1.2.3.4"
    }
  }
}





/*
module "cloud_router" {
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
*/