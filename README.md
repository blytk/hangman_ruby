# hangman_ruby
CLI hangman in Ruby

## Introduction
Simple Hangman game implemented in Ruby

## Installation
git clone https://github.com/blytk/hangman_ruby

## Usage
In game folder, execute the command "ruby lib/Game.rb"

Enter the first guess for your character, the secret word will start to be revealed. Each correct guess will reveal the guessed letters, each failed guess will deduct one remaining guess. If remaining guesses reach 0, the round is lost.

There is a save / load function, for practice purposes. A game can be saved typing save and loaded typing load, follwed by the name of the savegame (without the extension, which is .yaml). 
