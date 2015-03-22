use utf8;
package MyMusic::Schema::Result::Festival;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyMusic::Schema::Result::Festival

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<festivals>

=cut

__PACKAGE__->table("festivals");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 year

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 location

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "year",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "location",
  { data_type => "varchar", is_nullable => 0, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_year_location>

=over 4

=item * L</name>

=item * L</year>

=item * L</location>

=back

=cut

__PACKAGE__->add_unique_constraint("name_year_location", ["name", "year", "location"]);

=head1 RELATIONS

=head2 festivals_artists

Type: has_many

Related object: L<MyMusic::Schema::Result::FestivalsArtist>

=cut

__PACKAGE__->has_many(
  "festivals_artists",
  "MyMusic::Schema::Result::FestivalsArtist",
  { "foreign.festival" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 artists

Type: many_to_many

Composing rels: L</festivals_artists> -> artist

=cut

__PACKAGE__->many_to_many("artists", "festivals_artists", "artist");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-07 21:20:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qbhN30RtN04ncLdn88MwPQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
