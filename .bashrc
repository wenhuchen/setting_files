export PATH=/usr/local/bin:$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib
export PYTHONPATH=$HOME/local/lib/python2.7/site-packages:/Users/wenhuchen/ebay_translation/machine_translation_blocks:$PYTHONPATH
export FUEL_DATA_PATH=$HOME/ebay_translation/blocks-data
alias mou='open -a $HOME/Applications/Mou.app'
alias vim=/usr/local/Cellar/vim/7.4.979/bin/vim
alias ls='ls'
alias l='ls -l -h -tr'
export PROMPT_COMMAND="myLocalHistory;set_prompt"
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
#LS_COLORS=$LS_COLORS:'di=0;31:fi=0;32' ; export LS_COLORS
if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi

function gh()
{
    grep -a "$1" .history 2>/dev/null
}

function th()
{
    tail .history 2>/dev/null
}

function myLocalHistory()
{
#    if [ `ls -ld $PWD | awk '{print $3}'` == "$USER" ] ; then
    ((date +%F.%H-%M-%S | tr -d '\n' ; history | tail -1 | sed 's:^ *[0-9]* ::g' ) | perl -ne 'print if(!/^(\S+) (ll|ls|lltr|fgt|cd|m|w|e|firefox|less|zless|th|gh|hg|file|ssh|ssp|qstat|qm|gv|acroread|corpusView\.py)\s+.*/);' >>.history) 2>/dev/null
#    fi
}
function set_prompt()
{
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    Yellow='\[\e[01;33m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    Cyan='\[\e[01;36m\]'
    Pink='\[\e[0;35m\]'
    PS1="$Yellow\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
	if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
		if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
			# special case for Aspen magic directories
			# see http://www.zetadev.com/software/aspen/
			PS1+="[`basename \`dirname \"$VIRTUAL_ENV\"\``]"
		elif [ "$VIRTUAL_ENV" != "" ]; then
			PS1+="(`basename \"$VIRTUAL_ENV\"`)"
		fi
    fi
	if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Pink\\w \\\$$Reset "
    PS1+="$Cyan"
}

