#!/usr/bin/perl

use warnings;
use strict;

# Finn alle filer som finst i A men ikkje i B. 
# Kopi av oppskrift 4.8 i Perl Cookbook

my $a_namn = shift @ARGV;
my $b_namn = shift @ARGV;


open(my $a, '-|', qq(jotta-cli ls -l "$a_name") );
open(my $b, '-|', qq(jotta-cli ls -l "$b_name") );
open(my $utfil, '>', "utfil.txt");


my %b_hash =();

while(<$b>) {
  if ( /([a-z0-9]{32})/ ) {
     $b_hash{$1} = $_;
  }
}

print $utfil "Har gått gjennom alle filene i $a_namn. Dei fylgjande filene fanst i $a_namn, men ikkje i $b_namn:\n";

while (<$a>) {
  if (/([a-z0-9]{32})/) {
    unless ($b_hash{$1}) {
      print $utfil $_;
    }
  }


}

close($utfil);

