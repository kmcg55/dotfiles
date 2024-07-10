### dotfiles
My personal configuration files for vim and zsh. A work in progress as I become comfortable with more shells, terminal emulators, and determine which plugins I actually "need." Maybe switching from iTerm2 to Kitty in the future. 

### Dependencies
Relies on [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) for zsh plugins and [Plug](https://github.com/junegunn/vim-plug) for vim plugins.<br /> Zsh theme is [powerline10k](https://github.com/romkatv/powerlevel10k), and vim theme is [256-noir](https://github.com/andreasvc/vim-256noir) with [airline](https://github.com/vim-airline/vim-airline). Patched powerline font or nerdfonts should be installed for all themes, fonts and icons to load correctly.
#### Plugins
Zsh plugins are set to update every 10 days, but can be updated manually with the command `:omz:update`
Run `:PlugInstall` and `PlugUpdate` to load and install vim plugins
### Usage
Clone repo, open bash and run `./setup.sh`

