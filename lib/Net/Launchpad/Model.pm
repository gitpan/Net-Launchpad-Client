package Net::Launchpad::Model;
$Net::Launchpad::Model::VERSION = '1.1.0_1';
# ABSTRACT: Model class

use Moose;
use Moose::Util qw(apply_all_roles is_role does_role search_class_by_role);
use Function::Parameters;
use Module::Runtime qw(is_module_name use_package_optimistically);
use Data::Dumper::Concise;
use namespace::autoclean;

has lpc => (is => 'ro', isa => 'Net::Launchpad::Client');

method _load_model (Str $name, HashRef $params) {
    my $model_class = "Net::Launchpad::Model::$name";
    my $model_role  = "Net::Launchpad::Role::$name";

    die "Invalid model requested." unless is_module_name($model_class);
    die "Unknown Role module" unless is_module_name($model_role);

    my $model =
      use_package_optimistically($model_class)->new(result => $params, lpc => $self->lpc);

    my $role =
      use_package_optimistically($model_role);

    die "$_ is not a role" unless is_role($role);
    $role->meta->apply($model);
}

method archive (Str $distro, Str $archive_name) {
    my $params = $self->lpc->get(
        sprintf(
            "%s/+archive/%s", $self->lpc->api_url, $distro, $archive_name
        )
    );
    return $self->_load_model('Archive', $params);
}

method bug (Int $id) {
    my $params =
      $self->lpc->get(sprintf("%s/bugs/%s", $self->lpc->api_url, $id));
    return $self->_load_model('Bug', $params);
}

method bugtracker (Str $name) {
    my $params = $self->lpc->get(
        sprintf("%s/bugs/bugtrackers/%s", $self->lpc->api_url, $name));
    return $self->_load_model('BugTracker', $params);
}

method builder (Str $name) {
    my $params =
      $self->lpc->get(sprintf("%s/builders/%s", $self->lpc->api_url, $name));
    return $self->_load_model('Builder', $params);
}

method country (Str $country_code) {
    my $params = $self->lpc->get(
        sprintf("%s/+countries/%s", $self->lpc->api_url, $country_code));
    return $self->_load_model('Country', $params);
}


method branch (Str $name, Str $project_name, Str $branch_name) {
    my $params = $self->lpc->get(
        sprintf("%s/%s/%s/%s",
            $self->lpc->api_url, $name, $project_name, $branch_name)
    );
    return $self->_load_model('Branch', $params);
}

method person (Str $name) {
    my $params =
      $self->lpc->get(sprintf("%s/%s", $self->lpc->api_url, $name));
    return $self->_load_model('Person', $params);
}

method distribution (Str $name) {
    my $params =
      $self->lpc->get(sprintf("%s/%s", $self->lpc->api_url, $name));
    return $self->_load_model('Distribution', $params);
}

method language ($isocode) {
    my $params = $self->lpc->get(
        sprintf("%s/+languages/%s", $self->lpc->api_url, $isocode));
    return $self->_load_model('Language', $params);
}

method cve (Str $cve) {
    my $params =
      $self->lpc->get(sprintf("%s/bugs/cve/%s", $self->lpc->api_url, $cve));
    return $self->_load_model('CVE', $params);
}

method project (Str $name) {
    my $params =
      $self->lpc->get(sprintf("%s/%s", $self->lpc->api_url, $name));
    return $self->_load_model('Project', $params);
}


__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Model - Model class

=head1 VERSION

version 1.1.0_1

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
