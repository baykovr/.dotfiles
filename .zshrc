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
#prompt cloud ">" red
prompt nicoulaj

# alias
alias l="ls -CF"
alias la="ls -A"
alias py="python"

# Predictions
autoload predict-on

# Java

# Title bar, terminal title to user@host | pwd 
precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt

# Vim keybinds
# bindkey -v
# export KEYTIMEOUT=1

wd() {
	. ~/devel/git/dotfiles/util/wd/wd.sh
}
fpath=(~/devel/git/dotfiles/util/wd $fpath)
