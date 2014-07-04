set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'

" Nodejs Plugins
Plugin 'moll/vim-node'
Plugin 'myhere/vim-nodejs-complete'

call vundle#end()
filetype plugin indent on

syntax on

