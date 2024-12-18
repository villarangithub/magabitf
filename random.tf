resource "random_string" "random1" {
  length           = 6
  special          = false
  }

resource "random_string" "random2" {
  length           = 6
  special          = false
  }

locals {
  random1 = lower(random_string.random1.id)
}

locals {
  random2 = lower(random_string.random2.id)
}

output "random1" {
  value = local.random1
}

output "random2" {
  value = local.random2
}