FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git

COPY . /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
