# .zshrc
#
# Robert A. Baykov <baykovr@gmail.com>

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zprezto prompt
prompt sorin

# 
DEVEL=~/Devel
GIT=$DEVEL/Git
DOTFILES=$GIT/dotfiles

# zprezto
prompt minimal

# alias
alias l="ls -CF"
alias la="ls -A"
alias py="python2"

# java
JAVA_VERSION="8"
export JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-openjdk"
export PATH="$PATH:$JAVA_HOME/bin"

#source $HOME/.aliases

# Predictions
autoload predict-on

# Title bar, terminal title to user@host | pwd 
precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt


# Vim keybinds
# bindkey -v
# export KEYTIMEOUT=1

# Functions
# warp directory
wd() {
 	. $DOTFILES/script/wd/wd.sh
}
fpath=($DOTFILES/script/wd $fpath)

gdiff()
{
	git difftool "${@:2}" -y -x "colordiff -y -W $COLUMNS" | less -R 
}

# SSHFS
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

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal
