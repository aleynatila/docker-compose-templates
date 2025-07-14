# ELK Stack

A complete ELK (Elasticsearch, Logstash, Kibana) stack for log analysis and monitoring.

## Services

- **Elasticsearch 8.11.0** - Search and analytics engine
- **Logstash 8.11.0** - Data processing pipeline
- **Kibana 8.11.0** - Data visualization dashboard

## Quick Start

1. Navigate to the elk-stack directory
2. Start the stack:

```bash
docker-compose up -d
```

3. Wait for all services to be healthy (may take a few minutes)
4. Access Kibana at http://localhost:5601

## Service URLs

- **Kibana Dashboard**: http://localhost:5601
- **Elasticsearch API**: http://localhost:9200
- **Logstash**: localhost:5044 (Beats), localhost:5000 (TCP/UDP)

## Sending Logs

### Using TCP

```bash
echo "Test log message" | nc localhost 5000
```

### Using UDP

```bash
echo "Test log message" | nc -u localhost 5000
```

### Using HTTP (to Elasticsearch directly)

```bash
curl -X POST "localhost:9200/test-index/_doc" -H 'Content-Type: application/json' -d'
{
  "message": "Hello World",
  "timestamp": "2024-01-01T00:00:00Z"
}
'
```

## Configuration

- **Logstash configuration**: `logstash/config/logstash.conf`
- **Logstash settings**: `logstash/logstash.yml`

## Memory Requirements

This stack requires at least 4GB of RAM. If you're running on a machine with less RAM, consider reducing the heap sizes in the docker-compose.yml file.

## Stopping the Stack

```bash
docker-compose down
```

To remove volumes as well:

```bash
docker-compose down -v
```

## Kibana Initial Setup

1. Open Kibana at http://localhost:5601
2. Go to Management > Stack Management > Index Patterns
3. Create an index pattern for "logs-*"
4. Set "@timestamp" as the time field
5. Go to Discover to view your logs
