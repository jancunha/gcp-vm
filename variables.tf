variable "project" {
  default = "regal-sun-343102"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "machine_type" {
  default = "f1-micro"
}

variable "instance_name" {
  default = "ovni"
}

variable "image" {
  default = "debian-cloud/debian-11"
}

variable "credentials" {
  default = ".keys/gcp.json"
}