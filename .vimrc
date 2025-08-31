scriptencoding utf-8

"--------------------------------------------------
" 文字コード/encoding
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

"--------------------------------------------------
" ファイル関連/files
"--------------------------------------------------
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

"--------------------------------------------------
" 表示/display
"--------------------------------------------------
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
set nocursorcolumn
" ターミナルのタイトルをセットする
set title
" 空白文字の可視化
set list listchars=tab:\-\>,eol:-,trail:↵,space:･ 
" ビープ音を可視化
"set visualbell
" 長い行の表示
set display=lastline
" 全角スペースの可視化
"augroup highlightIdegraphicSpace
"    autocmd!
"    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

" ステータスライン設定
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
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスライン表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示、2:常に表示)
set laststatus=2

"--------------------------------------------------
" 編集/edit
"--------------------------------------------------
" コマンドラインの保管
set wildmode=list:longest

if has('gui') || has('xterm_clipboard')
    "無名レジスタのデータを*レジスタにも入れる（yank内容をクリップボードと共有）
    set clipboard+=unnamed
endif
" 行末の1文字先までカーソル移動
"set virtualedit=onemore
" 矩形選択のブロック化（文字のないところにカーソル移動できるようにする）
"set virtualedit=block
" タブを半角スペースに
set expandtab
let _curfile=expand("%:t")
" Makefileはタブ使用
if _curfile == ('Makefile')
    set noexpandtab
endif
" 行頭でのタブ文字の表示幅
set tabstop=4
" スマートインデント
set smartindent
set shiftwidth=4

"--------------------------------------------------
" 検索/search
"--------------------------------------------------
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
" キーマップ/key mapping
"--------------------------------------------------
nnoremap ; :
nnoremap : ;

"--------------------------------------------------
" コマンド
"--------------------------------------------------
" コマンドモードの補完
set wildmenu

autocmd BufRead,BufNewFile *.php setlocal tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.c setlocal tabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile *.cpp setlocal tabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile *.java setlocal tabstop=4 shiftwidth=4

" 構文ハイライト
syntax on
"set t_Co=256

"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark



"--------------------------------------------------
" plugins
"--------------------------------------------------
"--------------------------------------------------
" dein.vim
"--------------------------------------------------
"deinn Scripts-----------------------------
"if &compatible
"    set nocompatible               " Be iMproved
"    endif
"
"    " Required:
"    set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
"
"    " Required:
"    if dein#load_state('$HOME/.cache/dein')
"        call dein#begin('$HOME/.cache/dein')
"
"        " Let dein manage dein
"        " Required:
"        call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
"
"        " Add or remove your plugins here:
"        call dein#add('Shougo/neosnippet.vim')
"        call dein#add('Shougo/neosnippet-snippets')
"        "call dein#add('vim-table-mode')
"        "下のメニュー表示
"        call dein#add('vim-airline/vim-airline')
"        "htmlタグ自動綴じ
"        call dein#add('alvan/vim-closetag')
"        "html/css入力補助プラグイン
"        call dein#add('mattn/emmet-vim')
"
"        " You can specify revision/branch/tag.
"        call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
"
"        " Required:
"        call dein#end()
"        call dein#save_state()
"    endif
"
"    " Required:
"    filetype plugin indent on
"    syntax enable
"
"    " If you want to install not installed plugins on startup.
"    if dein#check_install()
"        call dein#install()
"    endif

"End dein Scripts-------------------------

"if dein#is_installed('vim-closetag')
let g:closetag_filenames = '*.html, *php'
let g:user_emmet_leader_key='<c-s>'
"endif

