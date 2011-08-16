#! /usr/bin/perl
# -*- coding:utf-8 -*-

use strict;
use warnings;
use MergeSorter;
use QuickSorter;
use SelectionSorter;

my $sorter = MergeSorter->new;
$sorter->set_values(89,43,21,3,98,44,2,8,7,34,12,90,34,78,3,43,1,1,1,3);
$sorter->sort;
print "MergeSorter result:" . "\n";
print join(',', $sorter->get_values) . "\n\n";

$sorter = QuickSorter->new;
$sorter->set_values(89,43,21,3,98,44,2,8,7,34,12,90,34,78,3,43,1,1,1,3);
$sorter->sort;
print "QuickSorter result:" . "\n";
print join(',', $sorter->get_values) . "\n\n";

$sorter = SelectionSorter->new;
$sorter->set_values(89,43,21,3,98,44,2,8,7,34,12,90,34,78,3,43,1,1,1,3);
$sorter->sort;
print "SelectionSorter result:" . "\n";
print join(',', $sorter->get_values) . "\n\n";


