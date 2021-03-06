install: install-python-libraries install-pyenv install-vim install-git install-autojump install-tmux

install-python-libraries:
	pip install --user flake8 ipython[notebook]

install-pyenv:
	git clone https://github.com/yyuu/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$$HOME/.pyenv"' >> ~/.bashrc
	echo 'export PATH="$$PYENV_ROOT/bin:$$PATH"' >> ~/.bashrc
	echo 'eval "$$(pyenv init -)"' >> ~/.bashrc
	echo "Install dep from: https://github.com/yyuu/pyenv/wiki/Common-build-problems'"
	~/.pyenv/bin/pyenv init -
	~/.pyenv/bin/pyenv install 3.5.2

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
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	rm -rf ~/.gitconfig ~/.git_template
	git config --global init.templatedir '~/.git_template'
	mkdir -p ~/.git_template/hooks
	ln -s `pwd`/git/ctags ~/.git_template/hooks/ctags
	chmod +x `pwd`/git/ctags
	ln -s `pwd`/git/post-commit ~/.git_template/hooks/post-commit
	ln -s `pwd`/git/post-checkout ~/.git_template/hooks/post-checkout
	ln -s `pwd`/git/post-merge ~/.git_template/hooks/post-merge
	chmod +x `pwd`/git/post-commit
	chmod +x `pwd`/git/post-checkout
	chmod +x `pwd`/git/post-commit

install-autojump:
	git clone https://github.com/wting/autojump.git /tmp/autojump
	cd /tmp/autojump/; python install.py
	echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc
	source ~/.bashrc

install-tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf
