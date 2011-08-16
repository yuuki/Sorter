package SelectionSorter;
use strict;
use warnings;
use Sorter;
use base qw(Sorter);


sub new {
    my ($class) = @_;

    my $self = Sorter->new;
    return bless $self;
}


sub _ssort {
    my (@values) = @_;

    foreach my $i (0 .. ($#values - 1)) {
	my $min = $values[$i];
	my $p = $i;
	foreach my $j ($i + 1 .. $#values) {
	    if ($values[$j] < $min) {
		$min = $values[$j];
		$p = $j;
	    }
	}
	$values[$p] = $values[$i];
	$values[$i] = $min;
    }

    return @values;
}

sub sort {
    my ($self) = @_;

    my @result = &_ssort( @{ $self->{values} } );
    $self->{values} = \@result;
}

1;
