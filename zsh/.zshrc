# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable vim as default editor
export EDITOR=vim
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="passion"
# Set Zsh theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load fonts for powerline10k
# IMPORTANT, DO NOT DELETE!
export POWERLEVEL9K_MODE='nerdfont-complete'

# Set manpage viewer to vim 
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man nomod nolist' -\""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Plugins to load immediately
plugins=(git zsh-autosuggestions you-should-use zsh-syntax-highlighting)

# Function to lazy load plugins
lazy_load_plugin() {
  local plugin="$1"
  if [[ ! "$PLUGIN_LIST" =~ "$plugin" ]]; then
    source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
    PLUGIN_LIST="$PLUGIN_LIST $plugin"
  fi
}

# Lazy load web-search
web-search() {
  lazy_load_plugin "web-search"
  $0 "$@"
}

# Lazy load history-substring-search
history-substring-search-setup() {
  lazy_load_plugin "history-substring-search"
  
  # Remap history search to up and down arrows
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  
  # Config highlight color for history substring search
  export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bg=#48a32f,bold'
  
  # Remove this function after first call
  unset -f history-substring-search-setup
}

history-substring-search-up() {
  history-substring-search-setup
  zle history-substring-search-up
}

history-substring-search-down() {
  history-substring-search-setup
  zle history-substring-search-down
}

zle -N history-substring-search-up
zle -N history-substring-search-down

# Lazy load copyfile
copyfile() {
  lazy_load_plugin "copyfile"
  $0 "$@"
}

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Package manager env variables
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH=$PATH/usr/local/Cellar/openvpn/2.6.12/sbin/openvpn
export PKG_CONFIG_PATH=/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH

# Lazy load nvm
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}

# Lazy load cargo
cargo() {
  unset -f cargo
  . "$HOME/.cargo/env"
  cargo "$@"
}

# After loading Oh My Zsh, set up key bindings for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)

# Shortcut to quit application from command line
qapp() {
    osascript -e "quit app \"$1\""
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# Source aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
