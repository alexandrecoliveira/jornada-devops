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

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image    = "ubuntu-22-04-x64"
  name     = "jenkins"
  region   = var.region
  size     = "s-2vcpu-4gb"
  ssh_keys = [data.digitalocean_ssh_key.chave.id]
}

data "digitalocean_ssh_key" "chave" {
  name = var.nome_chave_ssh
}

data "digitalocean_kubernetes_versions" "versao_cluster" {
  version_prefix = "1.24."
}

resource "digitalocean_kubernetes_cluster" "cluster_k8s_do" {
  name   = "cluster-k8s-do"
  region = var.region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = data.digitalocean_kubernetes_versions.versao_cluster.latest_version

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

variable "region" {
  default = ""
}

variable "digital_ocean_api_token" {
  default = ""
}

variable "nome_chave_ssh" {
  default = ""
}

output "jenkins_ip" {
  value = "ssh root@${digitalocean_droplet.web.ipv4_address}"
}

resource "local_file" "kubeconfig" {
  content  = digitalocean_kubernetes_cluster.cluster_k8s_do.kube_config.0.raw_config
  filename = "kubeconfig-cluster"
}

output "kubectl_get_node" {
  value = "kubectl --kubeconfig kubeconfig-cluster get node"
}