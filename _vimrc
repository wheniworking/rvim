
let g:iswindows = 0
let g:islinux = 0

if(has("win32") || has("win64"))
  let g:iswindows = 1
else
  let g:islinux = 1
endif


if has("gui_running")
  let g:isGUI = 1
else
  let g:isGUI = 0
endif






set nocompatible
filetype off

if g:islinux
  "set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  "call vundle#begin()
  call vundle#begin('~/.vim/bundle/')
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')
else
  set rtp+=$VIM\vimfiles\bundle\Vundle.vim
  "call vundle#begin()
  cal vundle#begin('$VIM\vimfiles\bundle\')
endif           



" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'moll/vim-node'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"""""""""""""""""""""""""""""""""""""""""
"       编码配置 
"""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码
 
" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型
 
if (g:iswindows && g:isGUI)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
 
    "解决consle输出乱码
    language messages zh_CN.utf-8
endif


"""""""""""""""""""""""""""""""""""""""""""'
"    自动保存 
""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1

"""""""""""""""""""""""""""""""""""""""""""'
"    基本设置
""""""""""""""""""""""""""""""""""""""""""""
syntax on

set hidden
set expandtab
set number relativenumber numberwidth=4
set shiftround shiftwidth=4
set tabstop=4
set wrap
set wildmenu
set nobackup

"""""""""""""""""""""""""""""""""""""""""""'
"    fancy statuline
""""""""""""""""""""""""""""""""""""""""""""
set statusline=%f
set statusline+=\ -\
set statusline+=FileType:
set statusline+=%y
set statusline+=%l
set statusline+=/
set statusline+=%L

let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""'
"    按键映射
""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","
let maplocalleader="\\"

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lela
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lela

nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader><space> viw

nnoremap <c-u> viwUe

inoremap <esc> <nop>
inoremap jk <ESC>
inoremap <c-d> <esc>ddi

map <leader>f :q!<cr>

"""""""""""""""""""""""""""""""""""""""""""'
"    窗口分屏
""""""""""""""""""""""""""""""""""""""""""""

map <s-tab> :bp<cr>
map <tab> :bn<cr>
map <leader>bd :bd<cr>
