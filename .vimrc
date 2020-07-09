set number
syntax on
set mouse=a
colorscheme molokai
scriptencoding utf-8
set encoding=utf-8
set smartindent
set clipboard=unnamedplus

nmap <leader>m :set expandtab tabstop=8 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

vmap > >gv
vmap < <gv

nnoremap Y y$
