resource "google_compute_instance" "ovni" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  
  network_interface {
    network = "default"
    #network    = google_compute_network.terra_vpc.name
    #subnetwork = google_compute_subnetwork.terra_sub.name
    access_config {
      //Ephemeral IP
      #nat_ip = google_compute_address.static.address
    }
  }
  #metadata_startup_script = "sudo apt update && sudo apt install apache2 unzip -y"
}