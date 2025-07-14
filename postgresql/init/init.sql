-- Initial database setup for PostgreSQL
-- This script runs automatically when the database is first created

-- Create additional databases
CREATE DATABASE testdb;
CREATE DATABASE appdb;

-- Create users
CREATE USER developer WITH PASSWORD 'dev_password';
CREATE USER app_user WITH PASSWORD 'app_password';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE testdb TO developer;
GRANT ALL PRIVILEGES ON DATABASE appdb TO app_user;

-- Create sample table in development database
\c development;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (username, email, password_hash) VALUES 
('john_doe', 'john@example.com', '$2a$10$dummy_hash_1'),
('jane_smith', 'jane@example.com', '$2a$10$dummy_hash_2'),
('admin', 'admin@example.com', '$2a$10$dummy_hash_3');

INSERT INTO posts (title, content, user_id) VALUES 
('Welcome to PostgreSQL', 'This is a sample post to demonstrate the database setup.', 1),
('Docker Compose Setup', 'Easy PostgreSQL setup with Docker Compose.', 2),
('Database Best Practices', 'Some tips for working with PostgreSQL.', 3);

-- Create indexes for better performance
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_created_at ON posts(created_at);

-- Create a view for user posts
CREATE VIEW user_posts AS
SELECT 
    u.username,
    u.email,
    p.title,
    p.content,
    p.created_at
FROM users u
JOIN posts p ON u.id = p.user_id
ORDER BY p.created_at DESC;
