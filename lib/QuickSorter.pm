package QuickSorter;
use strict;
use warnings;
use Sorter;
use base qw(Sorter);


sub new {
    my ($class) = @_;

    my $self = Sorter->new;
    return bless $self;
}

sub _quick_sort {
    my (@values) = @_;
	
    return @values  if (@values <= 1);

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
