call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'conweller/findr.vim'
call plug#end()

" basics
set number
syntax on
set mouse=a
colorscheme molokai
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set autoindent
set ignorecase
set incsearch
set hlsearch

" change leader key
let mapleader = " "

" use global clipboard
set clipboard+=unnamedplus

" switch between tabs and spaces
nmap <leader>w/ :vsp<CR>
nmap <leader>w- :sp<CR>
nmap <leader>wd :q<CR>
nmap <leader>bd :bd<CR>
nmap <leader>wh <C-W>h
nmap <leader>wj <C-W>j
nmap <leader>wk <C-W>k
nmap <leader>wl <C-W>l
nmap <leader>m :set expandtab tabstop=8 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0<CR>
nnoremap <leader>ff :Findr<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>sd :Rg<CR>

" prevent trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" saner indenting
vmap > >gv
vmap < <gv

" saner Y
nnoremap Y y$

