#!/bin/sh

password=abcd1234
filename=mysql_`date +%Y%m%d`.sql.gz

echo Generating MySQL Dump: ${filename}
mysqldump -uroot --all-databases | gzip -c9 | openssl enc -e -aes-128-cbc -pass pass:${password} > ~/backup/${filename}

echo Uploading ${filename} to S3 bucket
php ~/bin/s3upload.php ${filename}

echo Removing local ${filename}
rm -f ~/backup/${filename}

echo Complete

