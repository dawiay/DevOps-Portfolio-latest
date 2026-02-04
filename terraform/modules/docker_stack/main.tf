terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

variable "env_pfx" {
  type    = string
  default = "dev"
}

variable "app_port" {
  type    = number
  default = 5000
}

resource "docker_image" "flask_app" {
  name         = "devops-portfolio-app:latest"
  keep_locally = true
}

resource "docker_container" "flask_app" {
  image = docker_image.flask_app.image_id
  name  = "${var.env_pfx}-flask-app"
  ports {
    internal = 5000
    external = var.app_port
  }
}

output "container_name" {
  value = docker_container.flask_app.name
}
