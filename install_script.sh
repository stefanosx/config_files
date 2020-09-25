#!/bin/bash
#
# Bootstrap script for setting up a new OSX machine
#
# This should be idempotent so it can be run multiple times.
#
echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo 'update brew'
brew update

# Install rbenv and ruby-build
echo 'install rbenv and ruby-build'
brew install rbenv ruby-build
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo 'install vim'
brew install vim --with-override-system-vi

echo 'install tree'
brew install tree

echo 'install tmux'
brew install tmux

echo 'install gitx'
brew cask install rowanj-gitx

echo 'install docker'
brew cask install docker

echo 'install slack'
brew cask install slack

echo 'install chrome'
brew cask install google-chrome

echo 'install shiftit'
brew cask install shiftit

echo 'install copyclip'
brew cask install copyclip

echo 'install 1password'
brew cask install 1password

echo 'install spotify'
brew cask install spotify

echo 'install toggl track'
brew cask install toggl-track

echo 'install pathogen and vim plugins'
git clone git@github.com:stefanosx/config_files.git ~/.vim &&
  cd ~/.vim &&
  git submodule update --init &&
  echo 'source ~/.vim/.vimrc' > ~/.vimrc

echo "Bootstrapping complete"


