
variable "project-info" {
  default {
    project-name = "devlensolutions"
    project-region = "europe-west1"
  }
}

variable "mstr" {
  default {
    mstr_instance_type_gcp = "n1-standard-1"
    mstr_instance_zone_gcp = "europe-west1-c"
    mstr_os_image = "centos-7-v20171025"
  }
}

variable "slave" {
  default {
    slave_instance_type_gcp = "n1-standard-1"
    slave_instance_zone_gcp = "europe-west1-c"
    slave_os_image = "ubuntu-1604-xenial-v20171107b"
  }
}