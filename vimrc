" general settings
syntax enable                   " enable syntax highlight
filetype plugin on              " enable filetype plugins
filetype indent on              " enable language-specific indenting
set nocompatible                " don't be compatible with vi
set nogdefault                  " don't use /g while searching
set wildmenu                    " show menu above the status line
set wildchar=<Tab>              " set TAB as a wildchar
set number                      " show line numbers
set showmode                    " show editor mode
set linebreak                   " do not break line inside of a word
set nowrap                      " don't wrap long lines
set showcmd                     " show command in the status bar
set ruler                       " show the number of line and column
set smartcase                   " ignore case only when lower case used
set backspace=indent,eol,start  " for backspace to work as expected in insert mode
set encoding=utf-8              " use unicode
set hlsearch                    " highlight search pattern
set smartindent                 " autoindent when starting a new line
set tabstop=4                   " number of spaces a <Tab> counts for
set shiftwidth=4                " number of spaces for each step of (auto)indent
set expandtab                   " use the appropriate number of spaces when inserting a <Tab>
set backup                      " backup original file that's being edited

" auto completion
autocmd FileType html inoremap ( ()<Left>
autocmd FileType html inoremap () ()<Left>
autocmd FileType html,css inoremap ' ''<Left>
autocmd FileType html,css inoremap '' ''<Left>
autocmd FileType html,css inoremap " ""<Left>
autocmd FileType html,css inoremap "" ""<Left>
autocmd FileType css inoremap { {}<Left>
autocmd FileType css inoremap {} {}<Left>
autocmd FileType perl inoremap ( ()<Left>
autocmd FileType perl inoremap () ()<Left>
autocmd FileType perl inoremap { {}<Left>
autocmd FileType perl inoremap {} {}<Left>
autocmd FileType perl inoremap ' ''<Left>
autocmd FileType perl inoremap '' ''<Left>
autocmd FileType perl inoremap " ""<Left>
autocmd FileType perl inoremap "" ""<Left>

