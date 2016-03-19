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

DEVEL=~/Devel
GIT=$DEVEL/Git
DOTFILES=$GIT/dotfiles

# zprezto
prompt minimal

# alias
alias l="ls -CF"
alias la="ls -A"
alias py="python"
alias sshman="~/Devel/Git/ssh-manager/ssh-manager.sh"

# Predictions
autoload predict-on

# Java
JAVA_VERSION=8
export JAVA_HOME=/usr/lib/jvm/java-$JAVA_VERSION-openjdk
export PATH="$PATH:$JAVA_HOME/bin"

# Title bar, terminal title to user@host | pwd 
precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt

# Warp Directory
wd() {
 	. $DOTFILES/script/wd/wd.sh
}
fpath=($DOTFILES/script/wd $fpath)

# Vim keybinds
# bindkey -v
# export KEYTIMEOUT=1
