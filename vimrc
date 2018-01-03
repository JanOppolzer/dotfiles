" general settings
syntax enable                   " enable syntax highlight
filetype plugin on              " enable filetype plugins
filetype detect
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
set ruler                       " show ruler at the bottom
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
set background=light            " dark colours are more readable on light background
set statusline=                 " show default statusline
set matchpairs=(:),[:],{:},<:>  " pairs for '%' command
set showmatch                   " show pairing symbol (starting one) when typing the ending one
set cursorline                  " show cursor line (cul)
set nocursorcolumn              " don't show cursor column (cuc)
set path+=**                    " search down through subfolders
"set list                        " show end lines and tabulators

" pathogen
if filereadable(expand("~/.vim/autoload/pathogen.vim"))
    runtime! autoload/pathogen.vim
    if exists("g:loaded_pathogen")
        execute pathogen#infect()
    endif
endif

" auto completion
autocmd FileType css,html,perl,php,xml,xsd inoremap ' ''<Left>
autocmd FileType css,html,perl,php,xml,xsd inoremap '' ''<Left>
autocmd FileType css,html,perl,php,xml,xsd inoremap " ""<Left>
autocmd FileType css,html,perl,php,xml,xsd inoremap "" ""<Left>
autocmd FileType css,php,perl inoremap { {}<Left>
autocmd FileType css,php,perl inoremap {} {}<Left>
autocmd FileType html,xml inoremap <!-- <!-- --><Left><Left><Left>
autocmd FileType php,perl inoremap ( ()<Left>
autocmd FileType php,perl inoremap () ()<Left>
autocmd FileType php inoremap <?? <?php ?><Left><Left>
autocmd FileType php inoremap <?= <?=$?><Left><Left>
autocmd FileType php inoremap [ []<Left>
autocmd FileType php inoremap [] []<Left>

" Dash.app (OS X only)
if has("macunix")
    let g:dash_activate=0
endif

" GUI settings
if has("gui_running")

    " general
    set background=light
    set columns=130 lines=40
    set linespace=0

    " OS X
    if has("macunix")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
        let g:airline_theme='solarized'
        colorscheme solarized
    endif

    " UNIX (GTK)
    if has("gui_gtk")
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 8
        set guioptions=aegit
        colorscheme solarized
    endif

else

    let g:airline_theme='light'

endif

" colors
syn match Tab "\t"
hi def Tab ctermbg=red guibg=#ff0000

" restore the position of last edit
au BufReadPost * normal `"

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" rainbow parentheses
let g:rainbow_active = 1

" mapleader
let mapleader=","
let maplocalleader=","

" generate `tags`
command! MakeTags !ctags -R .

