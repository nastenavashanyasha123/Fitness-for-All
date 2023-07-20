#!/usr/bin/perl
use strict;
use warnings;

# Declare global constants for fitness program
use constant LOW_INTENSITY => "Low-intensity";
use constant MODERATE_INTENSITY => "Moderate-intensity";
use constant HIGH_INTENSITY => "High-intensity";

# Declare variables for tracking fitness program
my ($lowIntensity, $moderateIntensity, $highIntensity);

# Declare hashes for associating exercise types with fitness program
my %lowIntensityExercises = (
	"running" => "Run for 30 minutes",
	"biking" => "Bike for 45 minutes",
	"swimming" => "Swim for 30 minutes"
);
my %moderateIntensityExercises = (
	"treadmill" => "Run on treadmill for 30 minutes",
	"elliptical" => "Use elliptical for 45 minutes",
	"aerobics" => "Do aerobics for 30 minutes"
);
my %highIntensityExercises = (
	"sprints" => "Run sprints for 30 minutes",
	"weightlifting" => "Do weightlifting for 45 minutes",
	"intervaltraining" => "Do interval training for 30 minutes"
);

# Create fitness program
sub createProgram {
	# Determine intensity level
	print "Select intensity level: (low, moderate, high)\n";
	my $intensity = <STDIN>;
	chomp $intensity;

	# Set counters for tracking program level
	my $counter = 0;

	# For each intensity level, call corresponding exercise subroutine
	if ($intensity eq LOW_INTENSITY) {
		$lowIntensity = 1;
		$counter += 1;
		&lowIntensityExercises;
	} elsif ($intensity eq MODERATE_INTENSITY) {
		$moderateIntensity = 1;
		$counter += 1;
		&moderateIntensityExercises;
	} elsif ($intensity eq HIGH_INTENSITY) {
		$highIntensity = 1;
		$counter += 1;
		&highIntensityExercises;
	} else {
		print "Invalid intensity level. Please select low, moderate or high.\n";
	}

	# If program is set, print out program
	if ($counter == 1) {
		print "Fitness Program:\n";
		if ($lowIntensity == 1) {
			foreach my $exercise (keys %lowIntensityExercises) {
				print "$exercise: $lowIntensityExercises{$exercise}\n";
			}
		} elsif ($moderateIntensity == 1) {
			foreach my $exercise (keys %moderateIntensityExercises) {
				print "$exercise: $moderateIntensityExercises{$exercise}\n";
			}
		} elsif ($highIntensity == 1) {
			foreach my $exercise (keys %highIntensityExercises) {
				print "$exercise: $highIntensityExercises{$exercise}\n";
			}
		}
	} 
}

# Subroutines for each intensity level
sub lowIntensityExercises {
	print "Choose one exercise from the following:\n";
	print "\tRunning\n\tBiking\n\tSwimming\n";
	my $exercise = <STDIN>;
	chomp $exercise;
	if (exists $lowIntensityExercises{$exercise}) {
		print "You selected: $lowIntensityExercises{$exercise}\n";
	} else {
		print "Invalid exercise. Please choose one from the list.\n";
		&lowIntensityExercises;
	}
}

sub moderateIntensityExercises {
	print "Choose one exercise from the following:\n";
	print "\tTreadmill\n\tElliptical\n\tAerobics\n";
	my $exercise = <STDIN>;
	chomp $exercise;
	if (exists $moderateIntensityExercises{$exercise}) {
		print "You selected: $moderateIntensityExercises{$exercise}\n";
	} else {
		print "Invalid exercise. Please choose one from the list.\n";
		&moderateIntensityExercises;
	}
}

sub highIntensityExercises {
	print "Choose one exercise from the following:\n";
	print "\tSprints\n\tWeightlifting\n\tInterval Training\n";
	my $exercise = <STDIN>;
	chomp $exercise;
	if (exists $highIntensityExercises{$exercise}) {
		print "You selected: $highIntensityExercises{$exercise}\n";
	} else {
		print "Invalid exercise. Please choose one from the list.\n";
		&highIntensityExercises;
	}
}

# Call createProgram subroutine
&createProgram;