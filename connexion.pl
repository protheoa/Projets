#!/usr/bin/perl

use strict;
use DBI;

my $dbh = DBI->connect(          
    "dbi:SQLite:dbname=personne", 
    "",                          
    "",                          
    { RaiseError => 1 },         
) or die $DBI::errstr;

my $sth = $dbh->prepare("INSERT INTO personne VALUES(null, 'thiam','fallou',25)");
$sth->execute();

my $ver = $sth->fetch();

print @$ver;
print "\n";

$sth->finish();
$dbh->disconnect();