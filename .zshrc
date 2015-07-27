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

# JAVA
JAVA_VERSION=8

# Customizations...
#prompt cloud ">" red
prompt nicoulaj

alias l="ls -CF"
alias la="ls -A"
alias cht="~/Devel/Git/toolbox/scripts/chtitle.sh"
alias py="python"

# skynet
autoload predict-on

# Java
export JAVA_HOME=/usr/lib/jvm/java-$JAVA_VERSION-openjdk

precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt
