
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "file locker with an automatic out-of-scope unlocking mechanism",
  "AUTHOR" => "Vyacheslav Matyukhin <mmcleric\@yandex-team.ru>",
  "BUILD_REQUIRES" => {
    "File::Path" => 0,
    "IPC::System::Simple" => 0,
    "Test::Class" => 0,
    "Test::Fatal" => 0,
    "Test::More" => 0,
    "Test::Warn" => 0,
    "Time::HiRes" => 0,
    "autodie" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Lock-File",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Lock::File",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "Fcntl" => 0,
    "Log::Any" => 0,
    "POSIX" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



