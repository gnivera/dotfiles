"-----------------------
"Standard Configuration
"-----------------------

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 行番号を表示
set number
" 現在の行を強調表示
"set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" カーソルが飛ぶ時間
set matchtime=1
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" タブや改行を表示 (list:表示)
set list
"
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
""BSで削除できるものを指定する
" indent  : 行頭の空白
" " eol     : 改行
" " start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2               
" 行頭でのTab文字の表示幅
set shiftwidth=2 
" #インサートモードでもhjklで移動（Ctrl押すけどね）
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示

"------------------------------------
"" NERDTree
"------------------------------------

" NerdTreeを起動時に表示
"autocmd VimEnter * execute 'NERDTree'
nnoremap <silent><C-n> :NERDTreeToggle<CR>

" Evervimの設定
let g:evervim_devtoken='S=s436:U=8a04e0b:E=16083480f3b:C=1592b96df68:P=1cd:A=en-devtoken:V=2:H=bf83a27bf22cc9edc0bfc1fccf17a0ac'
nnoremap <Space>c :EvervimCreateNote<CR>
nnoremap <Space>l :EvervimNotebookList<CR>

"------------------------------------
"" emmet-vim
"------------------------------------

let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }

syntax enable
set background=dark
colorscheme solarized

"------------------------------------
"" neocomplcache
"------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


"dein Scripts-----------------------------
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/Yuki/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
  call dein#begin('/Users/Yuki/.vim/bundle')

" Let dein manage dein
" Required:
  call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('marijnh/tern_for_vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('kakkyz81/evervim')
  call dein#add('digitaltoad/vim-jade')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
" You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
"
" Required:
  call dein#end()

" Required:
  filetype plugin indent on
  syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"  "End dein Scripts-------------------------
