provider "google" {
  project = "emea-tac-cloud-and-compute"
  credentials = "${file("emea-tac-cloud-and-compute-f84a3722b39d.json")}"
  region = "us-central1"
  zone = "us-central1-a"
}
resource "google_compute_instance" "my_instance" {
name = "kuba-defender"
machine_type = "e2-medium"
zone = "us-central1-a"
allow_stopping_for_update = true

boot_disk {
  initialize_params {
    image = "ubuntu-1804-bionic-v20220810"
  }
}

network_interface {
  network = "default"
  access_config {
    //
  }
}

tags = ["prisma-defender"]

  metadata_startup_script = file("startup-script.sh")  # Provide your startup script file
}



