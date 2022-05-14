source ~/.config/fish/alias.fish

set -x PATH /opt/homebrew/bin:$PATH
set -x JAVA_HOME $(/usr/libexec/java_home)
set -x EDITOR 'nvim'

# Configure Jump
status --is-interactive; and source (jump shell fish | psub)

# Load all saved ssh keys
/usr/bin/ssh-add --apple-load-keychain ^/dev/null

#fish vi mode
fish_vi_key_bindings
set -g fish_escape_delay_ms 10

# Fish syntax highlighting
set -L
# Colorscheme: Nord
set -U fish_color_normal normal
set -U fish_color_command 81a1c1
set -U fish_color_quote a3be8c
set -U fish_color_redirection b48ead
set -U fish_color_end 88c0d0
set -U fish_color_error ebcb8b
set -U fish_color_param eceff4
set -U fish_color_comment 434c5e
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 4c566a
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel --reverse
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D
set -U fish_pager_color_selected_background --background=brblack

alias python='python3'
alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop"

function nvimc
  nvim ~/.config/nvim/init.vim
end

function nvimcc
  nvim ~/.config/nvim/initWithComments.vim
end

# git add, commit and push commands in one line :)
function gitt
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git push # Push to remote
end

function gittU
  git push --set-upstream origin master
end

function p
  cd ..
end

function configs
  cd ~/prog/git/.dotfiles/
end

function u
  brew update && brew upgrade
end

function c
  clear
end

function stoww
  stow --adopt -t ~/ .
  echo "Stow Complete"
end

function brewBackup
  rm ~/Brewfile
  brew tap Homebrew/bundle
  brew bundle dump
  echo "Brew List Backed Up"
end

function brewRestore
  brew bundle --file=$argv
  echo "Brew List Restored"
end

function tmuxDestroy
  tmux kill-server
end

function ignore
  git reset $argv
  git rm --cached $argv
  if not test -e .gitignore
    touch .gitignore
  end
  echo "$argv" >> .gitignore
end

if status is-interactive
and not set -q TMUX
    exec tmux
end

# Install Starship
starship init fish | source

set fish_greeting ""

ssh -T github


c
