# My dotfiles
![screenshot](wallpaper/mr_robot_5k.jpeg)


## Contents
- [Links to my environment and what I use](#links-to-my-environment-and-what-I-use)
- [References to my dotfiles](#references-to-my-dotfiles)
- [Quick Notes](#quick-notes)
- [Installation](#installation)


## Links to my environment and what I use
* [kitty](https://github.com/kovidgoyal/kitty/) - Terminal Emulator
* [snazzy](https://github.com/connorholyday/kitty-snazzy) - Colorscheme
* [simple-bar](https://simple-bar.com/en/) - Status Bar
* [spacebar](https://github.com/cmacrae/spacebar/) - Another Status Bar
* [skhd](https://github.com/koekeishiya/skhd/) - Simple Hotkey Daemon
* [yabai](https://github.com/xorpse/yabai/) - Window Manager
* [starship](https://starship.rs/) - Shell Prompt
* [fish](https://fishshell.com/) - Shell
* [neovim](https://neovim.io/) - Text Editor
* [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) - Font
* [Karabiner](https://karabiner-elements.pqrs.org/) - Keyboard Binder
* [Wallpaper](wallpaper/mr_robot_5k.jpeg)

## References to my dotfiles
* [kitty](https://github.com/rosacry/.dotfiles/blob/master/.config/kitty/kitty.conf)
  * [snazzy colorscheme](https://github.com/rosacry/.dotfiles/blob/master/.config/kitty/snazzy.conf)
* [spacebar](https://github.com/rosacry/.dotfiles/blob/master/.config/spacebar/spacebarrc)
* [skhd](https://github.com/rosacry/.dotfiles/blob/master/.skhdrc)
* [yabai](https://github.com/rosacry/.dotfiles/blob/master/.yabairc)
* [starship](https://github.com/rosacry/.dotfiles/blob/master/.config/starship.toml)
* [fish](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/config.fish)
  * [fish variables](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/fish_variables)
  * [fish aliases](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/alias.fish)
* [neovim](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/alias.fish)
  * [with comments](https://github.com/rosacry/.dotfiles/blob/master/.config/nvim/initWithComments.vim)
* [karabiner](https://github.com/rosacry/.dotfiles/blob/master/karabiner.json)
* [stow](https://github.com/rosacry/.dotfiles/blob/master/.stowrc)
* [via (DZ60) layout](https://github.com/rosacry/.dotfiles/blob/master/dz60rgb_v2.json)


## Quick Notes
*  For M1 Macbooks running Catalina and Monterey, you must go through [this](https://github.com/koekeishiya/yabai/issues/1054) forum
 in order to get the full use case of [yabai](https://github.com/xorpse/yabai/)

## Installation

Install [Homebrew](https://brew.sh/)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install [Git](https://git-scm.com/) and [Stow](https://www.gnu.org/software/stow/manual/stow.html)
```
brew install git && brew install stow
```

Clone my repository
```
git clone https://github.com/rosacry/.dotfiles.git
```

Change Directory to the Directory the repository was cloned to
```
cd .dotfiles
```

Use [Stow](https://www.gnu.org/software/stow/manual/stow.html) to copy and link these files to the same one's in the repository
```
stow --adopt -t ~/ .
```
Now we can `git pull` in this local repository if there are ever changes/updates made to the online repository


Restore homebrew packages by running
```
brew bundle --file=~/Brewfile[-(snapshot_id)]
```
`[-(snapshot_id)]` is if you have your own Brewfile with a specific snapshot ID:

Add [fish](https://fishshell.com/) to shells list: `/etc/shells`, use `which fish` to find the path of fish

Update Default shell to fish:
```
chsh -s /opt/homebrew/bin/fish
```

Update brew
```
brew update && brew upgrade
```

Install [neovim](https://neovim.io/) plugins, in `nvim` type
```
:PlugInstall
```

Should be good to go :) happy coding
