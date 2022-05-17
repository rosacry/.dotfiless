brew tap Homebrew/bundle
brew bundle dump --file=BackupBrewfile
while read p; do
  grep -xF "$p" Brewfile || echo "$p" >> Brewfile
done <BackupBrewfile
brew bundle --file=Brewfile
