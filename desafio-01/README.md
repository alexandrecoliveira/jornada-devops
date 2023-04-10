# Desafio 01

## Geração da imagem

### TAG latest
```bash
docker build -t coliveiraa/desafio-01/conversao-temperatura:latest .
```

### TAGs incrementais
```bash
docker build -t coliveiraa/desafio-01/conversao-temperatura:0.0.1 .
```

## Execução do container

```bash
docker container run -d --name desafio-01 -p 8080:8080 coliveiraa/desafio-01/conversao-temperatura:latest
```

## Limpeza

```bash
docker container rm -f desafio-01
```