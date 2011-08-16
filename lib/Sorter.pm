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

# Overriddeen by sub class 
sub sort { }

1;

