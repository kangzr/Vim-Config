
sudo apt-get install -y fzf python3 python3-dev tig zsh silversearcher-ag exuberant-ctags
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
