curl -X POST \
  http://192.168.49.2:30500/connectors \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "containers-connector",
    "config": {
            "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
            "plugin.name": "pgoutput",
            "database.hostname": "postgres-postgresql",
            "database.port": "5432",
            "database.user": "postgres",
            "database.password": "passw0rd",
            "database.dbname": "postgres",
            "database.server.name": "postgres",
            "table.whitelist": "public.containers"
      }
}'
