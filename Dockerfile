FROM alpine:latest

WORKDIR /opt/app

COPY package*.json ./
COPY server.js ./

RUN npm install
RUN npm run test


COPY . .

RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser  -G appuser 

EXPOSE 8081
CMD [ "node", "server.js" ]
