use utf8;
package MyMusic::Schema::Result::Artist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyMusic::Schema::Result::Artist

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<artists>

=cut

__PACKAGE__->table("artists");

=head1 ACCESSORS

=head2 id

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name", ["name"]);

=head1 RELATIONS

=head2 albums

Type: has_many

Related object: L<MyMusic::Schema::Result::Album>

=cut

__PACKAGE__->has_many(
  "albums",
  "MyMusic::Schema::Result::Album",
  { "foreign.artist" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 festivals_artists

Type: has_many

Related object: L<MyMusic::Schema::Result::FestivalsArtist>

=cut

__PACKAGE__->has_many(
  "festivals_artists",
  "MyMusic::Schema::Result::FestivalsArtist",
  { "foreign.artist" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 festivals

Type: many_to_many

Composing rels: L</festivals_artists> -> festival

=cut

__PACKAGE__->many_to_many("festivals", "festivals_artists", "festival");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-08 00:13:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eCNDjZEEEIlDY/2nXE2qQw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
