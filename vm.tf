resource "google_compute_instance" "webserver" {
  name         = "webserver1"
  zone         = var.zone
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network    = google_compute_network.terra_vpc.name
    subnetwork = google_compute_subnetwork.terra_sub.name
    access_config {
      //Ephemeral IP
      #nat_ip = google_compute_address.static.address
    }
  }
  metadata_startup_script = "sudo apt update && sudo apt install apache2 unzip -y"
}