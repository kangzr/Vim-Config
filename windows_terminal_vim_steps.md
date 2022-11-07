### Window Terminal
配置可直接copy：sample_windows_terminal_setting
快捷键：（可自行调整）
shift alt +         : 垂直分屏
shift alt =         : 水平分屏
ctrl shift w        : 关掉屏幕(也可以用exit指令)
alt 方向键          : 切换屏幕
ctrl shift 数字     : 新增页签tab
alt 数字(1,2..)     : 切换tab页签

### zsh 安装
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
推荐主题 ：gentoo（~/.vimrc中修改）

zsh中自带了很多git的快捷键，比如gst: git status

### vim
安装bundle：git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

配置可直接copy: sample_vimrc -> ~/.vimrc
vim ~/.vimrc  PluginInstall即可

vimrc中有快捷绑定设定，可自行修改：
1. ctrl+p: fzf文件搜索
2. F2: 打开目录树
3. ctrl+n: 缓存搜索(已打开文件)
4. ctrl+k: 搜索当前光标下文本
5. ctrl+\: 调出CtrlSF 自行属性文本搜索
