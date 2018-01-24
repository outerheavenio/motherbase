
variable "project-info" {
  default {
    project-name = "random-proj"
    project-region = "europe-west1"
  }
}

variable "mstr" {
  default {
    mstr_instance_type_gcp = "n1-standard-1"
    mstr_instance_zone_gcp = "europe-west1-c"
    mstr_os_image = "centos-cloud/centos-7"
    #We use https://cloud.google.com/compute/docs/images to find image
  }
}

variable "slaveubuntu" {
  default {
    slave_instance_type_gcp = "n1-standard-1"
    slave_instance_zone_gcp = "europe-west1-c"
    slave_os_image = "ubuntu-os-cloud/ubuntu-1604-lts"
  }
}

variable "slavecentos" {
  default {
    slave_instance_type_gcp = "n1-standard-1"
    slave_instance_zone_gcp = "europe-west1-c"
    slave_os_image = "centos-cloud/centos-7"
  }
}


