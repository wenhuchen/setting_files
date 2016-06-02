export WORKON=$HOME/.virtualenv
source $HOME/.local/bin/virtualenvwrapper.sh
source ~/.bashrc
workon tf-env
screen_cd()
{
    cd $1
    screen -X chdir $PWD
}
if [ "$TERM" == 'screen' ]; then
    alias cd=scr_cd
fi
. /Users/wenhuchen/torch/install/bin/torch-activate 
