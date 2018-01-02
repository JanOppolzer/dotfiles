#!/usr/bin/env bash

GITHUB=~/Projects/GitHub
VIM=~/.vim
AUTOLOAD=$VIM/autoload
BUNDLE=$VIM/bundle
COLORS=$VIM/colors
PLUGINS=$VIM/plugins

mkdir -p $GITHUB
mkdir -p $VIM $AUTOLOAD $BUNDLE $COLORS $PLUGINS

function clone_repository() {
    git clone -q $1 $BUNDLE/${1##*/}
}

# pathogen
TMP=$GITHUB/tpope/vim-pathogen &&
    mkdir -p $TMP &&
    git clone -q https://github.com/tpope/vim-pathogen $TMP &&
    ln -s $TMP/autoload/pathogen.vim $AUTOLOAD/

# get plugins
clone_repository https://github.com/scrooloose/nerdtree
clone_repository https://github.com/scrooloose/nerdcommenter
clone_repository https://github.com/tomtom/tlib_vim
clone_repository https://github.com/MarcWeber/vim-addon-mw-utils
clone_repository https://github.com/vim-airline/vim-airline
clone_repository https://github.com/vim-airline/vim-airline-themes
clone_repository https://github.com/tpope/vim-fugitive
clone_repository https://github.com/garbas/vim-snipmate
clone_repository https://github.com/honza/vim-snippets
clone_repository https://github.com/vimoutliner/vimoutliner
clone_repository https://github.com/sukima/xmledit
clone_repository https://github.com/luochen1990/rainbow

# get solarized theme
wget -q -P $COLORS https://raw.githubusercontent.com/altercation/solarized/master/vim-colors-solarized/colors/solarized.vim

# matchit.vim
if [ "$(uname)" == "Darwin" ]; then
    ln -s /opt/local/share/vim/vim80/macros/matchit.vim $PLUGINS
elif [ "$(uname)" == "Linux"  ]; then
    echo "FIXME!"
fi

