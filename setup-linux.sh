#!/bin/bash
# Robert A. Baykov <baykovr@gmail.com>

DIRS_TO_LINK=(
  .i3
  .vim
  .nanorc
  .vimrc
  .xinitrc
  .Xresources
  .zpreztorc
  .zshrc
  .walls
  .wally
)

function usage()
{
	# echo usage of script.
	exit 0
}

function check_dependencies()
{
	pass=true
	for d in "${DEPENDENCIES[@]}"; do
	    hash "$d" &>/dev/null
    	if [ $? != 0 ]; then
    		echo "[ ! ] $d required"
    		pass=false
    	fi
	done

	if [ $pass == false ]; then
		echo '[ ! ] unmet dependencies, aborting. '
		exit -1
	fi
}
function check_dirs()
{
  # check the directories we have listed here
  # exist in the repo
  for d in "${DIRS_TO_LINK[@]}"; do
	    echo 'ayy' $d
      file "$d" &>/dev/null
    	if [ $? != 0 ]; then
    		echo "[ ! ] $d required"
      fi
	done
}
function make_symlinks()
{
  echo ""
  # ln -s .i3 ~/.
  # ln -s .vim ~/.
  # ln -s .nanorc ~/.
  # ln -s .vimrc ~/.
  # ln -s .xinitrc ~/.
  # ln -s .Xresources ~/.
  # ln -s .zpreztorc ~/.
  # ln -s .zshrc ~/.
  # ln -s .walls ~/.
}

# function argparse()
# {
# 	while getopts "h?" opt; do
# 		case "$opt" in
# 			h|\?) usage "$@" ;;
# 		esac
# 	done
# }
function main()
{
  #check_dirs
  #get the user relative path of the repo
  #check that home dir does not contain dirs
  # if there are conflicts we prompt the user y/n to overwrite everything.
  #cd to home dir and ln -s to relative path
  #check ln -s's succeded (optional)
}
main "$@"
