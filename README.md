# My dotfiles
![screenshot](wallpaper/adrenaline.png)

# Contents
- [Links to my environment and what I use](#links-to-my-environment-and-what-I-use)
  - [OSX Specific](#osx-specific)
  - [Linux Specific](#linux-specific)
- [References to my dotfiles](#references-to-my-dotfiles)
  - [OSX Specific](#osx-specific)
  - [Linux Specific](#linux-specific)
- [Quick Notes](#quick-notes)
- [Installation](#installation)
  - [Manual Installation](#manual-installation)
  - [OSX](#osx)
  - [Linux](#linux)
  - [Windows](#windows)
- [Debugging](#debugging)

## Links to my environment and what I use
* [kitty](https://github.com/kovidgoyal/kitty/) - Terminal Emulator
* [tmux](https://github.com/tmux/tmux/wiki) - Second Terminal Emulator
* [nord](https://www.nordtheme.com/) - Colorscheme
* [starship](https://starship.rs/) - Shell Prompt
* [fish](https://fishshell.com/) - Shell
* [neovim](https://neovim.io/) - Text Editor
* [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) - Font
* [Wallpaper](wallpaper/adrenaline.png)

### OSX Specific
* [simple-bar](https://simple-bar.com/en/) - Status Bar
* [spacebar](https://github.com/cmacrae/spacebar/) - Another Status Bar
* [skhd](https://github.com/koekeishiya/skhd/) - Simple Hotkey Daemon
* [yabai](https://github.com/xorpse/yabai/) - Window Manager
* [Karabiner](https://karabiner-elements.pqrs.org/) - Keyboard Binder

### Linux Specific
* [i3wm](https://i3wm.org/) - Window Manager
* [polybar](https://github.com/polybar/polybar) - Status Bar

## References to my dotfiles
* [kitty](https://github.com/rosacry/.dotfiles/blob/master/.config/kitty/kitty.conf)
* [tmux](https://github.com/rosacry/.dotfiles/blob/master/.tmux.conf)
* [starship](https://github.com/rosacry/.dotfiles/blob/master/.config/starship.toml)
* [fish](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/config.fish)
  * [fish variables](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/fish_variables)
  * [fish aliases](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/alias.fish)
  * [fish variables](https://github.com/rosacry/.dotfiles/blob/master/.config/fish/fish_variables)
* [neovim](https://github.com/rosacry/.dotfiles/blob/master/.config/nvim/init.vim)
  * [with comments](https://github.com/rosacry/.dotfiles/blob/master/.config/nvim/initWithComments.vim)
  * [coc-settings](https://github.com/rosacry/.dotfiles/blob/master/.config/nvim/coc-settings.json)
* [stow](https://github.com/rosacry/.dotfiles/blob/master/.stowrc)

### OSX Specific
* [spacebar](https://github.com/rosacry/.dotfiles/blob/master/.config/spacebar/spacebarrc)
* [skhd](https://github.com/rosacry/.dotfiles/blob/master/.skhdrc)
* [yabai](https://github.com/rosacry/.dotfiles/blob/master/.yabairc)
* [karabiner](https://github.com/rosacry/.dotfiles/blob/master/karabiner.json)
* [via (DZ60) layout](https://github.com/rosacry/.dotfiles/blob/master/dz60rgb_v2.json)

### Linux Specific
* [i3wm]()
* [polybar]()

## Quick Notes
*  For M1 Macbooks running Catalina and Monterey, you must go through [this](https://github.com/koekeishiya/yabai/issues/1054) forum
 in order to get the full use case of [yabai](https://github.com/xorpse/yabai/)
* Don't forget to authenticate to [Github CLI](https://cli.github.com/) using `gh auth login` and [Github Copilot](https://copilot.github.com/) using `:Copilot setup` if you're using either one


## Installation

### Manual Installation
#### OSX
Install [Homebrew](https://brew.sh/)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Install [Git](https://git-scm.com/) and [Stow](https://www.gnu.org/software/stow/manual/stow.html), if you want to use [Github CLI](https://cli.github.com/), simply change `git` in `brew install git` to `gh`, then authenticate using `gh auth login` after installing
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
`[-(snapshot_id)]` is if you have your own Brewfile with a specific snapshot ID

Add [fish](https://fishshell.com/) to shells list `/etc/shells` and update default shell to fish
```
which fish >> /etc/shells && chsh -s /opt/homebrew/bin/fish
```
Update brew
```
brew update && brew upgrade
```
Install and Update [neovim](https://neovim.io/) plugins, in `nvim` type
```
mkdir ~/.config/nvim/plugged && nvim +PlugInstall +CocInstall +qa!
```
In nvim, I mapped this to `Ctrl-]`/`C-]`
#### Optional
##### Disable animations when opening and closing windows.
```
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
```

##### Accelerated playback when adjusting the window size.
```
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
```

#### Linux
wip

#### Windows
yea u thought lol
### Debugging
* try rebooting
