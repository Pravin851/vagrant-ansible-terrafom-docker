terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_8081" {
  image = docker_image.nginx.latest
  name  = "nginx-8081"

  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "nginx_8082" {
  image = docker_image.nginx.latest
  name  = "nginx-8082"

  ports {
    internal = 80
    external = 8082
  }
}
