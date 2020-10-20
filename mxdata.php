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

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

for ($x = 0; $x <= 888888; $x++) {
	$y = $x *100;
	$z = $y + 100;
	echo "Start:". $y ."\n";
	echo "Stop:". $z ."\n";

$sql = 'SELECT `id`, `label`, `ttl`, `class`, `rtype`, `data` FROM `se_zone` WHERE rtype = "ns" LIMIT 100 OFFSET '.$y.';';
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  $conn2 = new mysqli($servername2, $username2, $password2, $dbname2);
  $sql2 = "INSERT INTO `mxdata` (`id`, `zonelink`, `rcode`, `PREFERENCE`, `EXCHANGE`) VALUES ";
  while($row = $result->fetch_assoc()) {
	unset($mx);
	$mx["status"] = trim(shell_exec("dig MX ".$row["label"]." @".$row["data"]." | grep -E -o 'status:(.*),' | cut -c 9- | rev | cut -c2- | rev"));
	if($mx["status"] == "NOERROR") {
		$mx["data_str"] = trim(shell_exec("dig MX ".$row["label"]." @".$row["data"]." +short"));
	} else {$mx["data_str"] = ""; }
	$mx["data"] = explode(PHP_EOL, $mx["data_str"]);
	foreach ($mx["data"] as $mxrecord) {
		$mx["rcode"] = rcode($mx["status"]);
		//echo "dig MX ".$row["label"]." @".$row["data"]." +short - code".$mx["rcode"]."\r\n";
		$mx["mxrecord"] = preg_split('/\s+/', trim($mxrecord));
		if($mx["mxrecord"][0] == "") {continue;}
		else {
			$mx["PREFERENCE"] = array_shift($mx["mxrecord"]);
			$mx["EXCHANGE"] = array_shift($mx["mxrecord"]);
			if(is_numeric($mx["PREFERENCE"])) {
				$sql2 .= "(NULL, '".$row["id"]."', ".$mx["rcode"].", ".trim($mx["PREFERENCE"]).", '".$mx["EXCHANGE"]."'), ";}
			else {$sql2 .= "(NULL, '".$row["id"]."', -1, NULL, '".$mx["data_str"]."'), ";}
		}
	}
  }
	$sql2 = substr($sql2, 0, -2).";";
  	$conn2->query($sql2);
	echo var_dump($sql2);
	echo $conn2->error;
	$conn2->close();
} else {
  echo $conn->error;
}
sleep(2);
echo "=======\r\n".date(DATE_RFC2822)."\r\n ==============\r\n";
}
$conn->close();

?>
