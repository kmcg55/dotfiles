# Kelly McGucken's bashrc

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# Reset starship config location
export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml

# Enabling auto-completion
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
# Enabling autojump
[[ -s /usr/local/etc/profile.d/autojump.sh ]] && . /usr/local/etc/profile.d/autojump.sh

# Source bash aliases
if [ -f ~/dotfiles/bash/.bash_aliases ]; then
   . ~/dotfiles/bash/.bash_aliases
fi

# Set Vim as my default editor
export EDITOR=vim

# Initialize starship
eval "$(starship init bash)"
