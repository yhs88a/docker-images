variable "OWNER" {
  default = "yhs88a"
}

variable "GROUP" {
  default = "ci"
}

variable "FILE" {
  default = "terraform"
}

variable "TAG" {
  default = "latest"
}

variable "BASE_IMAGE" {
  default = "alpine"
}

variable "BASE_VERSION" {
  default = "latest"
}

group "default" {
  targets = ["build"]
}

target "settings" {
  context = "."
  cache-from = [
    "type=gha"
  ]
  cache-to = [
    "type=gha,mode=max"
  ]
}

target "test" {
  inherits = ["settings"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  tags = []
}

target "build" {
  inherits = ["settings"]
  output   = ["type=docker"]
  tags = [
    "${OWNER}/${FILE}",
    "${OWNER}/${FILE}:${TAG}",
  ]
}

target "push" {
  inherits = ["settings"]
  output   = ["type=registry"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
  tags = [
    "${OWNER}/${FILE}",
    "${OWNER}/${FILE}:${TAG}",
    "${OWNER}/${FILE}:${BASE_IMAGE}${BASE_VERSION}",
    "${OWNER}/${FILE}:${TAG}-${BASE_IMAGE}${BASE_VERSION}",
  ]
}
