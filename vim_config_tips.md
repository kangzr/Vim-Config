> 最近从Sublime转向Vim，花了比较多的时间进行研究和配置，要想拥有一款属于自己的Vim，请不要直接套用别人的配置，会让你一脸懵逼，很多你想要的功能没有，你不想要的功能却有，臃肿的配置文件也会让你的Vim开启变卡，因此，最好是根据需求进行个性化定制。以下是我的配置过程与用到的插件。



**开发环境**： WSL  Ubuntu 18.04.2 LTS + Vim 8.0



#### 一，安装Vundle

-  只需一步即可:

 `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

- 接下touch .vimrc就可以在里面安装自己想要的插件了

```shell
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
# 把你想要的插件安装在这里 
# 安装的形式有多种 一般使用Plugin on Github repo， 如上VUndle.vim
call vundle#end()
filetype plugin indent on
```

- 初始化工作完成，接下来开始你的DIY



#### 二，插件的安装、配置、功能与使用

这一部分会简单介绍一下自己使用到的一些插件，也欢迎大家补充

##### 自动补齐插件

##### YouCompleteMe

1)  配置python和c编译环境

```shell
sudo apt-get install python
sudo apt-get install build-essential cmake 
sudo apt-get install python-dev
```

2)  安装

```shell
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

# .vimrc中添加
Plugin "Valloric/YouCompleteMe"

# 基本所有的插件都是这个安装套路，后面只给git地址

or 

cd ~/.vim/bundle/YouCompleteMe 
./install.py


```

3)  操作

```shell
#在输入过程中 按下 ctrl+p 和 ctrl+n进行选中切换
# 这是YCM默认的快捷键(../YouCompleteMe/autoload/youcompletme.vim中设置)，你也可以在.vimrc中进行修改()
let g: ycm_key_list_select_completion = 
let g: ycm_key_list_previous_comletion =

# 个人直接用的默认，没有进行修改

#TIPS
# 如果使用过程提示找不到配置文件，需要在.vimrc中设置
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
```

##### ag

内容搜索神器ag， 搜索速度极快: ag>ack>grep

1)  安装

```shell
apt-get install silversearcher-ag
git https://github.com/rking/ag.vim
```

2) 操作

```shell
# 具体操作选项
$ ag -g

# 之后用到的文件搜索/字符串搜索都可以配置为ag
```



##### 文件搜索插件

##### CtrlP

1)  安装

```shell
git addr: https://github.com/kien/ctrlp.vim

```

2)  配置

```shell
# 设置搜索目录为当前目录
let g:ctrlp_working_path_mode='c'

# 如果你想用vim开启的目录作为搜索路径，可以设置为0
let g:ctrlp_working_path_mode = 0  
 
'c' - the directory of the current file.
'a' - the directory of the current file, unless it is a subdirectory of the cwd

# 不搜索哪些目录
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
  
  
  # 更多配置可在bundle/ctrlp目录下或者git网址上查看
```

3）操作

```
 CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
 CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode
```

##### FZF + Fd

CtrlP当开始打开的时候会有一点慢(缓存)，之后搜索开始挺快的，而FZF刚开始也很快，不会卡那么久，因此个人选择Fuzzy Finder

> 是一款使用 golang编写的交互式的 Unix 命令行工具。可以用来查找任何 **列表** 内容，文件、Git 分支、进程等。所有的命令行工具可以生成列表输出的都可以再通过管道 pipe 到 fzf 上进行搜索和查找 
>
> 优点：
>
> - GO 语言编写，编译完生成可执行文件没有任何依赖
> - 搜索/查找速度飞快
> - 功能全面/可视化界面体验很棒
> - 周边插件丰富 (vim, tmux, fuzzy auto-completion)



1)  安装

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# fd 安装与使用请查看
https://github.com/sharkdp/fd
```

2)  配置

```shell
# ctrlp和fzf都可以配置为ag

# fzf + fd   快到飞起
fzf搜索文件默认使用grep，而fd搜索速度要快于grep，因此可以配置fzf为fd
export FZF_DEFAULT_COMMAND='fd --type file --follow --exclude *.py[co] --exclude bot'

# 之前是使用下面ag。。。


# fzf与ag
fzf+ag
# 默认也是在vim开启的路径下搜索 如果想要ingore某些文件夹
export FZF_DEFAULT_COMMAND='ag -l --ignore bot/'
# 如果不想每次开启终端都手动输入，可以，在~/.bash_proile中添加上述指令，然后
source ~/.bashrc_profile  # 将这句话添加到~/.bashrc即可
# 具体配置可以在shell中输入ag -g即可




```

3)  操作

```shell
 ctrl+(jk)：光标上下移动
 ctrl + x : 'split'  # 上下分屏打开
 ctrl + v : 'vsplit'  # 左右分屏打开
 ctrl + t : 'tab split'  #新tab打开
 Enter: 选中条目
 Esc: 退出
# 自定义快捷键(在vimrc中设置)
ctrl + n: fzf buffers
ctrl + p: fzf 
 
```

 ##### 文本搜索

##### ctrlfs + ag

1)  安装

```shell
https://github.com/dyng/ctrlsf.vim

```

2)  配置

```shell
# 设置ag
let g:ctrlsf_ackprg = 'ag'

# 搜索显示方式
let g:ctrlsf_default_view_mode = 'compact'  # 下方紧凑列出 可以通过M进行实时切换

# 默认也是当前vim开启目录

# 其他配置也请前往git网址

# ignore file
# 在搜索目录下创建.ignore文件，把需要忽略的文件喝文件夹放入, 例如
tags
*.pyc
*.pyo
data/*
```

3) 操作

```shell
map <C-k> :CtrlSF<CR>  # 会自动搜索光标处单词
# normal模式下 会帮你输入:CtrlSF    切记不要加<CR> 然后你可以直接输入你想要搜索的字符串
nnoremap <C-\> :CtrlSF 

# 忽略文件夹data
CtrlSF MaxTarget -ignoredir "data"
```

##### 函数跳转与代码预览

两种插件在项目开发中可以极大提高工作效率

##### ctags

1)  安装

```shell
sudo apt-get install exuberant-ctags
```

2)  操作与使用

```shell
1. 在project根目录下执行
ctags -R  # 生成tags文件

2. 快捷键
ctrl+] # 函数跳转
ctrl+t # 返回

# 缺点是 如果有新函数加入需要重新ctags -R
```

##### tagbar

1)  安装

```shell
Plugin 'majutsushi/tagbar'
```

2)  配置

```shell
let g:tagbar_autopreview = 1 "开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_ctags_bin = 'ctags' "tagbar以来ctags插件  需要安装ctags
let g:tagbar_left = 1 "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 30 "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 1 "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0 "设置标签不排序，默认排序
```

3) 操作

```shell
p: 跳到定义位置，但光标仍然在tagbar原位置

# Fold
+: 展开
-: 折叠

*: 展开所有标签
=: 折叠所有标签

o: 折叠展开切换

```

有了这两个插件，阅读代码非常方便高效，无论代码量多大

##### 底部阅读状态显示

##### airline

#### airline

The statusline is the colored line at the bottom

1)  安装

```shell
https://github.com/vim-airline/vim-airline.git

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
```

2)  配置

```shell
let g:airline#extensions#tabline#enabled = 1 “ 显示窗口tab和buffer
let g:airline#extensions#tabline#buffer_nr_show=1  " 显示 buffer 编号，方便切换
```

3)   操作

```shell
buffer操作：
1: b n(编号) （切换buffer）
2: ls  (查看当前已打开的buffer)
3: bn -- (下一个buffer)
4: bp -- (上一个buffer)
5: b# -- (前一个buffer)

# 快捷键设置
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <C-u> :b#<CR>
map <C-i> :bd<CR>
```

##### 目录树插件

##### NerdTree

左侧栏列出当前文件所在的目录树，类似IDE，如果你项目代码不是很熟悉的话，这个是有用的。。。这个我用的比较少，因此只给出了安装路径

1)  安装

```shell
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
```

##### flake8

Pythoner必备

```shell
1. Install syntastic (静态语法检查，不只是python, 这个插件会让vim wrriten很慢。。。。需要将g:syntastic_enable_highlighting=0)
	Plugin 'scrooloose/syntastic'   
2. Install flake8
	sudo apt install python-flake8  # python2
    sudo apt install flake8  # python3

python2 / 3 切换方式
# python2: .vimrc中
let g:syntastic_python_flake8_exec = 'python'
let g:syntastic_python_flake8_args = ['-m', 'flake8']

# 如果需要ignore 一些error
# 新建目录和文件
mkdir ~/.config
touch flake8
`
[flake8]
ignore = W191,E501,E117,E241     
```

python-syntax

```
https://github.com/vim-python/python-syntax

```



到此，用到的相关插件已经介绍完毕，如果有什么更好的插件，欢迎补充

##### 显示与当前光标相同的word

##### vim-cursorword

```shell
https://github.com/itchyny/vim-cursorword
```



#### 三 基本设置

```shell
# 切记不要设置
set paste   
# 亲测bug，，，如果你设置了这个选项，那么括号自动补补齐，永远都不会生效

set tabstop=4   # 一个tab键占用的列数，(linux内核建议每个tab占用8列)
# 如果你发现打开文件永远都是一个tab==8,在当前文件设置set ts=4会生效，但是重新打开又是8，那么你需要修改vim针对python的默认设置，在以下目录中修改
/usr/share/vim/vim80/ftplugin/python.vim

set noexpandtab # tab不转space

# 这个设置非常重要，会让你当前文件搜索很舒服
set incsearch  #输入字符串同时开始搜索和高亮已经输入的部分

set hlsearch # 高亮选中pattern

# 自动缩进
filetype indent plugin on

# 括号自动补全，可以考虑插件Raimondi/delimitMate


# map imap noremap inoremap
noremap normal模式(不会递归映射)
inoremap insert模式

# 设置高亮配色
hi Search cterm=NONE
hi Search ctermfg=black  (15)
hi Search ctermbg=lightyellow  (70)
# 设置背景和前景颜色
:highlight Normal ctermfg ctermbg
# 主题调整
git clone https://github.com/rafi/awesome-vim-colorschemes
colorscheme name  # 而不需要自己瞎配置


# 折叠代码
set foldmethod=indent

# 其他设置根据需求设定

```

#### 四 VIM常用快捷键

```shell
# 移动
f - 移动至光标右侧指定字符(F反向) eg: "fx" 右边第一个x字符
w: 右移一个单词，光标停在下一个单词开头
e: 右移一个单词，光标停在下一个单词末尾
b: 左移一个单词

ctrl + o 返回上次光标处
ctrl + e : 向下移动页面
ctrl + y : 向上移动页面
ctrl + f : 向上翻页
ctrl + b : 向下翻页
ctrl + u : 向上翻半页
ctrl + d : 向下翻半页

zz/zt/zb: scroll midlle top bottom

# 删除复制
D - 删除光标至行尾
d^ - 删除光标至行首(不删除tab)
d0 - 删除光标至行首(删除tab)
s - 修改当前光标下字符
S - 修改一整行

yaw - 复制整个单词
daw - 删除整个单词
caw - 删除整个单词，进入instert模式

ngg/gG - 跳转到n行

ve - 选中整个单词 (光标位于词首，用于复制替换某个的单词)

# 括号操作['"
ci/yi/di/va  (不包括括号)
ca/ya/da/va  (包括括号)

# 重复输入n个*
1. normal模式, 输入n
2. insert模式, 输入*, ESC即可

# 折叠快捷键
za: Toggle code folding at the current line. The block that the current line belongs to is folded (closed) or unfolded (opened).
zo: Open fold.
zc: Close fold.
zR: Open all folds.
zM: Close all folds.
```

##### 排查Vim慢的方法

```shell
# 打开vim输入以下指令
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!
# 查看profile.log文件
```

以上，欢迎大家分享补充，工欲善其事必先利其器，VIM很强大













































