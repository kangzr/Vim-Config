### 1. Window Terminal
可sample_windows_terminal_setting中actions和schemes替换掉配置json对应部分即可

快捷键：（可自行调整）
shift alt +         : 垂直分屏(alt shift d也可)
shift alt =         : 水平分屏
ctrl shift w        : 关掉屏幕(也可以用exit指令)
alt 方向键          : 切换屏幕
ctrl shift 数字     : 新增页签tab
alt 数字(1,2..)     : 切换tab页签

### 2. 执行init_deps.sh安装软件包
包括fzf zsh tig ag 等一些常用软件

### 3. copy sample_vimrc 至 ~/.vimrc 然后进入vim :PluginInstall即可
函数定义跳转
在project目录下执行 ctags -R

vimrc中有快捷绑定设定，可自行修改：
1. ctrl+p: fzf文件搜索
2. F2: 打开目录树
3. ctrl+n: 缓存搜索(已打开文件)
4. ctrl+k: 搜索当前光标下文本
5. ctrl+\: 调出CtrlSF 自行属性文本搜索
6. ctrl+]: 函数跳转(ctrl + t返回)

