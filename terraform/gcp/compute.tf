resource "google_compute_instance" "ctrl_master" {
  name  = "ctrl-mstr-${count.index}"
  count = 1
  machine_type = "${var.mstr["mstr_instance_type_gcp"]}"
  zone         = "${var.mstr["mstr_instance_zone_gcp"]}"

  depends_on = ["google_compute_firewall.basenet-internal-allow-all"]

  boot_disk {
    initialize_params {
      image = "${var.mstr["mstr_os_image"]}"  //this should be centos, since ipa will most likely be running here
    }
  }

  network_interface {
    network = "${google_compute_network.basenet.name}" // This value can be taken from the network file, since we are going to want to control that
    access_config {
    }
  }

}

resource "google_compute_instance" "ctrl_slave" {
  name  = "ctrl-cli-${count.index}"
  count = 2 // might need to put this is a variable since everything will be controlled by that
  machine_type = "${var.slave["slave_instance_type_gcp"]}"
  zone         = "${var.slave["slave_instance_zone_gcp"]}"

  depends_on = ["google_compute_instance.ctrl_master"]

  boot_disk {
    initialize_params {
      image = "${var.slave["slave_os_image"]}"
    }
  }

  network_interface {
    network = "${google_compute_network.basenet.name}"

    access_config {
    }
  }

  scheduling {
    preemptible = true
    automatic_restart = false
  }
}
