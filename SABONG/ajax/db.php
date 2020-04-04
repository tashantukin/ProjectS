<?php
// error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
// error_reporting(0);
// /* Database connection start */
//$servername = "213.190.6.43";
//$username = "u208625346_tashantukin";
//$password = "natashamaruska";
$servername = "localhost";
$username = "";
$password = "";
$dbname = "u208625346_derby";
$conn = mysqli_connect($servername, $username, $password, $dbname); //or die("Connection failed: " . mysqli_connect_error());

if (mysqli_connect_errno()) {
   printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}else {
    // printf("connection to host succeeded");
}
?>
