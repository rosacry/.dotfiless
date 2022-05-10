# My minimal dotfiles
![screenshot](wallpaper/mr_robot_5k.jpeg)

Links to my environment and what I use:
* [kitty](https://github.com/kovidgoyal/kitty/) - Terminal Emulator
* [simple-bar](https://simple-bar.com/en/) - Status Bar
* [spacebar](https://github.com/cmacrae/spacebar/) - Another Status Bar
* [skhd](https://github.com/koekeishiya/skhd/) - Simple Hotkey Daemon
* [yabai](https://github.com/xorpse/yabai/) - Window Manager
* [starship](https://starship.rs/) - Shell Prompt
* [fish](https://fishshell.com/) - Shell
* [neovim](https://neovim.io/) - Text Editor
* [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) - Font
* [Wallpaper](wallpaper/mr_robot_5k.jpeg)
* [Karabiner](https://karabiner-elements.pqrs.org/) - Keyboard Binder

Quick Notes:
*  For M1 Macbooks running Catalina and Monterey, you must go through this form -> https://github.com/koekeishiya/yabai/issues/1054
 in order to get the full use case of yabai, the Window Manager I use.

Installation:
*  Restore homebrew packages by running:
```
brew bundle --file=~/Brewfile(-(snapshot))
```
*  Add fish to shells list: /etc/shells, use `which fish` to find the path of fish
*  Update Default shell to fish:
```
chsh -s /opt/homebrew/bin/fish
```
