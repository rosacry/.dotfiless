#source /.bash_profile to execute
alias python3=python3
alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop"
#alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias ls='ls --color'
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=cxgxfxexbxegedabagacad
export EDITOR='nvim'
export BASH_SILENCE_DEPRECATION_WARNING=1

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w \[$(tput sgr0)\]\[\033[38;5;10m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH=/opt/homebrew/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)

# git add, commit and push commands in one line :)
function gitt() {
    git add .
    git commit -a -m "$1"
    git push
}
function p() {
  cd ..
}
function configs() {
  cd ~/prog/git/.dotfiles/
}
function u() {
  brew update && brew upgrade
}
function c() {
  clear
}
function stoww() {
  stow --adopt -t ~/ .
}
source <(kitty + complete setup bash)
eval "$(starship init bash)"
