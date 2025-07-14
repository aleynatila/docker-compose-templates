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

## Requirements

- Docker Engine
- Docker Compose v2.0+

## Contributing

Pull requests are welcome! When adding new templates:
1. Create a new directory for your template
2. Add the `docker-compose.yml` file
3. Include usage instructions in the template's README.md

## License

MIT License
