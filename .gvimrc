"--------------------------------------------------
" 表示/display
"--------------------------------------------------
" ウィンドウの縦幅
set lines=100
" ウィンドウの横幅
set columns=300
" カラースキーム
"colorscheme koehler "molokai
colorscheme molokai
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
"set guioptions-=T
"set guioptions-=m
"set guioptions-=r
"set guioptions-=R
"set guioptions-=l
"set guioptions-=L
"set guioptions-=b

" 背景色
"set background=dark

" フォント
set guifont=Ricty\ Diminished:h10
" 行間
"set linespace=0

"" カラー設定:
"let g:molokai_original=0
"set transparency=215
" 文字化け防止
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" Themeの設定
"let $COLORS="$VIM/vimfiles/colors"
"let g:molokai_original=0
set t_Co=256

" 透過設定
"autocmd GUIEnter * set transparency=225
"autocmd FocusGained * set transparency=225
"autocmd FocusLost * set transparency=210

" 日本語入力時にカーソルに色を設定
"if has('multi_byte_ime')||has('xim')
"    highlight CursorIM guibg=Purple guifg=NONE
"endif

" メニューおよびツール非表示
"set guioptions-=T
"set guioptions-=m

" 右クリックメニュー追加
"noremenu <script><silent> PopUp.ツールバーを表示 :set guioptions+=T<cr>
"noremenu <script><silent> PopUp.ツールバーを非表示 :set guioptions-=T<cr>
"noremenu <script><silent> PopUp.メニューを表示 :set guioptions+=m<cr>
"noremenu <script><silent> PopUp.メニューを非表示 :set guioptions-=m<cr>


"--------------------------------------------------
" dein.vim
"--------------------------------------------------
"let s:dein_dir = expand('')
"
"if !isdirectory(s:dein_repo_dir)
"    excute '' s:dein_repo_dir
"endif
"
"call dein#add('tomasr/molokai')
"colorscheme molokai



