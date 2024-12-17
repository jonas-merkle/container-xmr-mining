variable "DEFAULT_TAG" {
  default = "app:local"
}

// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  tags = ["${DEFAULT_TAG}"]
}

// Default target if none specified
group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  labels = {
    "org.opencontainers.image.url" = "https://github.com/jonas-merkle/container-xmr-mining",
    "org.opencontainers.image.source" = "https://github.com/jonas-merkle/container-xmr-mining",
    "org.opencontainers.image.title	" = "container-xmr-mining",
    "org.opencontainers.image.authors" = "Jonas Merkle [JJM]",
    "org.opencontainers.image.licenses" = "GNU Lesser General Public License v3.0",
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64"
  ]
}
