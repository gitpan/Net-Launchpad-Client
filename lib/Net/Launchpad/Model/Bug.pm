package Net::Launchpad::Model::Bug;
# ABSTRACT: Bug Model
$Net::Launchpad::Model::Bug::VERSION = '1.03';

use Mojo::Base 'Net::Launchpad::Client';

has 'bug' => '';

sub by_id {
    my ($self, $id) = @_;
    $self->bug($self->get(sprintf("%s/bugs/%s", $self->api_url, $id)));
}

sub id {
    my $self = shift;
    return $self->bug->{id};
}

sub tasks {
    my $self  = shift;
    my $tasks = $self->get($self->bug->{bug_tasks_collection_link});
    return $tasks->{entries};
}

sub watches {
    my $self    = shift;
    my $watches = $self->get($self->bug->{bug_watches_collection_link});
    return $watches->{entries};
}

sub attachments {
    my $self        = shift;
    my $attachments = $self->get($self->bug->{attachments_collection_link});
    return $attachments->{entries};
}

sub activity {
    my $self     = shift;
    my $activity = $self->get($self->bug->{activity_collection_link});
    return $activity->{entries};
}

sub duplicate_of {
    my $self = shift;
    return $self->get($self->bug->{duplicate_of_link});
}

sub duplicate_count {
    my $self = shift;
    return $self->bug->{number_of_duplicates};
}

sub users_affected_count {
    my $self = shift;
    return $self->bug->{users_affected_count};
}

sub description {
    my $self = shift;
    return $self->bug->{description};
}

sub title {
    my $self = shift;
    return $self->bug->{title};
}

sub heat {
    my $self = shift;
    return $self->bug->{heat};
}

sub information_type {
    my $self = shift;
    return $self->bug->{information_type};
}

sub web_link {
    my $self = shift;
    return $self->bug->{web_link};
}

sub message_count {
    my $self = shift;
    return $self->bug->{message_count};
}

sub messages {
    my $self = shift;
    return $self->get($self->bug->{messages_collection_link});
}

sub tags {
    my $self = shift;
    return $self->bug->{tags};
}

sub owner {
    my $self = shift;
    return $self->get($self->bug->{owner_link});
}

sub date_created {
    my $self = shift;
    return $self->bug->{date_created};
}

sub date_last_message {
    my $self = shift;
    return $self->bug->{date_last_message};
}

sub date_last_updated {
    my $self = shift;
    return $self->bug->{date_last_updated};
}

sub can_expire {
    my $self = shift;
    return $self->bug->{can_expire};
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Net::Launchpad::Model::Bug - Bug Model

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

    my $bug = $c->model('Bug')->by_id(3);

    print "Title: ". $bug->title;
    print "Desc:  ". $bug->description;
    print "Heat:  ". $bug->heat;

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 bug

Bug object.

=head1 METHODS

=head2 by_id

This needs to be called before any of the below methods. Takes a Bug ID number.

=head2 id

Returns bug number.

=head2 title

Returns title of bug.

=head2 tasks

Returns a list of entries in the tasks object.

=head2 owner

Returns creator of bug

=head2 web_link

Returns browseable URL link to resource.

=head2 messages

Returns bug messages associated with Bug.

=head2 message_count

Returns message count

=head2 heat

Returns heat/importance of bug

=head2 description

Returns bug description

=head2 information_type

Returns whether this bug is a public/private issue.

=head2 tags

Returns a list of Tags associated with bug.

=head2 activity

Returns a bug activity collection

=head2 attachments

Returns list of bug attachments

=head2 can_expire

Returns whether the incomplete bug can be expired

=head2 date_created

Returns date bug was created

=head2 date_last_message

Return date of last posted bug message

=head2 date_last_updated

Returns date of last update, can be bug message or status changes.

=head2 duplicate_count

Returns number of bug duplicates

=head2 duplicate_of

Returns a bug resource that the specific bug is a duplicate of

=head2 users_affected_count

Returns count of users affected by bug

=head2 watches

Returns bug watch collection

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
