
resource "template_file" "ansible_hosts" {
  template = "${file("${path.module}/ansible_hosts.tpl")}"
  vars {
    ctrl_master   = "${join("\n",google_compute_instance.ctrl_master.*.network_interface.0.access_config.0.nat_ip)}"
    ctrl_slave   = "${join("\n",google_compute_instance.ctrl_slave.*.network_interface.0.access_config.0.nat_ip)}"
  }
}

output "ansible_hosts" {
	value = "${template_file.ansible_hosts.rendered}"
}

