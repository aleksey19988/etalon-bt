<?php
require_once 'settings.php';

class DB {
	
	// Устанавливаем соединение с БД
	public static function connect () {
		$con = new mysqli( HOST, USER, PASS, DB_NAME );
		if (mysqli_connect_errno()) exit ("Не удалось подключиться к базе данных");
		else return $con;
	}
}
?>