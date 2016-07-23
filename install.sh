#!/bin/bash

###############################################################################
# Description:
# 
# This script places the dotfiles found at
# https://github.com/hamez0r/dotfiles.git
# in their required locations.
# When this script has finish, in order to install all Vim's plugins,
# fire up Vim and run :PlugInstall
###############################################################################

# Create $HOME/.vim/autoload, including parents if they don't exist.
# In case of fresh install, they're most likely not there.

# place vim plugin manager here
mkdir -p $HOME/.vim/autoload

#place vim colors here
mkdir -p $HOME/.vim/colors


# Copy vim-plug to ~/.vim/autoload
if [[ -f plug.vim ]]; then
    cp plug.vim $HOME/.vim/autoload
else
    echo "plug.vim file not found. vim-plug will not be available"
fi

if [[ -f .vimrc ]]; then
    cp .vimrc $HOME/
else
    echo ".vimrc file not found."
fi

if [[ -f .vimrc.bundles ]] then
    cp .vimrc.bundles $HOME/
else
    echo ".vimrc.bundles file not found. You will be missing vim plugins"
fi

if [[ -f wombat256.vim ]] then
    cp wombat256.vim $HOME/.vim/colors
else
    echo "wombat256.vim file not found. You will be missing vim plugins"
fi

if [[ -f .tmux.conf ]]; then
    cp .tmux.conf $HOME/
else
    echo ".tmux.conf file not found"
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Install completed. Open vim and run :PlugInstall"
echo "Then run chsh -s /bin/zsh and restart your terminal"

