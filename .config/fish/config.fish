source ~/.config/fish/alias.fish

set PATH /opt/homebrew/bin:$PATH
set JAVA_HOME $(/usr/libexec/java_home)
set EDITOR 'nvim'

# Configure Jump
status --is-interactive; and source (jump shell fish | psub)


#fish vi mode
fish_vi_key_bindings
set -g fish_escape_delay_ms 10

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

# git add, commit and push commands in one line :)
function gitt
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git push # Push to remote
end

function gittU
  git push --set-upstream origin master
end

function stoww
  stow --adopt -t ~/ .
  echo "Stow Complete"
end

function brewBackup
  brew tap Homebrew/bundle
  brew bundle dump --force
  echo "Brew List Backed Up"
end

function brewRestore
  brew bundle --file=$argv
  echo "Brew List Restored"
end

function ignore
  if test -e $argv
    git reset $argv
    git rm --cached $argv
    if not test -e .gitignore
      touch .gitignore
    end
    echo "$argv" >> .gitignore
    echo "$argv ignored from git"
  else
    echo "$argv not found!"
  end
end

function unignore
  if test -e $argv; and grep -r $argv .gitignore
    sed -i .bak "/$argv/d" .gitignore
    echo "$argv removed from .gitignore"
  else
    echo "$argv is either not in either directory and/or in .gitignore!"
  end
end

if status is-interactive
and not set -q TMUX
    exec tmux
end

# Install Starship
starship init fish | source
