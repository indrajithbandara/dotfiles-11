# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Iterm2 title bar color
# echo -e "\033]6;1;bg;red;brightness;38\a"
# echo -e "\033]6;1;bg;green;brightness;50\a"
# echo -e "\033]6;1;bg;blue;brightness;56\a"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Add homebrew to completion path
fpath=("/usr/local/bin" $fpath)

# Make 'cd dir' same as 'dir'
setopt AUTO_CD

# Pipe multiple outputs
setopt MULTIOS

export EDITOR="nvim"
export PATH="/usr/local/opt/python@2/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='
  --color=bg+:#263238
'

bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# Functions
function vssh() {
  #List all vagrant boxes available in the system including its status, and try to access the selected one via ssh
  cd $(cat ~/.vagrant.d/data/machine-index/index | jq '.machines[] | {name, vagrantfile_path, state}' | jq '.name + "," + .state  + "," + .vagrantfile_path'| sed 's/^"\(.*\)"$/\1/'| column -s, -t | sort -rk 2 | fzf | awk '{print $3}'); vagrant ssh
}

function kip() {
  local pods=$(echo $(kubectl get pods | tail -n +2 | fzf --reverse ) | awk '{print $1}')

  if [[ $pods ]]; then
    for pod in $(echo $pods);
    do; kubectl describe pods $pod ; done;
  fi
}

function kdp() {
  local pods=$(echo $(kubectl get pods | tail -n +2 | fzf --reverse ) | awk '{print $1}')

  if [[ $pods ]]; then
    for pod in $(echo $pods);
    do; kubectl delete pods $pod ; done;
  fi
}

function bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

function kubens() {
  if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        kubectl config set-context $(kubectl config current-context) --namespace="$1"
    else
        echo "No namespace specified"
    fi
}

function docker_clean() {
  docker volume rm $(docker volume ls -qf dangling=true)
  docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
  docker rm $(docker ps -qa --no-trunc --filter "status=exited")
}

# Aliases
alias perfmon="sudo nvram boot-args='serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)'"
alias perfoff="sudo nvram boot-args='$(nvram boot-args 2>/dev/null | sed -e $'s/boot-args\t//;s/serverperfmode=1//')'"
alias flushdns="sudo killall -HUP mDNSResponder"
alias npmglob="npm list -g --depth=0"
alias kgp="kubectl get pods"
alias fzfm="fzf -m"
alias fzcat="fzf --preview 'cat {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
