<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'spk-air');

try {
	// set dbase untuk mysql
	$pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASS);
	
	// Set Error Mode ke Exception
	# $pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	
	// Set Error Mode ke mode Warning
	$pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING );
	
} 
catch(PDOException $e) {
	die("Ups, tidak dapat terkoneksi ke database<br><br>".$e->getMessage());
}	