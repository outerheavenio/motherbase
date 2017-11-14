//We will create the network first. Then we will create proceed to other sections.
provider "google" {
  credentials = "${file("~/.mbase/account.json")}"
  project     = "${var.project-info["project-name"]}"
  region      = "${var.project-info["project-region"]}"
}

resource "google_compute_network" "basenet" {
  name = "basenet"
}

data "google_compute_subnetwork" "basenet-data" {
  name   = "${google_compute_network.basenet.name}"
}




