#!/bin/sh

sed -e "s|;date.timezone =|date.timezone = Asia/Tokyo|" php.ini > .php.ini.tmp1

sed -e "s|session.name = PHPSESSID|session.name = sessid|" .php.ini.tmp1 > .php.ini.tmp2

sed -e "s|session.hash_function = 0|session.hash_function = 1|" .php.ini.tmp2 > .php.ini.tmp1

sed -e "s|session.gc_maxlifetime = 1440|session.gc_maxlifetime = 86400|" .php.ini.tmp1 > php.ini

rm .php.ini.tmp1 .php.ini.tmp2

