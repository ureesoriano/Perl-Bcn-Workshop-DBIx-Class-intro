#!/usr/bin/env perl
use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/lib";
use MyMusic::Schema;

my $schema  = MyMusic::Schema->connect_from_config();
my $album_cnt = $schema->resultset('Album')->search({},{
    group_by => ['artist'],
    '+select' => [{ count => 'id', -as => 'amount_of_albums'}],
    '+as' => ['num_albums'],
    order_by => {-asc => 'amount_of_albums'},
});
while (my $a = $album_cnt->next) {
    print $a->artist->name . " - " . $a->get_column('num_albums')."\n";
}

my $albums = $schema->resultset('Album')->search({},{
    prefetch => 'artist',
});
while (my $a = $albums->next) {
    say $a->artist->name."\n";
}

sub function_name {
	# body
}
