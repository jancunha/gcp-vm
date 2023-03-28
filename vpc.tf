resource "google_compute_network" "terra_vpc" {
  name = "terraform-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terra_sub" {
  name = "terraform-subnet"
  ip_cidr_range = "192.168.1.0/24"
  region = var.region
  network = google_compute_network.terra_vpc.id
}

#resource "google_compute_address" "static" {
#  name = "terra-ip"
#  network = google_compute_network.terra_sub.id
#}

resource "google_compute_firewall" "terra_fw" {
  name = "terra-fw"
  allow {
    protocol="tcp"
    ports = [ "22" ]
  }
  allow {
    protocol="tcp"
    ports = [ "80" ]
  }
  direction = "INGRESS"
  network = google_compute_network.terra_vpc.id
  source_ranges = ["0.0.0.0/0"]
}