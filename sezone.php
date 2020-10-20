<?php
// Report all PHP errors
error_reporting(-1);
ini_set('max_execution_time', 0);
set_time_limit(0);


echo "=== Start ==="."\r"; 

$servername = "11.blaauwgeers.amsterdam";
$username = "scriptuser";
$password = "6d4619bc89f67405d8ddd5e2c28f3e43"; 
$dbname = "rp2";

$zonefile_url["SE"] = "/home/ablaauwgeers/zonese/20200729/se.zone.txt";
$zonefile_content["SE"] = array();

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if ($file = fopen($zonefile_url["SE"], "r")) {
    $lnr = 0;
    while(!feof($file)) {
        $line = fgets($file);
	if($lnr <= 6452325) {$lnr++; continue;}
        # do same stuff with the $line
	#$zonefile_content["SE"][] = preg_split('/\s+/', $line);
	$tmp = preg_split('/\s+/', $line);
	$tmp_row["label"] = array_shift($tmp);
	$tmp_row["ttl"] = array_shift($tmp);
	$tmp_row["class"] = array_shift($tmp);
	$tmp_row["rtype"] = array_shift($tmp);
	$tmp_row["data"] = implode(" ", $tmp);
	$sql = "INSERT INTO `se_zone` (`id`, `label`, `ttl`, `class`, `rtype`, `data`) VALUES (NULL, '".$tmp_row["label"]."', '".$tmp_row["ttl"]."', '".$tmp_row["class"]."', '".$tmp_row["rtype"]."', '".$tmp_row["data"]."');"; 
	$conn->query($sql);
	echo $conn->error;
	$lnr++;
    }
    fclose($file);
}

#var_dump($zonefile_content["SE"]);


?>
