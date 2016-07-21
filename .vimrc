scriptencoding utf-8
" gehirn vimrc
syntax on
set nocompatible
set number
set helplang=ja
set encoding=utf-8
set fencs=utf-8,euc-jp,iso-2022-jp,cp932
set autoindent smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab
set showmatch matchtime=1
set matchpairs+=<:>
set whichwrap+=h,l,<,>,[,],b,s,~
set nowrap
set ruler
set showcmd
set cmdheight=1
set laststatus=2
set ignorecase
set incsearch
set hlsearch
highlight LineNr ctermbg=grey ctermfg=darkgrey
highlight ZenkakuSpace cterm=underline ctermfg=blue
" $が行末に出る
set nolist
" set clipboard=autoselect,unnamed
" 空白表示など
" set lcs=tab:>.,eol:$,trail:_,extends:\

" 改行タイミングでコメント入れない
augroup auto_comment_off
    autocmd BufEnter * setlocal formatoptions-=ro
augroup END

" 手癖
nnoremap tn :tabe<CR>
nnoremap tq :tabc<CR>
inoremap <silent> <C-j> <ESC>
nnoremap ¥ \ 
nnoremap ; :
nnoremap : ;
nnoremap <Esc><Esc> :noh<CR>

nnoremap <silent> fm :Unite file_mru<CR>
" vimfilerの起動
nnoremap <silent> vf :VimFiler<CR>
nnoremap <silent> ve :VimFilerExplorer<CR>

"---------------------------
" Start Neobundle Settings.
"---------------------------

" bundleで管理するディレクトリを指定
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'msanders/snipmate.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

syntax on
colorscheme landscape 

"==========================
"init
"==========================
" leader is ,
let mapleader = ","


"==========================
"Tab Pages
"==========================

nnoremap <Leader>n :<C-u>tabnew<CR>
nnoremap <Leader>c :<C-u>tabclose<CR>
nnoremap <Leader>j :<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <Leader>k gT


let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

""
" Neo-complecache setting
""
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" swpの設定
set directory=~/.vim/temporary
set backupdir=~/.vim/temporary

" vim-ref : php info 
" php のリファレンス出来ない
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'

" Ag のオプション
" https://github.com/rking/ag.vim
let g:agprg="/usr/bin/ag --column"

" ---
" twig as html
" ---
if has('autocmd')
autocmd BufNewFile,BufRead *.twig set filetype=html
endif

" "-------------------------------------------
" " cscope
" "
nnoremap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <Leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>


