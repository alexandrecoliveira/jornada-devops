# Desafio 02

## Deployment

### Criação

```bash
kubectl apply -f deploy.yaml
```

### Teste via cURL

Convertendo 50 graus celsius para fahrenheit:

```bash
curl -s 'localhost:30800' --data-raw 'selectTemp=1&valorRef=50' | grep -A 1 'Valor ' | tr -d " "
```

#### Resultado:

```bash
<h3>ValorConvertido</h3>
122
```

## Remoção 

```bash
kubectl delete -f deploy.yaml
```