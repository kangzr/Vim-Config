"Basic"
set nocompatible
"set paste
syntax on
set number
set hlsearch
set incsearch
set noexpandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set cursorline!
set lazyredraw
set synmaxcol=128
syntax sync minlines=256

set foldmethod=indent
set foldlevelstart=99  "默认不折叠"

set fileencodings=utf-8
set encoding=utf-8

syntax sync minlines=256

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'

" NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeShowBookmarks=0
let NERDTreeIgnore = ['\.pyo$', '\.pyc']
Plugin 'juneedahamed/svnj'

" airline  buffer
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
"set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1  "显示buffer编号"

Plugin 'vim-python/python-syntax'
"let g:airline_theme='powerlineish'
"let g:pymode_syntax = 1
"let python_highlight_all=1

let python_highlight_class_vars=1
let python_highlight_builtin_funcs=1
let python_highlight_builtin_types=1
let python_highlight_builtin_objs=1

Plugin 'rafi/awesome-vim-colorschemes'

" tagbar  定义跳转，暂时弃用
Plugin 'majutsushi/tagbar'
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" fzf fuzzy finder
Plugin 'junegunn/fzf.vim'
let g:fzf_tags_command = 'ctags -R'

" ctrlsf.vim
Plugin 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_open_left= 0
let g:ctrlsf_ignore_dir = ["bot", "def_files", "engine"]
let g:ctrlsf_ignore_file_patterns = ["*.pyc", "*.pyo"]
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_context = '-B 0 -A 0'
let g:ctrlsf_winsize = '40%'

Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
"let g:syntastic_echo_current_error = 0

Plugin 'Raimondi/delimitMate'

"Plugin 'vim-scripts/indentpython'
Plugin 'itchyny/vim-cursorword'

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
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
" let g:ackprg = ag --nogroup --nocolor --column
"let g:ag_working_path_mode="c"
"let g:svnj_custom_statusbar_ops_hide = 1

set runtimepath^=~/.vim/bundle/ag

" set list
" set listchars=tab:\|\ ,trail:-,extends:>,precedes:<
" set listchars=tab:>-
" set listchars=tab:>-
" set listchars=eol:$,tab:>-,extends:>,precedes:<

" set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_custom_ignore = '\v[\/]\.(pyc|pyo)$'
" let g:ctrlp_custom_ignore = {'file': '\v\.(pyo|pyc)$'}
" set wildignore=*/bot/*
" set wildignore+=*.pyo
let g:Tortoise_Path = 'd:\Program Files\TortoiseSVN\bin\TortoiseProc.exe'


map <F2> :NERDTreeTabsToggle<CR>
" buffer
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <C-^> :b#<CR>
map <C-i> :bd<CR>
map <C-j> :TagbarToggle<CR>
map <C-t> :Tags<CR>

map <C-p> :FZF<CR>
map <C-n> :Buffers<CR>
"ctrlsf
map <C-k> :CtrlSF<CR>
nnoremap <C-\> :CtrlSF

"map <C-k> :Ag --follow<CR>
"nnoremap <C-\> :Ag --follow

"source /usr/share/vim/vim80/colors/desert.vim
"hi Search cterm=NONE
"hi Search ctermfg=15
"hi Search ctermbg=90
" colorscheme purify
" colorscheme space-vim-dark
colorscheme onedark


" fzf c+n/p 上下移动 c+c退出  c+a头 c+e尾 c+u删除所有输入
"
" cscope

if has("cscope")
  set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
  " check cscope for definition of a symbol before checking ctags:
  " set to 1 if you want the reverse search order.
   set csto=1

   " add any cscope database in current directory
   if filereadable("cscope.out")
       cs add cscope.out
   " else add the database pointed to by environment variable
   elseif $CSCOPE_DB !=""
       cs add $CSCOPE_DB
   endif

   " show msg when any other cscope db added
   set cscopeverbose

   nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   nmap <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
   nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
   nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
