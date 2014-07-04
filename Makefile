install: install-vim install-git

install-vim:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	rm ~/.vimrc
	ln -s `pwd`/vim/.vimrc ~/.vimrc

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/.gitconfig ~/.gitconfig
