#!/bin/bash

# var
BLOG_1="pysatellite-blog-a.internal"
BLOG_2="pysatellite-blog-b.internal"
BLOG_1_IMG_NAME="blog-1-img"
BLOG_2_IMG_NAME="blog-2-img"

# start
# sl -aF
figlet -f bubble start

#############################
figlet remove all
sudo docker stop $(sudo docker ps -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)
sudo docker network rm blog-net

#############################
# https://docs.docker.com/engine/reference/commandline/image_build/
figlet build
sudo docker image build -t $BLOG_1_IMG_NAME -f docker/blog-a/Dockerfile docker/blog-a
sudo docker image build -t $BLOG_2_IMG_NAME -f docker/blog-b/Dockerfile docker/blog-b
sudo docker image build -t blog-lb -f docker/lb/Dockerfile docker/lb

#############################
# https://docs.docker.com/engine/reference/commandline/network_create/
figlet create network
sudo docker network create -d bridge blog-net

#############################
# https://docs.docker.com/engine/reference/commandline/container_run/
figlet run
sudo docker container run -d --name $BLOG_1 -p 8001:80 --network blog-net $BLOG_1_IMG_NAME
sudo docker container run -d --name $BLOG_2 -p 8002:80 --network blog-net $BLOG_2_IMG_NAME
sudo docker container run -d --name blog-lb-1 -p 8000:80 --network blog-net blog-lb

#############################
figlet ps
sudo docker container ps

figlet -f TEST
curl http://localhost:8000 | grep h1
curl http://localhost:8000 | grep h1

# end
figlet -f bubble END
