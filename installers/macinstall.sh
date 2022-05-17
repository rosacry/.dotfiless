#!/bin/sh
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew install git && brew install stow
git clone https://github.com/rosacry/.dotfiles.git
cd .dotfiles
stow --adopt -t ~/ .
brew tap Homebrew/bundle
brew bundle dump --file=BackupBrewfile
while read p; do
  grep -xF "$p" Brewfile || echo "$p" >> Brewfile
done <BackupBrewfile
brew bundle --file=Brewfile
which fish >> /etc/shells && chsh -s /opt/homebrew/bin/fish
brew update && brew upgrade
mkdir ~/.config/nvim/plugged && nvim +PlugInstall +CocInstall +PlugUpgrade +PlugUpdate +CocUpdate +CocRebuild +qa!
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
