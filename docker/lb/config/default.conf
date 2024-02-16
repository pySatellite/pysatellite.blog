upstream serv {
    server pysatellite-blog-a.internal:80;
    server pysatellite-blog-b.internal:80;
}
server {
    listen 80;
        
    location / 
    {
        proxy_pass http://serv;
    }
}
