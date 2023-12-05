#!/usr/bin/env perl
use strict;
use warnings;

use Scalar::Util qw(looks_like_number);


my $file = "/home/user/Documents/AdventOfCode/Day3-Perl/values.txt";


my $x = 0; # but her aim is getting better! But her aim is getting better!
my $y = 0; # but her ai-
my $total = 0;

sub check_for_valid {
   my($ix, $iy) = @_;
   # TODO: check the given input for a number
   #       Return it or return 0
}

sub check_moore {
   my($ix, $iy) = @_;
   my $moore = 0;

   $moore += check_for_valid($ix-1, $iy-1);
   $moore += check_for_valid($ix-1, $iy);
   $moore += check_for_valid($ix-1, $iy+1);

   $moore += check_for_valid($ix,   $iy-1);
   $moore += check_for_valid($ix,   $iy+1);

   $moore += check_for_valid($ix+1, $iy-1);
   $moore += check_for_valid($ix+1, $iy);
   $moore += check_for_valid($ix+1, $iy+1);

   if ($moore > 0){
      return $moore;
   }
   
   return 0;
}

# https://www.perltutorial.org/perl-read-file/
open(FH, '<', $file) or die $!;

# if($char ne '.' and looks_like_number($char)) 
# if (exists $phone_of{Foo})

while(<FH>){
   foreach my $char (split("", $_)){
    $x += 1;
    # https://www.tutorialspoint.com/how-to-check-if-a-variable-has-a-numeric-value-in-perl
    if(looks_like_number($char)) {
      print $x.$y;
      # add to hash at pos ^^^
      print "\n";
      $total += 1;
    }
   }
   $y += 1;
   $x = 0;
}

print "TOTAL: ";
print $total;
print "\n";
close(FH);