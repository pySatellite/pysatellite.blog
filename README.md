# pysatellite.blog

### Dockerfile
```
$ docker build -t unginx:240215 .

$ sudo docker run -d -p 8888:80 unginx:240215

$ curl http://localhost:8888
```

### fly
```
$ flyctl deploy
```

### Docker compose
```
# BUILD
$ sudo docker build -t pysatellite/blog-becky -f docker/blog-a/Dockerfile docker/blog-a/
$ sudo docker build -t pysatellite/blog-tomsawyer -f docker/blog-b/Dockerfile docker/blog-b/

# PUSH
$ sudo docker images
REPOSITORY                   TAG       IMAGE ID       CREATED              SIZE
pysatellite/blog-tomsawyer   latest    5ad307b8bad2   12 seconds ago       259MB
pysatellite/blog-becky       latest    340d5c2c811d   About a minute ago   259MB
$ sudo docker push pysatellite/blog-becky
Using default tag: latest
The push refers to repository [docker.io/pysatellite/blog-becky]
970cb4ddcbe9: Pushed
927599f7c272: Pushed
85384d9fde6f: Pushed
04fe7863cd9d: Pushed
301f383e9ab6: Pushed
66e0315174da: Layer already exists
4339a28aca11: Layer already exists
964ae80dcd09: Layer already exists
6d92d0e97be4: Layer already exists
d101c9453715: Layer already exists
latest: digest: sha256:17dbc6cbe87f0c086a1fd0a6a3971deda0490d7d7ce1ea28fadc3a8c1cdce586 size: 2414
$ sudo docker push pysatellite/blog-tomsawyer
Using default tag: latest
The push refers to repository [docker.io/pysatellite/blog-tomsawyer]
9e15c9936c34: Pushed
f175f23a1bc4: Pushed
85384d9fde6f: Mounted from pysatellite/blog-becky
04fe7863cd9d: Mounted from pysatellite/blog-becky
301f383e9ab6: Mounted from pysatellite/blog-becky
66e0315174da: Layer already exists
4339a28aca11: Layer already exists
964ae80dcd09: Layer already exists
6d92d0e97be4: Layer already exists
d101c9453715: Layer already exists
latest: digest: sha256:34db1d823f17e4d6344f557598bfd0e36e740a9147f7c418ec2ad7a231161539 size: 2414

# compose RUN
# https://docs.docker.com/engine/reference/commandline/compose_up/

$ docker compose -f docker/compose.yml  up -d --build --force-recreate
$ sudo docker compose -f docker/compose.yml  up -d
[+] Running 14/14
 ✔ nginx-proxy 13 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                               4.8s
   ✔ e1caac4eb9d2 Already exists                                                              0.0s
   ✔ 88f6f236f401 Already exists                                                              0.0s
   ✔ c3ea3344e711 Already exists                                                              0.0s
   ✔ cc1bb4345a3a Already exists                                                              0.0s
   ✔ da8fa4352481 Already exists                                                              0.0s
   ✔ c7f80e9cdab2 Already exists                                                              0.0s
   ✔ 18a869624cb6 Already exists                                                              0.0s
   ✔ 66ab28d11695 Pull complete                                                               0.7s
   ✔ 79b57e45edb0 Pull complete                                                               1.0s
   ✔ 2be787a40ace Pull complete                                                               0.9s
   ✔ 563a441cec03 Pull complete                                                               1.3s
   ✔ 4994460aae36 Pull complete                                                               1.5s
   ✔ 4f4fb700ef54 Pull complete                                                               1.6s
[+] Running 2/3
 ⠴ Network awsgoo_default          Created                                                    1.5s
 ✔ Container awsgoo-blog-1         Started                                                    0.9s
 ✔ Container awsgoo-nginx-proxy-1  Started                                                    1.2s
$ sudo docker ps
CONTAINER ID   IMAGE                    COMMAND                  CREATED          STATUS          PORTS                                   NAMES
4448a4bb4063   nginxproxy/nginx-proxy   "/app/docker-entrypo…"   27 seconds ago   Up 26 seconds   0.0.0.0:9889->80/tcp, :::9889->80/tcp   awsgoo-nginx-proxy-1
029e4c3cd450   pysatellite/blog-becky   "/bin/sh -c 'service…"   27 seconds ago   Up 26 seconds   80/tcp                                  awsgoo-blog-1
$ sudo docker images
REPOSITORY                   TAG       IMAGE ID       CREATED          SIZE
pysatellite/blog-tomsawyer   latest    5ad307b8bad2   9 minutes ago    259MB
pysatellite/blog-becky       latest    340d5c2c811d   10 minutes ago   259MB
nginxproxy/nginx-proxy       latest    1a3960925c12   3 hours ago      204MB
```

# scale out/in
```
$ docker compose -f docker/compose.yml  up -d --scale blog=5
```

# compose down -> stop & remove
```
$ docker compose -f docker/compose.yml down
```

# manual script
```
$ chmod +x manual-compose.sh
$ ./manual-compose.sh
```
