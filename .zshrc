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
alias cht="~/Devel/Git/toolbox/scripts/chtitle.sh"
alias py="python"

# Predictions
autoload predict-on

# Java
JAVA_VERSION=8
export JAVA_HOME=/usr/lib/jvm/java-$JAVA_VERSION-openjdk

# Title bar, terminal title to user@host | pwd 
precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt

# Vim keybinds
bindkey -v
export KEYTIMEOUT=1
