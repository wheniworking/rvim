
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
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/molokai'
Plugin 'vim-scripts/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-run-interactive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-endwise'

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
 
" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

 
if (g:iswindows && g:isGUI)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
 
    "解决consle输出乱码
    language messages zh_CN.utf-8
elseif (g:islinux && g:isGUI)
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
endif


"""""""""""""""""""""""""""""""""""""""""""'
"    自动保存 
""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1

"""""""""""""""""""""""""""""""""""""""""""'
"    基本设置
""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable

autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery


colorscheme molokai
highlight NonText guibg=#060606
highlight Folded guibg=#0A0A0A guifg=#9090D0

" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

set matchpairs+=<:>
set hlsearch

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

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
nnoremap <leader>r  :RunInInteractiveShell<space>

inoremap jk <ESC>
inoremap <c-d> <esc>ddi

map <leader>f :q!<cr>

"""""""""""""""""""""""""""""""""""""""""""'
"    窗口分屏
""""""""""""""""""""""""""""""""""""""""""""

map <s-tab> :bp<cr>
map <tab> :bn<cr>
map <leader>bd :bd<cr>

"""""""""""""""""""""""""""""""""""""""""""'
"    ctrlp
""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux"
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
