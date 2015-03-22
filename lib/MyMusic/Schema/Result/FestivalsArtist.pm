use utf8;
package MyMusic::Schema::Result::FestivalsArtist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyMusic::Schema::Result::FestivalsArtist

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<festivals_artists>

=cut

__PACKAGE__->table("festivals_artists");

=head1 ACCESSORS

=head2 festival

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 artist

  data_type: 'mediumint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "festival",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "artist",
  {
    data_type => "mediumint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</festival>

=item * L</artist>

=back

=cut

__PACKAGE__->set_primary_key("festival", "artist");

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

=head2 festival

Type: belongs_to

Related object: L<MyMusic::Schema::Result::Festival>

=cut

__PACKAGE__->belongs_to(
  "festival",
  "MyMusic::Schema::Result::Festival",
  { id => "festival" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-11-07 21:20:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qIMiaxl24hgEJiKqvveqXQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
