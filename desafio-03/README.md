# Desafio 03

## Terraform

- Ajustar variáveis no arquivo terraform.tfvars

### Init

```bash
terraform init
```

### Planejamento dos recursos

```bash
terraform plan
```

### Criação

Digite `yes` após a inserção do comando para confirmar a criação dos recursos:

```bash
terraform apply
```

- OBS: `terraform apply -auto-approve` realiza a criação dos recursos sem a necessidade de confirmação


### Limpeza do ambiente

O comando abaixo remove apenas os recursos que foram criados diretamente pelo Terraform

```bash
terraform destroy
```

:warning: Verifique se existem mais recursos para serem excluídos em `Projects > Resources`, ex: LoadBalancer criado por um service