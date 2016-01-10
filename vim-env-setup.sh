#!/bin/bash
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin &&                                     

if [ -d ~/.vim/ftplugin ]; then
  wget -O ~/.vim/ftplugin/python_editing.vim \
    http://www.vim.org/scripts/download_script.php?src_id=5492
else 
  echo "Directory ~/.vim/ftplugin not found!"
fi
  

if [ -d ~/.vim/autoload ]; then
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
  echo "Directory ~/.vim/autoload not found!"
fi

if [ -d ~/.vim/bundle ]; then
  cd ~/.vim/bundle &&
  git clone https://github.com/scrooloose/nerdtree.git &&
  git clone https://github.com/jistr/vim-nerdtree-tabs.git &&
  git clone https://github.com/Lokaltog/vim-powerline.git &&
  git clone https://github.com/kien/ctrlp.vim.git &&
  git clone --recursive https://github.com/davidhalter/jedi-vim.git &&
  git clone https://github.com/python-rope/ropevim.git &&
  #git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git &&
  git clone git://github.com/tpope/vim-fugitive.git &&
  vim -u NONE -c "helptags vim-fugitive/doc" -c q &&
  git clone git://github.com/klen/python-mode.git 
else
  echo "Directory ~/.vim/bundle not found!"
fi

sudo pip install jedi ipdb rope ropemode ropevim

