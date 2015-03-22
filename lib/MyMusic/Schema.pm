use utf8;
package MyMusic::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-07 21:20:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xO10nmqGca2Za2Lgug7ENA

sub connect_from_config{
    return __PACKAGE__->connect(
        #"dbi:mysql:database=my_music;host=localhost", "uree", "1234",
        "dbi:mysql:database=my_music;host=localhost;mysql_read_default_file=/home/uree/.my.cnf;mysql_read_default_group=application", 
        undef, 
        undef,
    );
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
