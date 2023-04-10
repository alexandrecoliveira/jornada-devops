FROM node:19-alpine3.16

WORKDIR /api
COPY conversao-temperatura/src/package*.json ./
RUN npm install
COPY conversao-temperatura/src/ ./
EXPOSE 8080
CMD ["node", "server.js"]