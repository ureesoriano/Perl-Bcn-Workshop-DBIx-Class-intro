#!/usr/bin/env perl
use strict;
use warnings;

use DBIx::Class::Schema::Loader qw/make_schema_at/;



make_schema_at(
    'MyMusic::Schema',
    {
        debug => 1,
        dump_directory => './lib',
    },
    [
        'dbi:mysql:dbname=my_music;host=localhost','uree','1234',
    ],
);
