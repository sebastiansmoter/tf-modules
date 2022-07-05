terraform {
  required_version = "1.2.3"
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type  = var.machine_type
  zone          =  var.zone
  network_interface {
    network = var.network_name
  }
  boot_disk {
    initialize_params {
      image     =  var.image   
    }
  }
}