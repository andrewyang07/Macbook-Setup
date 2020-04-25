# VIM Setup Guide

## Install NeoVim

## Reusing Vim Configuration in NeoVim

```bash
mkdir -p ~/.config/nvim
```

in `~/.config/nvim/init.vim`, put

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after 
let &packpath = &runtimepath
source ~/.vimrc
```

## Install [pathogen.vim](https://github.com/tpope/vim-pathogen)

```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

## Install [vim-surround](https://github.com/tpope/vim-surround)

```bash
~/.vim/bundle && \
git clone https://tpope.io/vim/surround.git
```
