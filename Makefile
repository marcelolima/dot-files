install: install-vim install-git install-autojump install-tmux

install-python-libraries:
	pip install --user flake8

install-vim:
	echo 'alias v=vim' >> ~/.bashrc
	rm -rf ~/.vim ~/.vimrc
	mkdir ~/.vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
	mkdir -p ~/.vim_local/tmp ~/.vim_local/backup
	git clone https://github.com/powerline/fonts.git /tmp/fonts
	sh /tmp/fonts/install.sh
	echo 'Set font terminal as Cousine Bold for Powerline'

install-git:
	echo 'alias g=git' >> ~/.bashrc
	rm -rf ~/.gitconfig ~/.git_template
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	mkdir -p ~/.git_template/hooks
	git config --global init.templatedir '~/.git_template'
	ln -s `pwd`/git/ctags ~/.git_template/hooks/ctags
	sudo chmod +x `pwd`/git/ctags
	ln -s `pwd`/git/post-commit ~/.git_template/hooks/post-commit
	sudo chmod +x `pwd`/git/post-commit

install-autojump:
	git clone https://github.com/wting/autojump.git /tmp/autojump
	cd /tmp/autojump/; python install.py
	echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
	source ~/.bashrc

install-tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf

