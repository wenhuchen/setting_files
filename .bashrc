export PYTHONPATH=/Users/wenhuchen/local/lib/python2.7/site-packages
export PATH=/Users/wenhuchen/local/bin:$PATH
export LD_LIRARY_PATH=/Users/wenhuchen/local/lib:$LD_LIRARY_PATH
export FUEL_DATA_PATH=/Users/wenhuchen/ebay_translation/blocks-data
export PROMPT_COMMAND="myLocalHistory"
alias l='ls -l'
alias less='less -N'
alias vim='/usr/local/Cellar/vim/7.4.979/bin/vim'
PS1="\[\033[0;34m\]u@\h \[\033[0;32m\][\t]> \[\033[0;35m\]"
PS2='continue-> '
PS4='$0.$LINENO+ '
if [ -f ~/.sshpath ] ; then
  cd `cat ~/.sshpath`
  rm -f ~/.sshpath
fi
export PATH=/Users/wenhuchen/Library/Python/2.7/bin/:$PATH
function ssp()
{
  pwd >~/.sshpath
  history -a
  ssh -X $*
  history -n
  if [ -f ~/.sshbackpath ] ; then
    cd `cat ~/.sshbackpath`
    rm -f ~/.sshbackpath
    fi
}
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
