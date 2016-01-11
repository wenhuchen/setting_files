export WORKON=$HOME/.virtualenv
source /Users/wenhuchen/Library/Python/2.7/bin/virtualenvwrapper.sh
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
