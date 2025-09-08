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
call dein#add('scrooloose/nerdtree')
call dein#end()

filetype indent plugin on

" plugin installation check
if dein#check_install()
    call dein#install()
endif

"--------------------------------------------------
scriptencoding utf-8

"--------------------------------------------------
" ファイル設定
"--------------------------------------------------
set encoding=utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コード自動判別(左側から優先)
set fileencodings=utf-8,ucs-bom,cp932,sjis,euc-jp
" 改行コードの自動判別(左側から優先)
set fileformats=unix,dos,mac
" 全角半角
set ambiwidth=double

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden

"--------------------------------------------------
" 操作補助
"--------------------------------------------------
" コマンドラインの保管
set wildmode=list:longest
" コマンドモードの補完
set wildmenu
" 入力中のコマンドをステータスに表示する
set showcmd

if has('gui') || has('xterm_clipboard')
    "無名レジスタのデータを*レジスタにも入れる（yank内容をクリップボードと共有）
    set clipboard+=unnamed
endif

" タブを半角スペースに
set expandtab
let _curfile=expand("%:t")
" Makefileはタブ使用
if _curfile == ('Makefile')
    set noexpandtab
endif
" スマートインデント
set smartindent
" 行末の1文字先までカーソル移動
"set virtualedit=onemore
" 矩形選択のブロック化（文字のないところにカーソル移動できるようにする）
"set virtualedit=block
nnoremap ; :
nnoremap : ;
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 閉じタグ自動補完対象ファイル
let g:closetag_filenames = '*.html, *php'
" Emmet用キー
let g:user_emmet_leader_key='<c-s>'

" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" リアルタイム検索
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 行をまたいで移動
"set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start
" ESCキー2回押しでハイライトの切り替え
nnoremap <Esc><Esc> :noh<CR>

"--------------------------------------------------
" 見た目
"--------------------------------------------------
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
set nocursorcolumn
" 空白文字の可視化
set list listchars=tab:\-\>,eol:$,trail:␣,space:␣
" ビープ音を可視化
"set visualbell
" 長い行の表示
set display=lastline
" タブ幅
set tabstop=4
" インデント幅
set shiftwidth=4
"個別のタブインデント幅設定
autocmd BufRead,BufNewFile *.php setlocal tabstop=2 shiftwidth=2
" 全角スペースの可視化
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" ターミナルのタイトルをセットする
set title

" ステータスライン設定
" ステータスライン表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示、2:常に表示)
set laststatus=2
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" 文字コード
set statusline+=[%{&fileencoding}]
" 改行コード
if &fileformat == ('unix')
    set statusline+=[LF]
elseif &fileformat == ('dos')
    set statusline+=[CRLF]
elseif &fileformat == ('mac')
    set statusline+=[CR]
endif
" 現在行数/全行数
set statusline+=[%l/%L]

" 構文ハイライト
syntax on
set t_Co=256

