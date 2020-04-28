# VIM Setup Guide

## set $VIMCONFIG and $VIMDATA variables

Add below setting to your `~/.zshrc` file

```bash
export VIMCONFIG=~/.vim
export VIMDATA=~/.vim
```

## Install [NeoVim](https://neovim.io/)

## Reusing Vim Configuration in NeoVim

Create configuration diretory for nvim

```bash
mkdir -p ~/.config/nvim
```

in `~/.config/nvim/init.vim`, put below contents in

```bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after 
let &packpath = &runtimepath
source ~/.vimrc
```

## Create NeoVim alias

Add following to your `~/.zshrc` file

```bash
# Use Neovim as "preferred editor"
export VISUAL=nvim

# Use Neovim instead of Vim or Vi
alias vim=nvim
alias vi=nvim
```

## Install Plugin Manager - minpac

Install minpac plugin

```bash
mkdir -p $VIMCONFIG/pack/minpac/opt

cd $VIMCONFIG/pack/minpac/opt
git clone https://github.com/k-takata/minpac.git
```

Add following to `~/.vimrc` to load and initialize the plugin (`myvimrc` should already has it)

```bash
packadd minpac 
call minpac#init()
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
