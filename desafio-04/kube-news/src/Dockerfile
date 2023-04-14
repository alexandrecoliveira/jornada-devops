FROM node:19.8.1-alpine3.16

WORKDIR /api
COPY package*.json ./
RUN npm install
COPY . ./
EXPOSE 8080
CMD ["node", "server.js"]