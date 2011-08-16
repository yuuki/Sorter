package MergeSorter;
use strict;
use warnings;
use Sorter;
use base qw(Sorter);


sub new {
    my ($class) = @_;

    my $self = Sorter->new;
    return bless $self;
}

sub _merge {
    my ($left, $right) = @_;

    my @result = ();
    while (@$left and @$right) {
	if ($$left[0] < $$right[0]) {
	    push(@result, shift @$left);
	} else {
	    push(@result, shift @$right);
	}
    }
    push(@result, @$left);
    push(@result, @$right);

    return @result;
}

sub _msort {
    my (@values) = @_;

    if (@values <= 1) {
	return @values;
    } 

    # ２分割して, それぞれをソートする.
    my $m = $#values / 2;
    my @left = &_msort(@values[0 .. $m]);
    my @right = &_msort(@values[($m + 1) .. $#values]);

    return &_merge(\@left, \@right);
}

sub sort {
    my ($self) = @_;

    my @result = &_msort(@{ $self->{values} });
    $self->{values} = \@result;
}

1;
