" general settings
syntax enable                   " enable syntax highlight
filetype plugin on              " enable filetype plugins
filetype indent on              " enable language-specific indenting
set nocompatible                " don't be compatible with vi
set nogdefault                  " don't use /g while searching
set wildmenu                    " show menu above the status line
set wildmode=full               " complete the next full match
set wildchar=<Tab>              " set TAB as a wildchar
set number                      " show line numbers by default
set showmode                    " show editor mode
set linebreak                   " do not break line inside of a word
set nowrap                      " don't wrap long lines
set showcmd                     " show command in the status bar
set ruler                       " show the number of line and column
set incsearch                   " show pattern while typing a search command
set ignorecase                  " required for smartcase below
set smartcase                   " ignore case only when lower case used
set hlsearch                    " highlight search pattern
set backspace=indent,eol,start  " for backspace to work as expected in insert mode
set encoding=utf-8              " use unicode
set smartindent                 " autoindent when starting a new line
set tabstop=4                   " number of spaces a <Tab> counts for
set shiftwidth=4                " number of spaces for each step of (auto)indent
set expandtab                   " use the appropriate number of spaces when inserting a <Tab>
set backup                      " backup original file that's being edited

" pathogen
if filereadable(expand("~/.vim/autoload/pathogen.vim"))
    runtime! autoload/pathogen.vim
    if exists("g:loaded_pathogen")
        execute pathogen#infect()
    endif
endif

" key mapping
nmap \n :setlocal number!<CR>   " show numbers
nmap \p :set paste!<CR>         " paste mode
nmap \q :nohlsearch<CR>         " stop highlighting search result
nmap \w :set wrap!<CR>          " wrap long lines
nmap \W :set nowrap!<CR>        " don't wrap long lines
nmap <C-n> :bnext<CR>           " go to next buffer
nmap <C-p> :bprev<CR>           " go to previous buffer
cnoremap <C-a> <Home>
cnoremap <C-d> <Delete>
" shift+left / shift+right

" auto completion
autocmd FileType css,html,perl,php,xml,xsd inoremap ' ''<Left>
autocmd FileType css,html,perl,php,xml,xsd inoremap '' ''<Left>
autocmd FileType css,html,perl,php,xml,xsd inoremap " ""<Left>
autocmd FileType css,html,perl,php,xml,xsd inoremap "" ""<Left>
autocmd FileType css,php,perl inoremap { {}<Left>
autocmd FileType css,php,perl inoremap {} {}<Left>
autocmd FileType php,perl inoremap ( ()<Left>
autocmd FileType php,perl inoremap () ()<Left>
autocmd FileType php inoremap <?? <?php ?><Left><Left>
autocmd FileType php inoremap <?= <?=$?><Left><Left>
autocmd FileType php inoremap [ []<Left>
autocmd FileType php inoremap [] []<Left>

" GUI settings
if has("gui_running")

    " general
    set background=light
    set columns=130 lines=40

    " OS X
    if has("macunix")
        set guifont=Monaco:h10
    endif

    " UNIX (GTK)
    if has("gui_gtk")
        set guifont=DejaVu\ Sans\ Mono\ 8
        set guioptions=aegit
        colorscheme solarized
    endif

endif

