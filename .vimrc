set number
syntax on
set mouse=a
colorscheme molokai
scriptencoding utf-8
set encoding=utf-8
set smartindent
set clipboard=unnamedplus

nmap <leader>m :set expandtab tabstop=8 shiftwidth=2 softtabstop=2<CR>
nmap <leader>t :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

vmap > >gv
vmap < <gv

nnoremap Y y$

let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_winsize = 20

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <F2> :call ToggleNetrw()<CR>

function Wlc() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| wl-copy')
endfunction
