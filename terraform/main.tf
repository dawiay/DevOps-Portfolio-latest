terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "webapp" {
  name         = "devops-portfolio-app:latest"
  keep_locally = true
}

resource "docker_container" "webapp" {
  image = docker_image.webapp.image_id
  name  = "webapp-container"
  ports {
    internal = 5000
    external = 5000
  }
}
