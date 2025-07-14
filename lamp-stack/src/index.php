<?php
// Database connection
$host = 'mysql';
$dbname = 'lamp_db';
$username = 'lamp_user';
$password = 'lamp_password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $connection_status = "Connected successfully to MySQL database!";
} catch(PDOException $e) {
    $connection_status = "Connection failed: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAMP Stack - Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .status {
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .info {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .links {
            margin-top: 30px;
        }
        .links a {
            display: inline-block;
            margin: 5px 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to LAMP Stack</h1>
        
        <div class="status">
            <strong>Database Status:</strong> <?php echo $connection_status; ?>
        </div>
        
        <div class="info">
            <h3>Environment Information</h3>
            <p><strong>PHP Version:</strong> <?php echo phpversion(); ?></p>
            <p><strong>Server:</strong> <?php echo $_SERVER['SERVER_SOFTWARE']; ?></p>
            <p><strong>Document Root:</strong> <?php echo $_SERVER['DOCUMENT_ROOT']; ?></p>
        </div>
        
        <div class="info">
            <h3>Available Services</h3>
            <ul>
                <li>Apache Web Server with PHP 8.2</li>
                <li>MySQL 8.0 Database</li>
                <li>phpMyAdmin Database Management</li>
            </ul>
        </div>
        
        <div class="links">
            <h3>Quick Links</h3>
            <a href="http://localhost:8080" target="_blank">phpMyAdmin</a>
            <a href="phpinfo.php">PHP Info</a>
        </div>
    </div>
</body>
</html>
