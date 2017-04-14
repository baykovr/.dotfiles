#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zprezto
prompt cloud ">" red


# alias
alias vim="nvim -u NONE -u ~/.nvimrc"
alias l="ls -CF"
alias la="ls -A"
alias py="python"
alias vi="vim"
source $HOME/.aliases

# Predictions
autoload predict-on

# Java

# Title bar, terminal title to user@host | pwd 
precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt

# Vim keybinds
bindkey -v
bindkey '^R' history-incremental-search-backward
# export KEYTIMEOUT=1

wd() {
	. ~/devel/git/dotfiles/util/wd/wd.sh
}

fpath=($HOME/devel/git/dotfiles/util/wd $fpath)


# SSHFS Shortcut
sshtmux()
{
	if [ $# -eq 0 ] ; then
		echo "Hint: /sshtmux user@host [tmux arg]"
	else
		# ${@:2} adds all args except for the first one
		ssh $1 -t tmux "${@:2}" 
	fi
}
fuse()
{
	# todo check if "fuse" binary is taken since this overwrites it.
	if [ $# != 1 ] ; then
		echo "Hint: /fuse user@host"
	else
		sshfs $1:/ ~/Mount -C -p 22 -o workaround=rename
	fi
}
defuse()
{
	umount ~/Mount
}

rm-ds-store()
{
	find . -name "*DS_Store*" -depth -exec rm {} \;
}

docker-env()
{
	eval "$(docker-machine env default)"
}

# Fix for keybindings on tmux+zsh+osx.
bindkey -e
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[6~' down-line-or-search
bindkey '\e[5~' up-line-or-search
bindkey '\e[3~' delete-char
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export NVM_DIR="/Users/robert.baykov/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
