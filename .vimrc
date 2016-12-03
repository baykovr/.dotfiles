" Vundle Plugin Settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on


set laststatus=2
set encoding=utf-8

" Theme
"colorscheme seti
"
" Highlighting
syntax on
set number
set colorcolumn=80


set cursorcolumn cursorline
highlight ColorColumn  term=bold ctermbg=1
" 235 very dark grey
" 150 light green
" 121 neon green
" 90 ubuntu purplse
highlight CursorColumn term=bold ctermbg=255
highlight CursorLine   term=bold ctermbg=255


" Display
" set list
"set listchars=tab:▸\ ,eol:¬
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

