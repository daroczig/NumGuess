#!/usr/bin/perl -w

use POSIX;
use strict;
use warnings;

# a single game
sub play($$) {
    my($name, $limit) = @_;

    # generate the random number
    my $number = int(rand($limit)) + 1;

    # game header
	print("\nGuess my number between 1 and $limit!\n\n");

    # number of tries so far
    my $tries = 0;

    # main cycle (while the guess is wrong)
    my $guess;
    do {

    	# input guess
		print("Guess: ");
		$guess = <STDIN>;
		chomp($guess);

		# count guess
		$tries++;

		# appropriate answer
		if ($guess < $number) {
			print("Too low!\n");
		} elsif ($guess > $number) {
			print("Too high!\n");
		}

    } while ($guess != $number);

    # game summary
	print("\n");
	print("Well done $name, you guessed my number from $tries tries!\n");

	# maximum number of guesses
	my $maximum = floor(log($limit) / log(2)) + 1;

	# custom message
	if ($tries == 1) {
		print("You're one lucky bastard!\n");
	} elsif ($tries < $maximum) {
		print("You are the master of this game!\n");
	} elsif ($tries == $maximum) {
		print("You are a machine!\n");
	} elsif ($tries <= ($maximum * 1.1)) {
		print("Very good result!\n");
	} elsif ($tries < $limit) {
		print("Try harder, you can do better!\n");
	} else {
		print("I find your lack of skill disturbing!\n");
	}

}


# welcome message
print("Welcome to NumGuess Perl version!\n\n");

# input name
my $name;
print("Enter your name: ");
$name = <STDIN>;
chomp($name);

print("\n");

# use default player name if none given
if ($name eq "") {
	$name = "Player";
}
	

# input upper limit (until suitable)
my $limit = 0;
print("Welcome $name, enter upper limit: ");
$limit = <STDIN>;
chomp($limit);

# use default limit if input not suitable
if ($limit < 10) {
	$limit = 10;
}

# play a game (while other than N is given as answer)
my $play;
do {

	# play the game
	play($name, $limit);

	# ask whether to play again
	print("Play again [Y/n]? ");
	$play = <STDIN>;
	chomp($play);

} while ($play eq "" || lc(substr($play, 0, 1)) ne "n");


# say goodbye
print("\n");
print("Okay, bye.\n");
