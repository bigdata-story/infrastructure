# /bin/bash

docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka1:9092,kafka1:9092 --replication-factor 3 --partitions 10 --topic events_by_user_id
docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka1:9092,kafka1:9092 --replication-factor 3 --partitions 10 --topic events_by_course_id
docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka1:9092,kafka1:9092 --replication-factor 3 --partitions 10 --topic events_by_user_id_course_id
docker run --network story-network bitnami/kafka:3.2.1 kafka-topics.sh --create --bootstrap-server kafka1:9092,kafka1:9092,kafka1:9092 --replication-factor 3 --partitions 10 --topic video_events_by_user_id_course_id