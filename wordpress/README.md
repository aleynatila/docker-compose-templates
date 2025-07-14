# WordPress with MySQL

A complete WordPress development environment with MySQL database and phpMyAdmin.

## Services

- **WordPress** - Latest WordPress installation
- **MySQL 8.0** - Database server
- **phpMyAdmin** - Database management interface

## Quick Start

1. Navigate to the wordpress directory
2. Start the services:

```bash
docker-compose up -d
```

3. Access the applications:
   - WordPress: http://localhost:8000
   - phpMyAdmin: http://localhost:8080

## Configuration

### Database Credentials
- **Database**: wordpress
- **Username**: wordpress
- **Password**: wordpress_password
- **Root Password**: root_password

### WordPress Setup
1. Open http://localhost:8000
2. Select your language
3. Enter database details:
   - Database Name: wordpress
   - Username: wordpress
   - Password: wordpress_password
   - Database Host: mysql
   - Table Prefix: wp_

## Data Persistence

- WordPress files are stored in `wordpress_data` volume
- Database data is stored in `mysql_data` volume

## Customization

### Themes and Plugins
Place custom themes and plugins in the WordPress data volume or use the WordPress admin interface.

### Environment Variables
Create a `.env` file to customize:
- Database passwords
- WordPress configuration
- Port mappings

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
2. **Database connection**: Ensure MySQL is fully started before WordPress
3. **Permissions**: WordPress may need write permissions for uploads

### Useful Commands
```bash
# View logs
docker-compose logs wordpress
docker-compose logs mysql

# Access WordPress container
docker exec -it wordpress-app bash

# Database backup
docker exec wordpress-mysql mysqldump -u root -p wordpress > backup.sql
```
