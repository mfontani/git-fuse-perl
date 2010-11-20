#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

my $out = qx{/usr/bin/env perl -wc git-fuse 2>&1};
chomp($out);

is($out, 'git-fuse syntax OK', 'Syntax OK for git-fuse');

done_testing();
