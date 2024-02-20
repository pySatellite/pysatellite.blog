#!/bin/bash

# rm & rmi
figlet remove all
sudo docker stop $(sudo docker ps -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)
sudo docker network rm manual

figlet build
sudo docker build -t blog-a -f docker/blog-a/Dockerfile docker/blog-a
sudo docker build -t blog-b -f docker/blog-b/Dockerfile docker/blog-b
sudo docker build -t lb -f docker/lb/Dockerfile docker/lb

figlet run
sudo docker run -d --name blog-a-1 -p 8001:80 blog-a
sudo docker run -d --name blog-b-1 -p 8002:80 blog-b
sudo docker run -d --name lb-1 -p 8003:80 lb

figlet ps
sudo docker ps

# docker network
figlet network
sudo docker network create manual
sudo docker network connect manual blog-a-1
sudo docker network connect manual blog-b-1
sudo docker network connect manual lb-1

# lb start
sudo docker start lb-1

# inspect
figlet inspect
sudo docker network inspect manual

# end
sl -aF
