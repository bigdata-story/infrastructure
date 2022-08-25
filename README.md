# big data story infrastructure

fisrt of all create network on docker

```bash
docker network create big_data_network
```

### cassandra

to setup cassandra cluster

```bash
cd cassandra
docker-compose up -d
```

for run cqlsh
```bash
docker run --rm -it --network big_data_network nuvo/docker-cqlsh cqlsh cassandra-cluster 9042 --cqlversion='3.4.4'
```

