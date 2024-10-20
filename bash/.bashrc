# Kelly McGucken's optimized bashrc

# Lazy loading function
lazy_load() {
    local cmd="$1"
    shift
    local args="$*"
    eval "${cmd}(){ unset -f ${cmd}; ${args}; ${cmd} \$@; }"
}

# Setting PATH for Python 3.11
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# Lazy load nvm
export NVM_DIR="$HOME/.nvm"
lazy_load nvm "[ -s '$NVM_DIR/nvm.sh' ] && . '$NVM_DIR/nvm.sh'; [ -s '$NVM_DIR/bash_completion' ] && . '$NVM_DIR/bash_completion'"

# Lazy load cargo
lazy_load cargo ". '$HOME/.cargo/env'"

# Reset starship config location
export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml

# Lazy load bash completion
lazy_load _bash_completion "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion"

# Lazy load autojump
lazy_load autojump "[[ -s /usr/local/etc/profile.d/autojump.sh ]] && . /usr/local/etc/profile.d/autojump.sh"

# Source bash aliases
[ -f ~/dotfiles/bash/.bash_aliases ] && . ~/dotfiles/bash/.bash_aliases

# Set Vim as default editor
export EDITOR=vim

# Initialize starship
eval "$(starship init bash)"
