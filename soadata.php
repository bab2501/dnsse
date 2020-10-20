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


function rcode($rname) {
	switch ($rname) {
		case "NOERROR":
			return 0;
			break;
		case "FORMERR":
			return 1;
			break;
		case "SERVFAIL":
			return 2;
			break;
		case "NXDOMAIN":
			return 3;
			break;
		case "NOTIMP":
			return 4;
			break;
		case "REFUSED":
			return 5;
			break;
		case "":
			return "NULL";
			break;
	}
}

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
$conn2 = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

for ($x = 0; $x <= 38800; $x++) {
	$y = $x *100;
	$z = $y + 100;
	echo "Start:". $y ."\n";
	echo "Stop:". $z ."\n";

$sql = 'SELECT `id`, `label`, `ttl`, `class`, `rtype`, `data` FROM `se_zone` WHERE `rtype` = "ns" LIMIT 100 OFFSET '.$y.';';
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
	$soa["status"] = trim(shell_exec("dig SOA ".$row["label"]." @".$row["data"]." | grep -E -o 'status:(.*),' | cut -c 9- | rev | cut -c2- | rev"));
	if($soa["status"] == "NOERROR") {
		$soa["data_str"] = trim(shell_exec("dig SOA ".$row["label"]." @".$row["data"]." +short"));
	} else {$soa["data_str"] == ""; }
	$soa["data"] = preg_split('/\s+/', $soa["data_str"]);
	$tmp = $soa["data"];
	$soa["rcode"] = rcode($soa["status"]);
	$soa["MNAME"] = array_shift($tmp);
        $soa["RNAME"] = array_shift($tmp);
        $soa["SERIAL"] = array_shift($tmp);
        $soa["REFRESH"] = array_shift($tmp);
        $soa["RETRY"] = array_shift($tmp);
	$soa["EXPIRE"] = array_shift($tmp);
	$soa["TTL"] = array_shift($tmp);
	#var_dump($soa);
	$sql2 = "INSERT INTO `soadata` (`id`, `zonelink`, `rcode`, `MNAME`, `RNAME`, `SERIAL`, `REFRESH`, `RETRY`, `EXPIRE`, `TTL`) VALUES (NULL, '".$row["id"]."', '".$soa["rcode"]."', '".$soa["MNAME"]."', '".$soa["RNAME"]."', '".$soa["SERIAL"]."', '".$soa["REFRESH"]."', '".$soa["RETRY"]."', '".$soa["EXPIRE"]."', '".$soa["TTL"]."');";
        #var_dump($sql2);
	$conn2->query($sql2);
        echo $conn->error;
	echo $conn2->error;
  }
} else {
  echo $conn->error;
}
}
$conn->close();

?>
