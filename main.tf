terraform {
  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

provider "time" {}

locals {
  items = toset([for i in range(10) : tostring(i)])
}

resource "null_resource" "test" {
  for_each = local.items
}

resource "time_sleep" "wait_after_each" {
  for_each = null_resource.test

  create_duration = "15s"
}
