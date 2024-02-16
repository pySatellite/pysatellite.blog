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
