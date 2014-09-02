#!/bin/sh

# CentOS 6 64bit
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

yum --enablerepo=remi install gcc gcc-c++ php php-devel php-mbstring php-pear php-pecl-memcache php-pdo php-mysql php-mssql php-pgsql php-pecl-apc httpd-devel mysql-server vim-enhanced screen zsh memcached php-soap php-mcrypt php-gd php-xml php-dba telnet ntp bind-utils unzip rsync postfix mod_ssl git cronolog php-tidy mlocate mailx jwhois ImageMagick php-pecl-imagick s3cmd perl-CPAN wget fio bc ack openssl openssl-devel zlib-devel readline-devel poppler-utils zip nkf rubygems ruby-devel 

gem install less
gem install therubyracer
