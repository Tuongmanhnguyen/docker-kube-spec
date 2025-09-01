FROM node:22

WORKDIR /app

COPY package*.json .

RUN npm ci

#copy source code of the app

COPY src/index.js index.js

#expose application port
EXPOSE 3000

#Start the app

CMD [ "node", "index.js" ]
