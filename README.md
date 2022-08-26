# big data story infrastructure

fisrt of all create network on docker

```bash
docker network create story-network
```

### cassandra

to setup cassandra cluster

```bash
cd cassandra
docker-compose up -d
```

for run cqlsh
```bash
docker run --rm -it --network story-network nuvo/docker-cqlsh cqlsh cassandra-cluster 9042 --cqlversion='3.4.4'
```

