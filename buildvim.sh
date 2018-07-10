#!/usr/bin/env bash

GITHUB=~/Projects/GitHub
VIM=~/.vim
AUTOLOAD=$VIM/autoload
BUNDLE=$VIM/bundle
COLORS=$VIM/colors
PLUGIN=$VIM/plugin
SNIPPETS=$VIM/snippets

mkdir -p $GITHUB
mkdir -p $VIM $AUTOLOAD $BUNDLE $COLORS $PLUGIN $SNIPPETS

function get_plugin() {
    DIR=${1##*/}

    echo "Getting $DIR..."

    if [ -d $BUNDLE/$DIR ]; then
        cd $BUNDLE/$DIR &&
            git pull
    else
        git clone $1 $BUNDLE/$DIR
    fi

    echo -e "Done.\n"
}

function get_pathogen() {
    TMP=$GITHUB/tpope/vim-pathogen

    echo "Getting vim-pathogen..."

    if [ -d $TMP ]; then
        cd $TMP &&
            git pull
    else
        mkdir -p $TMP &&
            git clone https://github.com/tpope/vim-pathogen $TMP
    fi

    if [ ! -h $AUTOLOAD/pathogen.vim ]; then
        echo "Creating symlink for pathogen.vim..."
        ln -s $TMP/autoload/pathogen.vim $AUTOLOAD/
    fi

    echo -e "Done.\n"
}

function get_calendar() {
    if [ ! -d $BUNDLE/calendar ]; then
        echo "Getting calendar plugin..."
        wget -O $VIM/calendar.zip http://www.vim.org/scripts/download_script.php?src_id=19707
        mkdir $BUNDLE/calendar
        unzip $VIM/calendar.zip -d $BUNDLE/calendar
        rm $VIM/calendar.zip
        echo -e "Done.\n"
    fi
}

# pathogen
get_pathogen

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
#get_plugin https://github.com/luochen1990/rainbow

# get calendar
get_calendar

# get solarized theme
if [ ! -f $COLORS/solarized.vim ]; then
    echo "Getting solarized.vim color theme..."
    wget -q -P $COLORS https://raw.githubusercontent.com/altercation/solarized/master/vim-colors-solarized/colors/solarized.vim
    echo -e "Done.\n"
fi

# matchit.vim
if [ ! -f $PLUGIN/matchit.vim ]; then
    echo "Creating symlink for matchit.vim..."
    if [ "$(uname)" == "Darwin" ]; then
        ln -s /opt/local/share/vim/vim80/macros/matchit.vim $PLUGIN
    elif [ "$(uname)" == "Linux"  ]; then
        ln -s /usr/share/vim/vim80/macros/matchit.vim $PLUGIN
    fi
    echo -e "Done.\n"
fi

# my snippets
for s in $(ls vim/snippets/); do
    echo "Creating symlink for $s..."
    ln -s $(pwd)/vim/snippets/$s $SNIPPETS/$s
    echo -e "Done.\n"
done

