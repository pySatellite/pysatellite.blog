#!/bin/bash

# rm & rmi
sudo docker stop $(sudo docker ps -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)


figlet build
sudo docker build -t blog-a -f docker/blog-a/Dockerfile docker/blog-a
sudo docker build -t blog-a -f docker/blog-b/Dockerfile docker/blog-b
#lb build

#docker network

figlet run
sudo docker run -d --name blog-a-1 -p 8001:80 blog-a


#blog-b
#lb

figlet ps
sudo docker ps
