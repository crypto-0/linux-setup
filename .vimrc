syntax on


"omnifunc
set omnifunc=syntaxcomplete#Complete

"others
set termguicolors
set relativenumber
set number
set shiftwidth=2 softtabstop=2 expandtab
set autoindent
filetype on 
filetype plugin on
filetype indent on
set complete+=kspell
set completeopt=menuone,longest
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set shortmess+=c
set hidden
set clipboard=unnamed
set updatetime=300
set colorcolumn=80
set cursorline
set noeb vb t_vb=
highligh colorcolumn ctermbg=0 guibg=lightgrey

"add tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"noremap
inoremap jj <esc>

"leader key
let mapleader = ","

"split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"nnoremap <leader>h :wincmd h<CR>
"nnoremap <leader>j :wincmd j<CR>
"nnoremap <leader>k :wincmd k<CR>
"nnoremap <leader>l :wincmd l<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
set splitbelow
set splitright

"color scheme
"git clone https://github.com/morhetz/gruvbox.git
"~/.vim/pack/default/start/gruvbox
if &term =~ '256color'
    set t_ut=
endif
set termguicolors
"autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox
set background=dark

"coc mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"lightline setting
set laststatus=2
set noshowmode

"netrw setting
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
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
nmap <leader>r  <plug>NetrwRefresh
noremap <leader>e  :call ToggleNetrw()<cr>
"call ToggleNetrw()
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :call ToggleNetrw()
augroup END
inoremap <silent> <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
