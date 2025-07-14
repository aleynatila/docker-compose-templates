#!/bin/bash

# Docker Compose Health Check Script
# This script checks the health of all services in the templates

check_service_health() {
    local service_name=$1
    local port=$2
    local protocol=${3:-http}
    
    echo "Checking $service_name on port $port..."
    
    if nc -z localhost $port; then
        echo "✓ $service_name is running on port $port"
        return 0
    else
        echo "✗ $service_name is not responding on port $port"
        return 1
    fi
}

check_template_health() {
    local template_dir=$1
    echo "===================="
    echo "Checking $template_dir"
    echo "===================="
    
    cd "$template_dir" || return 1
    
    if [ ! -f "docker-compose.yml" ]; then
        echo "✗ No docker-compose.yml found in $template_dir"
        return 1
    fi
    
    # Check if containers are running
    local running_containers=$(docker-compose ps -q)
    if [ -z "$running_containers" ]; then
        echo "✗ No containers are running in $template_dir"
        return 1
    fi
    
    # Template-specific health checks
    case "$template_dir" in
        "lamp-stack")
            check_service_health "Apache" 80
            check_service_health "phpMyAdmin" 8080
            ;;
        "elk-stack")
            check_service_health "Elasticsearch" 9200
            check_service_health "Kibana" 5601
            check_service_health "Logstash" 5044
            ;;
        "wordpress")
            check_service_health "WordPress" 8000
            check_service_health "phpMyAdmin" 8080
            ;;
        "redis-stack")
            check_service_health "Redis" 6379
            check_service_health "RedisInsight" 8001
            check_service_health "Redis Commander" 8002
            ;;
        "postgresql")
            check_service_health "PostgreSQL" 5432
            check_service_health "pgAdmin" 8080
            ;;
    esac
    
    echo ""
}

main() {
    echo "Docker Compose Templates Health Check"
    echo "====================================="
    echo ""
    
    # Check if Docker is running
    if ! docker info > /dev/null 2>&1; then
        echo "✗ Docker is not running"
        exit 1
    fi
    
    # Check if docker-compose is available
    if ! command -v docker-compose &> /dev/null; then
        echo "✗ docker-compose is not installed"
        exit 1
    fi
    
    # Check each template
    for template in lamp-stack elk-stack wordpress redis-stack postgresql; do
        if [ -d "$template" ]; then
            check_template_health "$template"
        fi
    done
    
    echo "Health check completed!"
}

main "$@"
