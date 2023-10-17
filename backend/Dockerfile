FROM node:current-alpine3.17

WORKDIR /app

COPY ./package*.json ./

RUN npm ci

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
