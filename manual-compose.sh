#!/bin/bash

# var

# start
figlet -f bubble start

# rm & rmi
figlet stop & rm & rmi
sudo docker stop $(sudo docker ps -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)

# build
figlet build
sudo docker images build -t blog-a -f docker/blog-a/Dockerfile docker/blog-a
sudo docker images build -t blog-b -f docker/blog-a/Dockerfile docker/blog-b
sudo docker images build -t lb -f docker/lb/Dockerfile docker/lb

# docker network
sudo docker network create 2402240
sudo docker network connect 240220 awsgoo-nginx-proxy-1
sudo docker network connect 240220 awsgoo-blog-1
sudo docker network connect 240220 awsgoo-blog-2
sudo docker network inspect 2402240


# run
figlet run
sudo docker run -d blog-a-1 -p 8001:80 blog-a
sudo docker run -d blog-b-1 -p 8002:80 blog-b
sudo docker run -d lb-1 -p 8000:80 lb

# ps
figlet ps
sudo docker ps -a
sudo docker network ps

# end
sl -a
