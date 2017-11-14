// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("~/.mbase/account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "ctrl_master" {
  name  = "ctrl-mstr-${count.index}"
  count = 1
  machine_type = "${var.mstr_instance_type_gcp}"
  zone         = "${var.mstr_instance_zone_gcp}"

  boot_disk {
    initialize_params {
      image = "${var.mstr_os_image}"
    }
  }

  network_interface {
    network = "default" // This value can be taken from the network file, since we are going to want to control that
    access_config {
    }
  }

}

resource "google_compute_instance" "ctrl_slave" {
  name  = "ctrl-cli-${count.index}"
  count = 2 // might need to put this is a variable since everything will be controlled by that
  machine_type = "${var.cli_instance_type_gcp}"
  zone         = "${var.cli_instance_zone_gcp}"

  boot_disk {
    initialize_params {
      image = "${var.cli_os_image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

}
