install: install-vim install-git install-tmux

install-vim:
	rm -rf ~/.vim ~/.vimrc
	mkdir ~/.vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf

