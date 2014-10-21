package Net::Launchpad::Role::Branch;
BEGIN {
  $Net::Launchpad::Role::Branch::AUTHORITY = 'cpan:ADAMJS';
}
$Net::Launchpad::Role::Branch::VERSION = '1.2.0';
# ABSTRACT: Branch Roles

use Moose::Role;
use Function::Parameters;

with 'Net::Launchpad::Role::Common';


method dependent_branches {
    return $self->collection('dependent_branches');
}


method landing_candidates {
    return $self->collection('landing_candidates');
}


method landing_target {
    return $self->collection('landing_targets');
}

method reviewer {
    return $self->resource('reviewer');
}


method sourcepackage {
  return $self->resource('sourcepackage');
}

method subscribers {
  return $self->collection('subscribers');
}

method subscriptions {
  return $self->collection('subscriptions');
}

method spec {
  return $self->collection('spec');
}
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Role::Branch - Branch Roles

=head1 VERSION

version 1.2.0

=head1 METHODS

=head2 dependent_branches

Collection of merge proposals that are dependent on this branch

=head2 landing_candidates

Collection of merge proposals where this branch is target branch

=head2 landing_targets

Collection of merge proposals where this branch is source branch

=head2 reviewer

Reviewer team associated with this branch

=head2 sourcepackage

Source package that this branch belongs too

=head2 subscribers

Persons subscribed to this branch

=head2 subscriptions

Branch subscriptions related to this branch

=head2 spec

Specification linked to this branch

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
