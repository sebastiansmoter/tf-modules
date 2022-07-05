terraform {
  required_version = "1.2.3"
}

resource "google_compute_network" "vpc_network"{
    name = var.vpc_name
}

