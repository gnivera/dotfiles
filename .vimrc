" base setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set virtualedit=onemore
set smartindent
set visualbell
set matchtime=1
set showmatch
set laststatus=2
set list
imap <F11> <nop>
set pastetoggle=<F11>
set synmaxcol=200
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set list listchars=tab:\▸\-
set expandtab
set tabstop=2               
set shiftwidth=2 

" insert mode
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" search
set ignorecase
set smartcase
set incsearch
set wrapscan

" vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"gvim
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guifont=Monaco:h15

" other
syntax enable
set updatetime=250

" Disable all beeps
set visualbell t_vb=