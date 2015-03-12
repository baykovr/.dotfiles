#!/bin/bash
# insprezto : a prezto installation script
# Robert Baykov <baykvor@gmail.com> 2.19.15
# Acknowledgments
#     Sorin Ionescu <sorin.ionescu@gmail.com>
#     https://github.com/sorin-ionescu/prezto

# To update prezto git pull && git submodule update --init --recursive


function deps()
{
		deps="git zsh"
        deps_ok=YES
        for dep in $DEPENDENCIES
        do
                if ! which $dep &>/dev/null;  then
                        echo "This script requires $dep to run but it is not"
                        echo installed.
                        deps_ok=NO
                fi
        done
        if [[ $deps_ok == NO ]]; then
                #echo Unmet dependencies... Aborting!
                exit 1
        else                return 0
        fi
}

echo -e $YELLOW
echo "installing prezto"

# https://github.com/sorin-ionescu/prezto

#zsh

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
