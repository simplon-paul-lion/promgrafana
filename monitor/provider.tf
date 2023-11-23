terraform {
  required_providers {
    kubernetes = {
        source = "hashicorp/kubernetes"
        version = ">=1.33.0"
    }
  }
}

provider "kubernetes" {
   config_path = "../init-infra/.kube/config"
}

provider "helm"{
  kubernetes {
    config_path = "../init-infra/.kube/config"
  }
}