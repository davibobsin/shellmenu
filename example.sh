#!/bin/bash
# Davi Ebert Bobsin

# TODO:
# - USE OPTIONS_SIZE

# Variables
OPTIONS=("Install Setup" "Compile Reset" "Script Cameras" "Quit")
OPTIONS_SIZE=3
SELECTED=0

# Constants
_GREEN_FORE="\e[92m"
_RESET_FORE="\e[39m"
_BLINK="\e[5m"
_NOBLINK="\e[25m"
_GREEN_BACK="\e[102m"
_RESET_BACK="\e[49m"

_ARROW_UP=$'\x1b[A'
_ARROW_DOWN=$'\x1b[B'
_ARROW_LEFT=$'\x1b[D'
_ARROW_RIGHT=$'\x1b[C'

# Functions
function print_options()
{
	clear
	for I in {0..3}
	do
		if [ $I -eq $SELECTED ]
		then
			PREFIX=$_GREEN_BACK
			POSTFIX=$_RESET_BACK
		else
			PREFIX=""
			POSTFIX=""
		fi
		echo -e "${PREFIX}${OPTIONS[$I]}${POSTFIX}"
	done
}

function read_keys()
{
	read -n 3 key
	case $key in
		$_ARROW_DOWN)	if [ $SELECTED -ne $OPTIONS_SIZE ]; then SELECTED=$(($SELECTED+1));	fi;;
		$_ARROW_UP) 	if [ $SELECTED -ne 0 ]; then SELECTED=$(($SELECTED-1)); fi;;
		"") exec_option;;
	esac
}

function exec_option()
{
	case $SELECTED in
		0) echo erste ;;
		1) echo zweite ;;
		2) echo dreite ;;
		3) ;;
	esac
	exit
}

while true
do
	print_options
	read_keys
done

