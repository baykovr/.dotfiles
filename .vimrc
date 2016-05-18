" Vundle Plugin Settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist'
call vundle#end()
filetype plugin indent on


set laststatus=2
set encoding=utf-8

" Theme
colorscheme twilight256
"
" Highlighting
syntax on
set number
set colorcolumn=80


set cursorcolumn cursorline
highlight ColorColumn  term=bold ctermbg=1
" 235 very dark grey
" 150 light green
highlight CursorColumn term=bold ctermbg=235
highlight CursorLine   term=bold ctermbg=235


" Display
"set list
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

