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
JAVA_VERSION=7

# Customizations...
#prompt cloud ">" red
prompt nicoulaj

alias l="ls -CF"
alias la="ls -A"
alias cht="~/Git/chtitle/chtitle.sh"
alias bish="~/Git/bish/bish"
alias py="python"

# skynet
autoload predict-on

# Java
export JAVA_HOME=/usr/lib/jvm/java-$JAVA_VERSION-openjdk
