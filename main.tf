terraform {
  required_providers {
    rafay = {
      source  = "RafaySystems/rafay"
      version = "1.1.66"
    }
  }
}

provider "rafay" {
  # provider_config_file = var.rafay_cli_config_path
}

resource "rafay_namespace" "test" {
  metadata {
    name    = var.name
    project = var.project
  }
  spec {
    drift {
      enabled = false
    }
    placement {
      labels {
        key   = "rafay.dev/clusterName"
        value = var.cluster_name
      }
    }
  }
}
