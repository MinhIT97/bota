<?php
$servername = "http://localhost/phpmyadmin/";
$database = "laravel";
$username = "root";
$password = "";

$conn = new mysqli($servername, $username, $password);


echo($conn);