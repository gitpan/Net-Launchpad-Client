package Net::Launchpad::Model::Project;
# ABSTRACT: Project Model interface
$Net::Launchpad::Model::Project::VERSION = '0.99';

use Mojo::Base 'Net::Launchpad::Client';

has 'project' => '';

sub by_name {
    my ($self, $name) = @_;
    $self->project($self->get(sprintf("%s/%s", $self->api_url, $name)));
}

sub bug_supervisor_link {
    my $self = shift;
    return $self->project->{bug_supervisor_link};
}

sub bug_reporting_guidelines {
    my $self = shift;
    return $self->project->{bug_reporting_guidelines};
}

sub bug_tracker_link {
    my $self = shift;
    return $self->project->{bug_tracker_link};
}

sub date_created {
    my $self = shift;
    return $self->project->{date_created};
}

sub description {
    my $self = shift;
    return $self->project->{description};
}

sub name {
    my $self = shift;
    return $self->project->{name};
}

sub official_bug_tags {
    my $self = shift;
    return $self->project->{official_bug_tags};
}

sub owner {
    my $self = shift;
    my $owner = $self->get($self->project->{owner_link});
    return $owner;
}

sub summary {
    my $self = shift;
    return $self->project->{summary};
}

sub title {
    my $self = shift;
    return $self->project->{title};
}

sub web_link {
    my $self = shift;
    return $self->project->{web_link};
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Model::Project - Project Model interface

=head1 VERSION

version 0.99

=head1 SYNOPSIS

    use Net::Launchpad::Client;
    my $c = Net::Launchpad::Client->new(
        consumer_key        => 'key',
        access_token        => '3243232',
        access_token_secret => '432432432'
    );
    $c->staging(1);

    my $project = $c->model('Project')->by_name('sosreport');

    print "Name: ". $project->name;

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 project

Holds project object.

=head1 METHODS

=head2 by_name

Query a project by name

=head2 bug_supervisor_link

Link to bug supervisor

=head1 SEE ALSO

=over 4

=item * L<https://launchpad.net/launchpadlib>, "Python implementation"

=back

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
