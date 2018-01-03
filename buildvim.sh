#!/usr/bin/env bash

GITHUB=~/Projects/GitHub
VIM=~/.vim
AUTOLOAD=$VIM/autoload
BUNDLE=$VIM/bundle
COLORS=$VIM/colors
PLUGINS=$VIM/plugins

mkdir -p $GITHUB
mkdir -p $VIM $AUTOLOAD $BUNDLE $COLORS $PLUGINS

function get_plugin() {
    DIR=${1#https://github.com/}

    echo "Getting $DIR..."

    if [ -d $GITHUB/$DIR ]; then
        cd $GITHUB/$DIR &&
            git pull
    else
        echo git clone $1 $BUNDLE/${1##*/}
    fi

    echo -e "Done.\n"
}

# pathogen
TMP=$GITHUB/tpope/vim-pathogen &&
    mkdir -p $TMP &&
    git clone -q https://github.com/tpope/vim-pathogen $TMP &&
    ln -s $TMP/autoload/pathogen.vim $AUTOLOAD/

# get plugins
get_plugin https://github.com/scrooloose/nerdtree
get_plugin https://github.com/scrooloose/nerdcommenter
get_plugin https://github.com/tomtom/tlib_vim
get_plugin https://github.com/MarcWeber/vim-addon-mw-utils
get_plugin https://github.com/vim-airline/vim-airline
get_plugin https://github.com/vim-airline/vim-airline-themes
get_plugin https://github.com/tpope/vim-fugitive
get_plugin https://github.com/garbas/vim-snipmate
get_plugin https://github.com/honza/vim-snippets
get_plugin https://github.com/vimoutliner/vimoutliner
get_plugin https://github.com/sukima/xmledit
get_plugin https://github.com/luochen1990/rainbow

# get solarized theme
wget -q -P $COLORS https://raw.githubusercontent.com/altercation/solarized/master/vim-colors-solarized/colors/solarized.vim

# matchit.vim
if [ "$(uname)" == "Darwin" ]; then
    ln -s /opt/local/share/vim/vim80/macros/matchit.vim $PLUGINS
elif [ "$(uname)" == "Linux"  ]; then
    echo "FIXME!"
fi

