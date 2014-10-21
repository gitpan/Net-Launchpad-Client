package Net::Launchpad::Role::Common;
$Net::Launchpad::Role::Common::VERSION = '1.1.0_1';
# ABSTRACT: Common query roles usually associated with most API results

use Moose::Role;
use Function::Parameters;


method resource ($name) {
    my $link = $name . "_link";
    my $ret  = $self->lpc->get($self->result->{$link});
    return $ret;
}


method collection ($name) {
    my $link = $name . "_collection_link";
    my $ret  = $self->lpc->get($self->result->{$link});
    return $ret->{entries};
}


method owner {
    return $self->resource('owner');
}


method project {
    return $self->resource('project');
}



method recipes {
    return $self->collection('recipes');
}



method bugs {
    return $self->collection('bugs');
}



method registrant {
    return $self->resource('registrant');
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Role::Common - Common query roles usually associated with most API results

=head1 VERSION

version 1.1.0_1

=head1 METHODS

=head2 resource

Returns resource of C<name>

=head2 collection

Returns entires from collection C<name>

=head2 owner

Owner of collection

=head2 project

Project this collection belongs too

=head2 recipes

Recipes associated with collection

=head2 bugs

Bugs associated with object

=head2 registrant

User that registered this branch

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
