# /bin/bash

docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 --replication-factor 3 --partitions 30 --topic events_by_user_id
docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 --replication-factor 3 --partitions 30 --topic events_by_user_id_course_id
docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka2:9092,kafka3:9092 --replication-factor 3 --partitions 30 --topic video_events_by_user_id_course_id


server {
    listen 80;
    server_name hdfs.story.samssh.ir;
    server_tokens off;
    client_max_body_size 40M;

    location / {
        return 301 https://$host$request_uri;
    }

    location ~ /.well-known/acme-challenge {
         allow all;
         root /var/www/certbot;
     }
}

server {
    listen 443 ssl;
    server_name hdfs.story.samssh.ir;
    server_tokens off;
    client_max_body_size 40M;

    ssl_certificate /etc/letsencrypt/live/cassandra.story.samssh.ir/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/cassandra.story.samssh.ir/privkey.pem;

    location / {
        proxy_pass  http://localhost:3000;
        proxy_set_header    Host                $http_host;
        proxy_set_header    X-Real-IP           $remote_addr;
        proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
    }
}
