" Plugins
execute pathogen#infect()
filetype plugin indent on

" [p] Powerline
set nocompatible
set laststatus=2
set encoding=utf-8

" Theme
colorscheme twilight256

" Highlighting
syntax on
set number
set colorcolumn=80


set cursorcolumn cursorline
highlight ColorColumn  term=bold ctermbg=darkgrey
highlight CursorColumn term=bold ctermbg=darkgrey
highlight CursorLine   term=bold ctermbg=darkgrey 

" Display
set list
set listchars=tab:▸\ ,eol:¬
set ttyfast

" Mouse support
set mouse=a

" Text
set incsearch
set smartcase
set hlsearch
set shiftwidth=2
set tabstop=2

" Keybindings 
map ^C esc

