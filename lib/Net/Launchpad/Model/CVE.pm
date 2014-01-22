package Net::Launchpad::Model::CVE;
# ABSTRACT: CVE Model
$Net::Launchpad::Model::CVE::VERSION = '1.00';

use Mojo::Base 'Net::Launchpad::Client';

has 'cve' => '';

sub by_sequence {
    my ($self, $sequence) = @_;
    $self->cve($self->get(sprintf("%s/bugs/cve/%s", $self->api_url, $sequence)));
}

sub bugs {
    my $self = shift;
    my $bugs = $self->get($self->cve->{bugs_collection_link});
    return $bugs->{entries};
}

sub display_name {
    my $self  = shift;
    return $self->cve->{display_name};
}

sub description {
    my $self = shift;
    return $self->cve->{description};
}

sub title {
    my $self = shift;
    return $self->cve->{title};
}

sub web_link {
    my $self = shift;
    return $self->cve->{web_link};
}

sub date_created {
    my $self = shift;
    return $self->cve->{date_created};
}

sub date_modified {
    my $self = shift;
    return $self->cve->{date_modified};
}

sub status {
    my $self = shift;
    return $self->cve->{status};
}

sub url {
    my $self = shift;
    return $self->cve->{url};
}

sub sequence {
    my $self = shift;
    return $self->cve->{sequence};
}


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Model::CVE - CVE Model

=head1 VERSION

version 1.00

=head1 SYNOPSIS

    use Net::Launchpad::Client;
    my $c = Net::Launchpad::Client->new(
        consumer_key        => 'key',
        access_token        => '3243232',
        access_token_secret => '432432432'
    );
    $c->staging(1);

    my $cve = $c->model('CVE')->by_sequence('XXXX-XXXX');

    print "Title: ". $cve->title;
    print "Desc:  ". $cve->description;

=head1 ATTRIBUTES

=head2 cve

CVE object.

=head1 METHODS

=head2 by_sequence

This needs to be called before any of the below methods. Takes a CVE sequence number, e.g. 2011-3188.

=head2 sequence

Returns cve number.

=head2 title

Returns title of cve.

=head2 bugs

Returns a list of entries associated with cve

=head2 web_link

Returns browseable URL link to resource.

=head2 description

Returns cve description

=head2 status

Returns whether the cve is of candidate, entry, deprecated

=head2 date_created

Returns date cve was created

=head2 date_modified

Return date of last modification

=head2 display_name

Returns brief description of the ref and state

=head2 url

Returns URL to site that contains CVE data for this CVE reference.

=head1 AUTHOR

Adam Stokes <adamjs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Adam Stokes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

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
