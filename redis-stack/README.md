# Redis Stack

A complete Redis development environment with monitoring and management tools.

## Services

- **Redis 7** - Redis server with Alpine Linux
- **RedisInsight** - Redis GUI for monitoring and management
- **Redis Commander** - Web-based Redis management tool

## Quick Start

1. Navigate to the redis-stack directory
2. Start the services:

```bash
docker-compose up -d
```

3. Access the applications:
   - Redis Server: localhost:6379
   - RedisInsight: http://localhost:8001
   - Redis Commander: http://localhost:8002

## Configuration

### Redis Configuration
The Redis server uses a custom configuration file (`redis.conf`) with:
- Data persistence enabled
- Memory management (256MB limit)
- Append-only file for durability
- Optimized for development

### Security
To enable authentication, uncomment the `requirepass` line in `redis.conf`:
```
requirepass your_secure_password
```

## Data Persistence

Redis data is persisted in the `redis_data` volume with:
- RDB snapshots for point-in-time recovery
- AOF (Append Only File) for maximum durability

## Management Tools

### RedisInsight (http://localhost:8001)
- Visual Redis database browser
- Real-time monitoring and profiling
- CLI with syntax highlighting
- Performance analysis tools

### Redis Commander (http://localhost:8002)
- Web-based Redis management
- Key-value browser and editor
- Database statistics
- Command line interface

## Usage Examples

### Connect with Redis CLI
```bash
# From host
redis-cli -h localhost -p 6379

# From container
docker exec -it redis-server redis-cli
```

### Basic Redis Commands
```bash
# Set and get values
SET mykey "Hello Redis"
GET mykey

# Work with lists
LPUSH mylist "item1" "item2"
LRANGE mylist 0 -1

# Set expiration
SETEX tempkey 60 "expires in 60 seconds"
TTL tempkey
```

## Stopping Services

```bash
docker-compose down
```

To remove all data:
```bash
docker-compose down -v
```

## Troubleshooting

### Common Issues
1. **Port conflicts**: Change port mappings in docker-compose.yml
2. **Memory issues**: Adjust maxmemory in redis.conf
3. **Persistence**: Check volume permissions and disk space

### Useful Commands
```bash
# View Redis logs
docker-compose logs redis

# Monitor Redis commands
docker exec -it redis-server redis-cli monitor

# Check Redis info
docker exec -it redis-server redis-cli info

# Backup Redis data
docker exec -it redis-server redis-cli bgsave
```
