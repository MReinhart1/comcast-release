FROM node:16 AS base
WORKDIR /usr/src/app
LABEL project=merlin-service
COPY package*.json ./

RUN npm install

FROM base
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]