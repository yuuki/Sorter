#! /usr/bin/perl
# -*- coding:vim -*-

package Sorter;
use strict;
use warnings;


sub new {
    my ($class) = @_;

    my $data_structure = {
	values => [],
    };

    my $self = bless $data_structure, $class;
    return $self;
}

sub set_values {
    my ($self, @values) = @_;
    $self->{values} = [@values];
    return $self;
}

sub get_values {
    my ($self) = @_;

    return @{ $self->{values} };
}	

sub _quick_sort {
    my (@values) = @_;
	
    return @values  if ($#values < 1);

    # pivotとして先頭の値を選択する
    my $pivot = shift @values;
	
    my @left = ();
    my @right = ();
    foreach my $value (@values) {
	if ($value <= $pivot) {	
	    push @left, $value;
	} else {
	    push @right, $value;
	}
    }
    @left = &_quick_sort(@left);
    @right = &_quick_sort(@right);

    return (@left, $pivot, @right);
}

sub sort {
    my ($self) = @_;

    $self->{values} = [&_quick_sort(@{ $self->{values} })];
}

1;

