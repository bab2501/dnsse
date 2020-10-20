<?php
// Report all PHP errors
error_reporting(-1);
ini_set('max_execution_time', 0);
set_time_limit(0);

echo "=== Start ==="."\r"; 

$servername = "localhost";
$username = "scriptuser";
$password = "6d4619bc89f67405d8ddd5e2c28f3e43"; 
$dbname = "rp2";

$servername2 = "localhost";
$username = "scriptuser";
$password = "6d4619bc89f67405d8ddd5e2c28f3e43"; 
$dbname2 = "rp2";

while(true) {
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	$sql = 'SELECT
		`se_zone`.`id` AS `id`,
		`se_zone`.`data` AS `NAMESERVER`,
		`se_zone`.`rtype`,
		`nsdata_check`.`id` AS `checkId`,
		`nsdata_check`.`nsdata`,
		`nsdata_check`.`zonelink`,
		`nsdata_check`.`ping`,
		`nsdata_check`.`soa`,
		`nsdata_check`.`whois`,
		`nsdata_check`.`data` AS `data`,
		`nsdata_check`.`date`
	FROM `se_zone`
	LEFT JOIN `nsdata_check`
	ON `se_zone`.`id` = `nsdata_check`.`zonelink`
	WHERE
	`se_zone`.`rtype` = "NS" AND
	`nsdata_check`.`id` IS NULL
	LIMIT 0,5000;'; 
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
	  // output data of each row
	 $conn2 = new mysqli($servername2, $username2, $password2, $dbname2);
	 $sql2 = "INSERT INTO `nsdata_check` (`id`, `nsdata`, `zonelink`, `ping`, `pingdata`, `soa`, `whois`, `data`, `date`) VALUES";
	  while($row = $result->fetch_assoc()) {
			$soaout = trim(preg_replace('/\s+/', ',', exec("dig +nocomments +nocmd SOA ".$row["NAMESERVER"]." @127.0.0.1 | grep -v ';' | head -n 1")));
			$soafirst = substr($soaout, 0, strpos($soaout, ","));;
			$sql2 .= "(NULL, NULL, ".$row["id"].", NULL, NULL, '".$soafirst."', NULL, '".$soaout."', CURRENT_TIME()), ";
		}
		//var_dump($erdom);
		$sql2 = substr($sql2, 0, -2).";";
		$conn2->query($sql2);
		echo var_dump($sql2);
		echo $conn2->error;
		$conn2->close();
	} else {
	  echo $conn->error;
	}
	echo "=======\r\n".date(DATE_RFC2822)."\r\n ==============\r\n";
	//}
	$conn->close();
	sleep(1);
}
//$conn2->close();
?>
