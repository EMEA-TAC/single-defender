variable "token" {
  description = "Authorization token for API access"
  type        = string
  sensitive   = true
}

provider "google" {
  project     = "emea-tac-cloud-and-compute"
  credentials = file("emea-tac-cloud-and-compute-f84a3722b39d.json")
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "my_instance" {
  name         = "kuba-defender-linux"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20220810"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Pusta konfiguracja IP
    }
  }

  metadata = {
    startup-script = <<-EOF
      #!/bin/bash

      DEFENDER_INSTALL_SCRIPT="https://europe-west3.cloud.twistlock.com/eu-2-143570911/api/v1/scripts/defender.sh"
      DEFENDER_CONTROLLER_HOST="europe-west3.cloud.twistlock.com"
      TOKEN="${var.token}"

      # Download and install Defender
      curl -sSL --header "Authorization: Bearer $TOKEN" -X POST "$DEFENDER_INSTALL_SCRIPT" | sudo bash -s -- -c "$DEFENDER_CONTROLLER_HOST" -v --install-host
    EOF
  }
}
