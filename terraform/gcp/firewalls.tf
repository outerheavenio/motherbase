resource "google_compute_firewall" "basenet-internal-allow-all" {
  name    = "basenet-internal-allow-all"
  network = "basenet"

  depends_on = ["google_compute_network.basenet"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["${data.google_compute_subnetwork.basenet-data.ip_cidr_range}"]
  #We have added the VPN range in order to allow internal pinging
}


resource "google_compute_firewall" "basenet-vpn-rule" {
  name    = "basenet-ipsecvpn-rule"
  network = "${google_compute_network.basenet.name}"


  allow {
    protocol = "tcp"
    ports    = ["500","51","50","4500"]
  }

  allow {
    protocol = "udp"
    ports    = ["500","51","50","4500"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ipsecvpn"]
}


resource "google_compute_firewall" "basenet-ssh-allow-all" {
  name    = "basenet-ssh-allow-al"
  network = "${google_compute_network.basenet.name}"

  allow {
    protocol = "tcp"
   ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}