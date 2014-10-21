
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.09

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Net/Launchpad/Client.pm',
    'lib/Net/Launchpad/Model.pm',
    'lib/Net/Launchpad/Model/Archive.pm',
    'lib/Net/Launchpad/Model/Base.pm',
    'lib/Net/Launchpad/Model/Branch.pm',
    'lib/Net/Launchpad/Model/Bug.pm',
    'lib/Net/Launchpad/Model/BugTracker.pm',
    'lib/Net/Launchpad/Model/Builder.pm',
    'lib/Net/Launchpad/Model/CVE.pm',
    'lib/Net/Launchpad/Model/Country.pm',
    'lib/Net/Launchpad/Model/Distribution.pm',
    'lib/Net/Launchpad/Model/Language.pm',
    'lib/Net/Launchpad/Model/Person.pm',
    'lib/Net/Launchpad/Model/Project.pm',
    'lib/Net/Launchpad/Model/Query/Branch.pm',
    'lib/Net/Launchpad/Query.pm',
    'lib/Net/Launchpad/Role/Archive.pm',
    'lib/Net/Launchpad/Role/Branch.pm',
    'lib/Net/Launchpad/Role/Branch/Query.pm',
    'lib/Net/Launchpad/Role/Bug.pm',
    'lib/Net/Launchpad/Role/BugTracker.pm',
    'lib/Net/Launchpad/Role/Builder.pm',
    'lib/Net/Launchpad/Role/CVE.pm',
    'lib/Net/Launchpad/Role/Common.pm',
    'lib/Net/Launchpad/Role/Country.pm',
    'lib/Net/Launchpad/Role/Distribution.pm',
    'lib/Net/Launchpad/Role/Language.pm',
    'lib/Net/Launchpad/Role/Person.pm',
    'lib/Net/Launchpad/Role/Project.pm',
    'lib/Net/Launchpad/Role/Query.pm',
    't/00-compile.t',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/01-distributions.t',
    't/02-bugs.t',
    't/03-people.t',
    't/04-projects.t',
    't/05-branches.t',
    't/author-no-tabs.t',
    't/release-kwalitee.t',
    't/release-minimum-version.t'
);

notabs_ok($_) foreach @files;
done_testing;
