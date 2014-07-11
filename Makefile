install: install-vim install-git install-tmux

install-vim:
	rm -rf ~/.vim ~/.vimrc
	mkdir ~/.vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
	mkdir -p ~/.vim_local/tmp ~/.vim_local/backup

install-git:
	rm -rf ~/.gitconfig ~/.git_template
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	mkdir -p ~/.git_template/hooks
	git config --global init.templatedir '~/.git_template'
	ln -s `pwd`/git/ctags ~/.git_template/hooks/ctags
	sudo chmod +x `pwd`/git/ctags
	ln -s `pwd`/git/post-commit ~/.git_template/hooks/post-commit
	sudo chmod +x `pwd`/git/post-commit

install-tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf

