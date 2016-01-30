<?php

$AUTOCONFIG = array(
  "dbtype"           => "mysql",
  "dbhost"           => "lc-mysql",
  "dbuser"           => "root",
  "dbpass"           => "cloud",
  "dbname"           => "owncloud",
  "dbtableprefix"    => "",

  "adminlogin"       => "admin",
  "adminpass"        => "admin",

  "overwritehost"     => "{{ public_domains|first }}",
  "overwriteprotocol" => "https",
  "overwritewebroot"  => "/owncloud",
);
