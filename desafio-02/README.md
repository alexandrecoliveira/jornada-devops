# Desafio 02

## Geração da imagem

### TAG latest
```bash
docker build -t coliveiraa/desafio-02-kubenews:latest .
```

### TAGs incrementais
```bash
docker build -t coliveiraa/desafio-02-kubenews:0.0.1 .
```

## Deployment

### Criação dos deployments

```bash
kubectl apply -f deploy-conversao-temperatura.yaml kubenews.yaml
```

### Teste conversao-temperatura via cURL

Convertendo 50 graus celsius para fahrenheit:

```bash
curl -s 'localhost:30800' --data-raw 'selectTemp=1&valorRef=50' | grep -A 1 'Valor ' | tr -d " "
```

Resultado:

```bash
<h3>ValorConvertido</h3>
122
```

### Teste kubenews via cURL

Validando o conteúdo da página inicial:

```bash
curl -s localhost:30900 | grep 'Ainda '
```

Resultado:

```bash
                        <h3>Ainda não temos nenhum post, que tal você criar um ?</h3>
```

## Remoção 

```bash
kubectl delete -f "*".yaml
docker image rm -f node:19.8.1-alpine3.16 postgres:15.0 coliveiraa/desafio-02-kubenews:{latest,0.0.1}
```