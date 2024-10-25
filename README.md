### dotfiles
My personal configuration files for vim and zsh. A work in progress as I become comfortable with more shells, terminal emulators, and determine which plugins I actually "need." Maybe switching from iTerm2 to Kitty in the future. 

### Dependencies
Relies on [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) for zsh plugins and [Plug](https://github.com/junegunn/vim-plug) for vim plugins.<br /> Zsh theme is [powerline10k](https://github.com/romkatv/powerlevel10k), and vim theme is [onedark](https://github.com/joshdick/onedark.vim) with [airline](https://github.com/vim-airline/vim-airline). Patched powerline font or nerdfonts should be installed for all themes, fonts, and icons to load correctly.<br />
Relies on [starship](https://starship.rs/guide/) for bash prompt line with a [custom preset](https://starship.rs/presets/#tokyo-night). Nerdfonts are also required for starship, but should already be installed. To install starship (on macOS) run `brew install starship`<br />
There is also an alias that uses [lsd](https://github.com/lsd-rs/lsd) for enhanced `ls` outputs in bash.
#### Plugins
Zsh plugins are set to automatically update, but can be updated manually with the command `omz update` <br />
Run `:PlugInstall` and `:PlugUpdate` to load and install vim plugins
### Usage
Clone repo, open bash and run `./setup.sh`<br />
(This script will be updated as soon as I figure how to best clean it up.)

