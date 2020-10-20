<?php

// Configure PHP to report errors and keep working.
error_reporting(-1);
ini_set('max_execution_time', 0);
set_time_limit(0);

echo "=== Start ==="."\r"; 

// Database Connection
$servername = "localhost";
$username = "scriptuser";
$password = "6d4619bc89f67405d8ddd5e2c28f3e43"; 
$dbname = "rp2";

$servername2 = "11.blaauwgeers.amsterdam";
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
		`mxdata`.`id` AS `id`,
		`mxdata`.`zonelink`,
		`mxdata`.`rcode`,
		`mxdata`.`PREFERENCE`,
		`mxdata`.`EXCHANGE`,
		`mxdata_check`.`id` AS `checkId`,
		`mxdata_check`.`mxdata`,
		`mxdata_check`.`ping`,
		`mxdata_check`.`soa`,
		`mxdata_check`.`whois`,
		`mxdata_check`.`data`,
		`mxdata_check`.`date`
	FROM `mxdata`
	LEFT JOIN `mxdata_check`
	ON `mxdata`.`id` = `mxdata_check`.`mxdata`
	WHERE `mxdata_check`.`ping` = 0 AND
	`mxdata_check`.`soa` IS NULL
	LIMIT 100;'; 
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
	  // output data of each row
	 $conn2 = new mysqli($servername2, $username2, $password2, $dbname2);
	 //$sql2 = "INSERT INTO `mxdata_check` (`id`, `mxdata`, `zonelink`, `ping`, `pingdata`, `soa`, `whois`, `data`, `date`) VALUES";
	  while($row = $result->fetch_assoc()) {
			$dapex = explode(".",$row["EXCHANGE"]);
			$dapex = implode(".",array($dapex[1],$dapex[2]));
			$soaout = "";$pingout = "";$pingint = null;
			$pingout = trim(exec("ping -f -c 10 ".$row["EXCHANGE"]." | tail -n 2 | head -n 1"));
						if($pingout == "") {$pingint = 4;}
			elseif(strpos($pingout," 100% packet loss") !== false) {$pingint = 0; echo "q0";}
			elseif(strpos($pingout," 0% packet loss") !== false) {$pingint = 1; echo "q1";}
			else {$pingint = 2; echo "q2";}
			$soaout = trim(preg_replace('/\s+/', ',', exec("dig +nocomments +nocmd SOA ".$row["EXCHANGE"]." | grep -v ';' | head -n 1")));
			$soafirst = substr($soaout, 0, strpos($soaout, ","));;
			$whois = preg_replace('/\s/', '', trim(shell_exec("whois ".$dapex.'| grep -E "^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri|Status" | head -n 1')));
			if(empty($whois)){$whois = preg_replace('/\s/', '', trim(shell_exec("whois ".$dapex."| grep -o -E '^[^#]*' | head -n 1")));}			
			$sql2 = "UPDATE `mxdata_check` SET 
				`mxdata_check`.`soa` = '".$soafirst."',
				`mxdata_check`.`ping` = '".$pingint."',
				`mxdata_check`.`pingdata` = '".$pingout."',
				`mxdata_check`.`whois` = '".$whois."',
				`mxdata_check`.`date` = CURRENT_TIME()
			WHERE `mxdata_check`.`zonelink` = ".$row["zonelink"].";";
			$conn2->query($sql2);
			var_dump($sql2);
		}
		//var_dump($erdom);
		//$sql2 = substr($sql2, 0, -2).";";
		//$conn2->query($sql2);
		//echo var_dump($sql2);
		//echo $conn2->error;
		$conn2->close();
	} else {
	  echo $conn->error;
	}
	sleep(2);
	echo "=======\r\n".date(DATE_RFC2822)."\r\n ==============\r\n";
	//}
	$conn->close();
}
//$conn2->close();
?>
