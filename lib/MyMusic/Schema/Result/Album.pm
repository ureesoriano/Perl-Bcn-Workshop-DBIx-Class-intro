use utf8;
package MyMusic::Schema::Result::Album;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyMusic::Schema::Result::Album

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<albums>

=cut

__PACKAGE__->table("albums");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 artist

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 year

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "artist",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "year",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 artist

Type: belongs_to

Related object: L<MyMusic::Schema::Result::Artist>

=cut

__PACKAGE__->belongs_to(
  "artist",
  "MyMusic::Schema::Result::Artist",
  { id => "artist" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-08 04:11:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7c+0vxCsC6BigZr2ws9igw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
