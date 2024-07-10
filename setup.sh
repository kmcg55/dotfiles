#!/bin/bash

# Define variables
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +'%Y%m%d_%H%M%S')"

# Create backup directory
echo "Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Backup function
backup_dotfile() {
    local file="$1"
    if [ -f "$HOME/$file" ]; then
        echo "Backing up $file to $BACKUP_DIR"
        mv "$HOME/$file" "$BACKUP_DIR"
    fi
}

# Backup and symlink .vimrc
backup_dotfile ".vimrc"
ln -s "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
echo "Linked .vimrc to $DOTFILES_DIR/vim/.vimrc"

# Backup and symlink .zshrc
backup_dotfile ".zshrc"
ln -s "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "Linked .zshrc to $DOTFILES_DIR/zsh/.zshrc"

# Backup and symlink .p10k.zsh
backup_dotfile ".p10k.zsh"
ln -s "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
echo "Linked .p10k.zsh to $DOTFILES_DIR/zsh/.p10k.zsh"

# Backup and symlink .vimrc.plug
backup_dotfile ".vimrc.plug"
ln -s "$DOTFILES_DIR/vim/.vimrc.plug" "$HOME/.vimrc.plug"
echo "Linked .vimrc.plug to $DOTFILES_DIR/vim/.vimrc.plug"

# Additional files can be added similarly...

# Additional setup tasks...

echo "Setup complete!"

