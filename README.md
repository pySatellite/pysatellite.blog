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
$ docker compose -f docker/compose.yml  up -d --build --force-recreate
```

