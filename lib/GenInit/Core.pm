package GenInit::Core;

use strict;
use warnings;
use Error qw(:try);
use Sys::Syslog;
use File::Copy;

our $VERSION = "1.0.0";

=head1 NAME

GenInit - Generates the init script. 

=head1 SYNOPSIS

	use GenInit::Core;
	new(prog => $prog, path_to_prog => $path_to_prog, start_opts = $start_opts);
	generate_init();

=head1 DESCRIPTION

This is an object that has the methods to generate an init script based on a sample config.

=head2 Functions

The following functions are exported by default

=cut

=head3 new

	new(prog => $prog, path_to_prog => $path_to_prog, start_opts = $start_opts);

Instantiate a GenInit object with information regarding the path of the daemon and the start options.

=cut

sub new {
	
	my($class, %args) = @_;
	my $self = bless({}, $class);
	
	my $prog = $args{prog}; if(!$prog){die "You must provide a \$prog argument on $class!\n";}
	$self->{prog} = $prog;
	my $path_to_prog = $args{path_to_prog}; if(!$path_to_prog){die "You must provide a \$path_to_prog argument on $class!\n";}
	unless( -e $path_to_prog){die "File not found: $path_to_prog on $class!\n";}
	$self->{path_to_prog} = $path_to_prog;
	my $start_opts = exists $args{start_opts} ? $args{start_opts} : ""; if(!$start_opts){die "You must provide a \$start_opts argument on $class!\n";}
	$self->{start_opts} = $start_opts;
	
	return $self;
}

=head3 generate_init

	generate_init();

Process the information and generate the init script based on the sample config.

=cut

sub generate_init {
	
	my $self = shift;
	my $class = ref $self;
	my $sample_file = "./conf/geninit.sample";	
	my $init_file = $self->{prog};

	try {
		copy($sample_file, $init_file) or die "Copy file failed: $! on $class!\n";

		open (FILE, "+<$init_file") or die "Can't open file: $init_file on $class!\n";
		my @file = <FILE>;
		seek FILE,0,0;
		foreach my $file (@file){
			$file =~ s/\%\%NAME\%\%/$self->{prog}/g;
			$file =~ s/\%\%PATH\%\%/$self->{path_to_prog}/g;
			$file =~ s/\%\%START\%\%/$self->{start_opts}/g;
			print FILE $file;
		}
		close FILE;
	}
	
	catch Error with {
		my $ex = shift;
		print "Error catched: $ex->{-text}\n";
		syslog("info", $ex->{-text});
	}
}

1;
