package Net::Launchpad::Role::Distribution;
BEGIN {
  $Net::Launchpad::Role::Distribution::AUTHORITY = 'cpan:ADAMJS';
}
$Net::Launchpad::Role::Distribution::VERSION = '1.1.01';
# ABSTRACT: Distribution roles

use Moose::Role;
use Function::Parameters;

with 'Net::Launchpad::Role::Common';


method active_milestones {
  return $self->collection('active_milestones');
}



method all_milestones {
    return $self->collection('all_milestones');
}

method archive_mirrors {
  return $self->collection('archive_mirrors');
}

method archive {
  return $self->collection('archives');
}

method bug_supervisor {
  return $self->resource('bug_supervisor');
}

method cdimage_mirrors {
  return $self->collection('cdimage_mirrors');
}

method current_series {
  return $self->collection('current_series');
}

method derivatives {
  return $self->collection('derivatives');
}

method driver {
  return $self->resource('driver');
}

method main_archive {
  return $self->resource('main_archive');
}

method members {
  return $self->resource('members');
}

method mirror_admin {
  return $self->resource('mirror_admin');
}

method series {
  return $self->collection('series');
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Role::Distribution - Distribution roles

=head1 VERSION

version 1.1.01

=head1 METHODS

=head2 active_milestones

Active milestones associated with object

=head2 all_milestones

All milestones associated with object

=head2 archive_mirrors

All enabled archive mirrors for distribution

=head2 archives

primary, partner, debug archives

=head2 bug_supervisor

bug manager for distribution

=head2 cdimage_mirrors

mirrors for this distribution

=head2 current_series

current development series of distribution

=head2 derivatives

distribution derivatives

=head2 driver

person/team responsible for distribution

=head2 main_archive

distribution main archive

=head2 members

distro members

=head2 mirror_admin

person/team that has rights to mark this distro official

=head2 series

distroseries inside distribution

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
