<?php

// Put your device token here (without spaces):
$deviceToken = '5dd43251b984a1bef80d412834acd8999cc47f22f9e20881f452072848e0adb8';

// Put your private key's passphrase here:
$passphrase = 'authen2cate';

// Put your alert message here:
$message = 'Juniper Networks';

////////////////////////////////////////////////////////////////////////////////

$ctx = stream_context_create();
stream_context_set_option($ctx, 'ssl', 'local_cert', 'ck.pem');
stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

// Open a connection to the APNS server
$fp = stream_socket_client(
	'ssl://gateway.sandbox.push.apple.com:2195', $err,
	$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);

if (!$fp)
	exit("Failed to connect: $err $errstr" . PHP_EOL);

echo 'Connected to APNS' . PHP_EOL;

// Create the payload body
$json = array(
	'T' => '2016.01.12 13:17:33 EST',
	'App_Push_Pin' => true,
	'aps' => array(
		'alert' => $message,
		'sound' => 'default'
	),
	'S' => 'MI ',
	'CT' => 'Troy ',
	'UID' => 'nland',
	'tag' => 'sendAppPush',
	'IP' => '127.0.0.1',
	'CO' => 'US ',
	'msg' => $message
);

// Encode the payload as JSON
$payload = json_encode($json);

echo 'Payload: ' . $payload . "\n";

// Build the binary notification
$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;

// Send it to the server
$result = fwrite($fp, $msg, strlen($msg));

if (!$result)
	echo 'Message not delivered' . PHP_EOL;
else
	echo 'Message successfully delivered' . PHP_EOL;

// Close the connection to the server
fclose($fp);
