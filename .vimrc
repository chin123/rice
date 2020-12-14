" basics
set number
syntax on
set mouse=a
colorscheme molokai
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8
set autoindent
set clipboard=unnamedplus
set ignorecase
set incsearch
set hlsearch

" switch between tabs and spaces
nmap <leader>m :set expandtab tabstop=8 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0<CR>

" prevent trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" saner indenting
vmap > >gv
vmap < <gv

" saner Y
nnoremap Y y$
