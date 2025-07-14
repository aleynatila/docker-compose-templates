# LAMP Stack

A complete LAMP (Linux, Apache, MySQL, PHP) development environment using Docker Compose.

## Services

- **Apache with PHP 8.2** - Web server with PHP support
- **MySQL 8.0** - Database server
- **phpMyAdmin** - Web-based MySQL administration tool

## Quick Start

1. Clone this repository
2. Navigate to the lamp-stack directory
3. Create the source directory: `mkdir src`
4. Add your PHP files to the `src` directory
5. Run the stack:

```bash
docker-compose up -d
```

## Access URLs

- **Website**: http://localhost
- **phpMyAdmin**: http://localhost:8080

## Database Credentials

- **Host**: mysql
- **Database**: lamp_db
- **Username**: lamp_user
- **Password**: lamp_password
- **Root Password**: rootpassword

## Directory Structure

```
lamp-stack/
├── docker-compose.yml
├── src/                 # Your PHP application files
├── apache-config/       # Apache configuration files
└── mysql-init/         # MySQL initialization scripts
```

## Stopping the Stack

```bash
docker-compose down
```

To remove volumes as well:

```bash
docker-compose down -v
```
