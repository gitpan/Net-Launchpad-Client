package Net::Launchpad::Client;
# ABSTRACT: Launchpad.net Client
$Net::Launchpad::Client::VERSION = '0.99';

use Mojo::Base -base;
use Mojo::JSON;
use Mojo::UserAgent;
use Mojo::Parameters;
use Class::Load ':all';

has 'consumer_key' => '';
has 'access_token' => '';
has 'access_token_secret' => '';
has 'staging' => 0;

has 'json' => sub {
    my $self = shift;
    return Mojo::JSON->new;
};

has 'ua' => sub {
    my $self = shift;
    my $ua   = Mojo::UserAgent->new;
    $ua->transactor->name("Net::Launchpad/0.99");
    return $ua;
};

has 'nonce' => sub {
    my $self  = shift;
    my @a     = ('A' .. 'Z', 'a' .. 'z', 0 .. 9);
    my $nonce = '';
    for (0 .. 31) {
        $nonce .= $a[rand(scalar(@a))];
    }
    return $nonce;
};

has 'authorization_header' => sub {
    my $self = shift;
    return join(",",
        'OAuth realm="https://api.launchpad.net"',
        'oauth_consumer_key=' . $self->consumer_key,
        'oauth_version=1.0',
        'oauth_signature_method=PLAINTEXT',
        'oauth_signature=' . '&' . $self->access_token_secret,
        'oauth_token=' . $self->access_token,
        'oauth_token_secret=' . $self->access_token_secret,
        'oauth_timestamp=' . time,
        'oauth_nonce=' . $self->nonce);
};

sub api_url {
    my $self = shift;
    if ($self->staging) {
      return Mojo::URL->new('https://api.staging.launchpad.net/1.0/');
    }
    else {
      return Mojo::URL->new('https://api.launchpad.net/1.0/');
    }
}

sub model {
    my ($self, $class) = @_;
    my $model = "Net::Launchpad::Model::$class";
    return load_class($model)->new($self);
}

sub __path_cons {
    my ($self, $path) = @_;
    if ($path =~ /^http.*api/) {
        return Mojo::URL->new($path);
    }
    return $self->api_url->path($path);
}

sub get {
    my ($self, $resource) = @_;
    my $uri = $self->__path_cons($resource);
    my $tx =
      $self->ua->get(
        $uri->to_string => {'Authorization' => $self->authorization_header});
    die $tx->res->body unless $tx->success;
    return $self->json->decode($tx->res->body);
}

sub post {
    my ($self, $resource, $params) = @_;
    my $params_hash = Mojo::Parameters->new($params);
    my $uri         = $self->__path_cons($resource);
    my $tx =
      $self->ua->post($uri->to_string =>
          {'Authorization' => $self->authorization_header} => form =>
          $params_hash->to_string);
    die $tx->res->message unless $tx->success;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Client - Launchpad.net Client

=head1 VERSION

version 0.99

=head1 SYNOPSIS

    use Net::Launchpad::Client;
    my $lp = Net::Launchpad::Client->new(
        access_token        => '32432432432',
        access_token_secret => '32432432423432423432423232',
        consumer_key        => 'a-named-key'
    );

=head1 ATTRIBUTES

=head2 json

json object

=head2 consumer_key

OAuth Consumer key

=head2 access_token

OAuth access token

=head2 access_token_secret

OAuth access_token_secret

=head2 ua

useragent

=head2 staging

Staging or Production boolean

=head2 nonce

Nonce

=head2 authorization_header

Authorization string as described at L<https://help.launchpad.net/API/SigningRequests> B<Using the credentials>

=head1 METHODS

=head2 __path_cons

(Private) Returns either full resource link or combined path depending on the query.

=head2 api_url

Launchpad API host

=head2 get

Performs a HTTP GET request for a particular resource.

=head2 post

Performs a HTTP POST request for a resource.

=head1 AUTHOR

Adam Stokes <adamjs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Adam Stokes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

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
