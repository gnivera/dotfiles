if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Green gui=NONE
    hi CursorIM guifg=NONE guibg=Red gui=NONE
endif

cd ~/Dropbox
autocmd vimenter * NERDTree
:set bg=dark
syntax on
colorscheme koehler
set transparency=25
