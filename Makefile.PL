use 5.008008;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
  NAME         => 'GenInit',
  VERSION_FROM => 'lib/GenInit.pm',
  PREREQ_PM    => {
    "Error"    => "0.17010",
  },
  PREREQ_FATAL => 1,
  (
    $] >= 5.005
    ?    ## Add these new keywords supported since 5.005
      (
      ABSTRACT_FROM => 'lib/GenInit.pm'
      )
    : ()
  ),
);
