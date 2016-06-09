# Path to your oh-my-zsh installation.
echo "Welcome to wenhu chen's macbook, this terminal is using zsh"
export ZSH=/Users/wenhuchen/.oh-my-zsh
precmd() {eval "$PROMPT_COMMAND"}
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
autoload -U colors && colors
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
    ((date +%F.%H-%M-%S | tr -d '\n' ; history | tail -1 | sed 's:^ *[0-9]* ::g' ) | perl -ne 'print if(!/^(\S+) (ll|ls|lltr|fgt|cd|m|w|e|firefox|less|zless|th|gh|hg|file|ssh|ssp|qstat|qm|gv|acroread|corpusView\.py)\s+.*/);' >>.history) 2>/dev/null
}

function get_PS1()
{
	PS1='%{$fg[yellow]%}$? ' 
	#if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
	#    if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
	#       PS1+='%{$fg[blue]%}[`basename \`dirname \"$VIRTUAL_ENV\"\``] '
	#    elif [ "$VIRTUAL_ENV" != "" ]; then
	#        PS1+='%{$fg[blue]%}(`basename \"$VIRTUAL_ENV\"`) '
	#    fi
	#fi
	PS1+='%{$fg[green]%}%n@%m '
	PS1+='%{$fg[red]%}`pwd`%# '
	PS1+='%{$fg[cyan]%}'
	echo "$PS1"
}

PS1=$(get_PS1)
export PROMPT_COMMAND='$(myLocalHistory)'
export SCALA_HOME=$HOME/scala-2.11.8
export PATH=$HOME/local/bin:$HOME/.local/bin:$SCALA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$HOME/local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$PYTHONPATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home
export CLICOLOR=1
alias l='ls -lG -h -tr'
