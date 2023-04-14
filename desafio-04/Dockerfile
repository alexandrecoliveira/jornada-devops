FROM node:19.8.1-alpine3.16

WORKDIR /api
COPY desafio-02/kube-news/src/package*.json ./
RUN npm install
COPY desafio-02/kube-news/src/ ./
EXPOSE 8080
CMD ["node", "server.js"]