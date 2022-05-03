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
export PS1="\h \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH=/opt/homebrew/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# git add, commit and push commands in one line :)
function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}
function p() {
  cd ..
}
