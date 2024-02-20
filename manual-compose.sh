#!/bin/bash

sudo docker build -t blog-a -f docker/blog-a/Dockerfile docker/blog-a
sudo docker run -d blog-a-1 -p 8001:80 blog-a

sl

sudo docker ps -a
