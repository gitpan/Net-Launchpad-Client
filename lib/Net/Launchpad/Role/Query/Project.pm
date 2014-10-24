package Net::Launchpad::Role::Query::Project;
BEGIN {
  $Net::Launchpad::Role::Query::Project::AUTHORITY = 'cpan:ADAMJS';
}
$Net::Launchpad::Role::Query::Project::VERSION = '2.000';
# ABSTRACT: Project query role

use Moose::Role;
use Function::Parameters;
use Data::Dumper::Concise;

with 'Net::Launchpad::Role::Query';


method search (Str $text) {
    my $params = {
        'ws.op' => 'search',
        text    => $text
    };
    return $self->resource($params);
}


method latest {
    my $params = {
        'ws.op' => 'latest'
    };
    return $self->resource($params);
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Role::Query::Project - Project query role

=head1 VERSION

version 2.000

=head1 METHODS

=head2 search

Search through the Registry database for products that match the query
terms. text is a piece of text in the title / summary / description
fields of product.

B<Params>

=over 4

=item *

C<Str text>

=back

=head2 latest

Return latest registered projects

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
