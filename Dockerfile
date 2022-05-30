FROM node:lts-buster

RUN apt update && apt upgrade
apt install git -y
apt install nodejs -y
apt install ffmpeg -y
git clone https://github.com/zhwzein/Killua-Zoldyck
cd Killua-Zoldyck
pkg install yarn
yarn add @adiwajshing/baileys
yarn

COPY package.json .

RUN npm install && npm install pm2 -g 

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
