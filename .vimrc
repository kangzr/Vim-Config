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


filetype on
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
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"let NERDTreeShowBookmarks=0
"let NERDTreeIgnore = ['\.pyo$', '\.pyc']

" airline  buffer
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"set laststatus=2
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1  "显示buffer编号"

"let g:airline_theme='powerlineish'
"let g:pymode_syntax = 1
"let python_hightlight_all=1

" tagbar
Plugin 'majutsushi/tagbar'
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" fzf fuzzy finder
"Plugin 'junegunn/fzf.vim'
" let g:fzf_tags_command = 'ctags -R'

" ctrlsf.vim
Plugin 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_open_left= 0
let g:ctrlsf_ignore_dir = ["bot"]
let g:ctrlsf_default_view_mode = 'compact'

Plugin 'scrooloose/syntastic'

Plugin 'Raimondi/delimitMate'

"Plugin 'vim-scripts/indentpython'

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
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
" let g:ackprg = ag --nogroup --nocolor --column
"let g:ag_working_path_mode="c"

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


"map <F2> :NERDTreeTabsToggle<CR>
" buffer
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <C-^> :b#<CR>
map <C-i> :bd<CR>
map <C-j> :TagbarToggle<CR>

map <C-p> :FZF<CR>
map <C-n> :Buffers<CR>
"ctrlfs
map <C-k> :CtrlSF<CR>
nnoremap <C-\> :CtrlSF

source /usr/share/vim/vim80/colors/slate.vim

hi Search cterm=NONE
hi Search ctermfg=black
hi Search ctermbg=lightyellow
