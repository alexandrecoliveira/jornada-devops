# Desafio 04

## CI/CD

### Java

```bash
apt-get update && apt-get install openjdk-17-jdk curl -y
```

### Jenkins

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
```

```bash
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
```

```bash
sudo apt-get update && sudo apt-get install jenkins -y
```

### Docker

```bash
curl -fsSL https://get.docker.com | sh && usermod -aG docker jenkins && systemctl restart jenkins
```

### Kubectl

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
kubectl version --client
```