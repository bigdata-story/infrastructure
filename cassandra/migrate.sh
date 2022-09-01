# /bin/bash

docker run --network story-network -v "$(pwd)"/migrations/:/migrations/ cassandra:3.11.13 cqlsh -f migrations/migration.cql cassandra-cluster
