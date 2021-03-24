#!/usr/bin/perl

use warnings;
use strict;

my $lokal_name = shift @ARGV;
my $jotta_name = shift @ARGV;


open(my $lokal, '<', $lokal_name);
open(my $jotta, '<', $jotta_name);
open(my $utfil, '>', "utfil.txt");


my %jotta_hash =();
my @lokal_only = ();


while(<$jotta>) {
  if ( /([a-z0-9]{32})/ ) {
     $jotta_hash{$1} = 1;
  }
}

while (<$lokal>) {
  if (/([a-z0-9]{32})/) {
    unless ($jotta_hash{$1}) {
      print $utfil $_;
    }
  }


}

close($utfil);

