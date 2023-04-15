terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.digital_ocean_api_token
}

data "digitalocean_kubernetes_versions" "versao_cluster" {
  version_prefix = "1.24."
}

resource "digitalocean_kubernetes_cluster" "cluster_k8s_do" {
  name   = "cluster-k8s-for-monitoramento"
  region = var.region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = data.digitalocean_kubernetes_versions.versao_cluster.latest_version

  node_pool {
    name       = "cluster-monitoramento"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
}

variable "region" {
  default = ""
}

variable "digital_ocean_api_token" {
  default = ""
}

resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.cluster_k8s_do.kube_config.0.raw_config
  filename = "kubeconfig-cluster"
}

output "kubectl_get_node" {
  value = "kubectl --kubeconfig kubeconfig-cluster get node"
}