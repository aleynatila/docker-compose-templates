# Docker Compose Templates

A collection of Docker Compose templates for various technologies and use cases to help you quickly spin up development environments.

## Available Templates

- **LAMP Stack** - Linux, Apache, MySQL, PHP with sample application
- **ELK Stack** - Elasticsearch, Logstash, Kibana for log analysis
- **WordPress** - WordPress with MySQL and phpMyAdmin
- **Redis Stack** - Redis with RedisInsight and Redis Commander
- **PostgreSQL** - PostgreSQL with pgAdmin and sample data
- **MEAN Stack** - MongoDB, Express.js, Angular, Node.js (Coming Soon)
- **Nginx Load Balancer** - Nginx load balancer configuration (Coming Soon)
- **Microservices Template** - Multi-service architecture example (Coming Soon)

## Usage


Each template is located in its own directory. To use a template:

```bash
cd <template-name>
docker-compose up -d
```

### Health Check Script

You can use the `health-check.sh` script to check the status of all services in every template:

```bash
chmod +x health-check.sh
./health-check.sh
```

The script will verify that Docker is running, check for running containers, and attempt to connect to the main service ports for each template. It uses `nc` (netcat) to check if the expected ports are open and responding.

**Note:** Make sure Docker and docker-compose are installed and running before executing the script.

## Requirements

- Docker Engine
- Docker Compose v2.0+

---

## Health Check Script

The `health-check.sh` script allows you to quickly check the health of all stack templates. It outputs the health status of each service in every available template directory (LAMP, ELK, WordPress, Redis, PostgreSQL).

See the section above for usage instructions.

## Contributing

Pull requests are welcome! When adding new templates:
1. Create a new directory for your template
2. Add the `docker-compose.yml` file
3. Include usage instructions in the template's README.md

## License

MIT License
