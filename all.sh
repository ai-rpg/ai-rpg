#!/bin/sh

sudo apt update
sudo apt install screen -y 

screen -S docker -dm bash -c "cd openai-dm-infra;docker-compose up"

# pip3 install -r openai-DM-AuthService/src/requirements.txt
screen -S auth-service -dm bash -c "pip3 install -r openai-DM-AuthService/src/requirements.txt; python3 openai-DM-AuthService/src/app/bootstrap.py"

# pip3 install -r openai-DM-Socket-Server/src/requirements.txt
screen -S socket-service -dm bash -c "pip3 install -r openai-DM-Socket-Server/src/requirements.txt; python3 openai-DM-Socket-Server/src/app/bootstrap.py"

screen -S mobile-app -dm bash -c "npm install --prefix openai-DM-Mobile/;npm start --prefix openai-DM-Mobile/"

#npm install --prefix openai-DM-Mobile/
#npm start --prefix openai-DM-Mobile/ 