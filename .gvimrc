"--------------------------------------------------
" Plug in (dein.vim)
"--------------------------------------------------
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
    call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
    let s:dir = 'dein.vim'->fnamemodify(':p')
    if !(s:dir->isdirectory())
        let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
        if !(s:dir->isdirectory())
            execute '!git clone https://github.com/Shougo/dein.vim' s:dir
        endif
    endif
    execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

let s:dein_base = '~/.cache/dein/'
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+=' .. s:dein_src

call dein#begin(s:dein_base)
call dein#add(s:dein_src)
call dein#add('tomasr/molokai')
call dein#add('scrooloose/nerdtree')
call dein#end()

"--------------------------------------------------
filetype indent plugin on

" plugin installation check
if dein#check_install()
    call dein#install()
endif

"--------------------------------------------------
" 表示/display
"--------------------------------------------------
" 背景色
"set background=dark
" カラースキーム
colorscheme molokai
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
" フォント
set guifont=Ricty\ Diminished:h10
" 行間
"set linespace=0

" ウィンドウの縦幅
set lines=100
" ウィンドウの横幅
set columns=300
" メニュー表示/非表示
set guioptions+=m
" ツール表示/非表示
set guioptions-=T
"--------------------------------------------------
" UI
"--------------------------------------------------
" 右クリックメニュー追加
noremenu <script><silent> PopUp.メニューを表示 :set guioptions+=m<cr>
noremenu <script><silent> PopUp.メニューを非表示 :set guioptions-=m<cr>
noremenu <script><silent> PopUp.ツールバーを表示 :set guioptions+=T<cr>
noremenu <script><silent> PopUp.ツールバーを非表示 :set guioptions-=T<cr>

if has('syntax')
    syntax on
endif

