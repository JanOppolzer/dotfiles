" general settings
syntax enable					" enable syntax hilight
filetype plugin on				" enable filetype plugins
filetype indent on				" enable language-specific indenting
set nocompatible				" don't be compatible with vi
set nogdefault					" don't use /g while searching
set wildmenu					" show menu above the status line
set wildchar=<Tab>				" set TAB as a wildchar
set number					" show line numbers
set showmode					" show editor mode
set nolinebreak					" break line even inside of a word
set nowrap					" don't wrap long lines
set showcmd					" show command in the status bar
set ruler					" show the number of line and column
set smartcase					" ignore case only when lower case used
set backspace=indent,eol,start			" for backspace to work as expected in insert mode
set encoding=utf-8				" use unicode

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

