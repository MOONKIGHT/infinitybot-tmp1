FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*
RUN pkg install yarn
RUN yarn add @adiwajshing/baileys
RUN yarn

COPY package.json .

RUN npm install && npm install pm2 -g 

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
