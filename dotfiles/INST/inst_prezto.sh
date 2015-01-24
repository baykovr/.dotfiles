#!/bin/bash
# Robert A. Baykov
# Colors

# To update prezto git pull && git submodule update --init --recursive

DEPENDENCIES="git zsh"

NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
function deps()
{
        deps_ok=YES
        for dep in $DEPENDENCIES
        do
                if ! which $dep &>/dev/null;  then
                		echo -e $RED
                        echo This script requires $dep to run but it is not 
                        echo installed.
                        echo -e $NORMAL
                        deps_ok=NO
                fi
        done
        if [[ $deps_ok == NO ]]; then
                #echo Unmet dependencies... Aborting!
                exit 1
        else                return 0
        fi
}
# -----------------------------------------------------------------------------

echo -e $YELLOW
echo "installing prezto"

# https://github.com/sorin-ionescu/prezto

zsh

cd ~

echo "cloning prezto git"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "copying zsh configurations"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "setting zsh as default shell"
chsh -s /bin/zsh