export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export  VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--system-site-packages'
if [ -f /usr/local/bin/virtualenvwrapper.sh ];then 
    source /usr/local/bin/virtualenvwrapper.sh 
elif [ -f $HOME/.local/bin/virtualenvwrapper.sh ];then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi
