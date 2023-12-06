#!/usr/bin/env perl
use strict;
use warnings;

#TODO: THIS. LATER. EGHH.

use Scalar::Util qw(looks_like_number);

my $file = "/home/user/Documents/AdventOfCode/Day3-Perl/values.txt";

my $x = 0; # but her aim is getting better! But her aim is getting better!
my $y = 0; # but her ai-
my $total = 0;

# https://www.perltutorial.org/perl-read-file/
open(FH, '<', $file) or die $!;

# the file data
my @data = [];
while(<FH>){
   push(@data, split("", $_));
}


sub check_for_valid {
   my($ex, $ey) = @_;
   
   # if the number exists, return the value
   if ($y >= 0 and $y < scalar(@data)){
      if ($x >= 0 and $x < scalar(@data[$y])){
         return (@data[$y][$x]);
      }
   }
   
   # if it doesn't, give 0
   return 0;
}

sub check_moore {
   my($ix, $iy) = @_;
   my $moore = 0;

   # add all the surrounding values together
   $moore += check_for_valid($ix-1, $iy-1);
   $moore += check_for_valid($ix-1, $iy);
   $moore += check_for_valid($ix-1, $iy+1);

   $moore += check_for_valid($ix,   $iy-1);
   $moore += check_for_valid($ix,   $iy+1);

   $moore += check_for_valid($ix+1, $iy-1);
   $moore += check_for_valid($ix+1, $iy);
   $moore += check_for_valid($ix+1, $iy+1);

   return $moore;
}

# itterate throuth the data
foreach my @row (@data){
   foreach my $char (@row){
    # https://www.tutorialspoint.com/how-to-check-if-a-variable-has-a-numeric-value-in-perl

    # if it is a check around character, do that,
    if($char ne '.' and !looks_like_number($char)){
      $total += moore($x, $y);
    }

    $x += 1;
   }
   $y += 1;
   $x = 0;
}

print "TOTAL: ";
print $total;
print "\n";
close(FH);