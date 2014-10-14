package Net::Launchpad::Model::Person;
# ABSTRACT: Person model
$Net::Launchpad::Model::Person::VERSION = '1.03';

use Mojo::Base 'Net::Launchpad::Client';

has 'person' => '';

sub by_name {
    my ($self, $name) = @_;
    $self->person($self->get(sprintf("%s/%s", $self->api_url, $name)));
}

sub name {
    my $self = shift;
    return $self->person->{name};
}

sub karma {
    my $self = shift;
    return $self->person->{karma};
}

sub display_name {
    my $self = shift;
    return $self->person->{display_name};
}

sub date_created {
    my $self = shift;
    return $self->person->{date_created};
}

sub description {
    my $self = shift;
    return $self->person->{description};
}

sub gpg_keys {
    my $self = shift;
    my $gpg_keys = $self->get($self->person->{gpg_keys_collection_link});
    return $gpg_keys->{entries};
}

sub irc_nicks {
    my $self = shift;
    my $irc_nicks = $self->get($self->person->{irc_nicknames_collection_link});
    return $irc_nicks->{entries};
}

sub is_team {
    my $self = shift;
    return $self->person->{is_team};
}

sub is_ubuntu_coc_signer {
    my $self = shift;
    return $self->person->{is_ubuntu_coc_signer};
}

sub is_valid {
    my $self = shift;
    return $self->person->{is_valid};
}

sub ppas {
    my $self = shift;
    my $ppas = $self->get($self->person->{ppas_collection_link});
    return $ppas->{entries};
}

sub private {
    my $self = shift;
    return $self->person->{private};
}

sub source_recipes {
    my $self = shift;
    my $s_recipes = $self->get($self->person->{recipes_collection_link});
    return $s_recipes->{entries};
}

sub ssh_keys {
    my $self = shift;
    my $ssh_keys = $self->get($self->person->{sshkeys_collection_link});
    return $ssh_keys->{entries};

}

sub time_zone {
    my $self = shift;
    return $self->person->{time_zone};
}

sub web_link {
    my $self = shift;
    return $self->person->{web_link};
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Model::Person - Person model

=head1 VERSION

version 1.03

=head1 SYNOPSIS

    use Net::Launchpad::Client;
    my $c = Net::Launchpad::Client->new(
        consumer_key        => 'key',
        access_token        => '3243232',
        access_token_secret => '432432432'
    );
    $c->staging(1);

    my $person = $c->model('Person')->by_name('~adam-stokes');

    print "Name: ". $person->name;

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 person

Holds person object.

=head1 METHODS

=head2 by_name

This needs to be called before any of the below methods. Takes a login
id, e.g. ~adam-stokes

=head2 name

Returns person name.

=head2 karma

Returns person karma.

=head2 display_name

Returns friendly display name

=head2 date_created

Returns date person registered

=head2 description

Returns description blob

=head2 gpg_keys

Returns list a gpg keys registered

=head2 irc_nicks

Returns list of irc nicks

=head2 is_team

Returns whether collection is a person or team

=head2 is_ubuntu_coc_signer

Returns if person signed Ubuntu COC

=head2 is_valid

Returns if person is valid and not a deactivated account

=head2 ppas

Returns list of ppas associated

=head2 private

Returns if person or team is registered as private

=head2 source_recipes

Returns recipe collection of package builds

=head2 ssh_keys

Returns list of public ssh keys

=head2 time_zone

Returns persons time zone

=head2 web_link

Returns friendly display name, usually first and last name.

=head1 AUTHOR

Adam Stokes <adamjs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Adam Stokes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Net::Launchpad::Client|Net::Launchpad::Client>

=back

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT
WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER
PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME
THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE LIABLE
TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.

=cut
