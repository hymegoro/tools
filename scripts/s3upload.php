<?php

// S3.php from http://undesigned.org.za/2007/10/22/amazon-s3-php-class/
require_once("lib/S3.php");

$access_id = '******';
$secret_key = '******';
$bucket_name = '******';
$local_dir = '/home/**/backup/';
$remote_dir = '/';

$s3 = new S3($access_id, $secret_key);
//$s3->putBucket($bucket_name, S3::ACL_PRIVATE);
$s3->putObjectFile($local_dir.$argv[1], $bucket_name, $remote_dir.$argv[1], S3::ACL_PRIVATE);

