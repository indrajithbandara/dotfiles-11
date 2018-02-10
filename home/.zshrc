# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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

bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

eval "$(fasd --init auto)"

# Functions
function kubens() {
  if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        kubectl config set-context $(kubectl config current-context) --namespace="$1"
    else
      echo "No namespace specified"
    fi
}

# Aliases
alias perfmon="sudo nvram boot-args='serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)'"
alias perfoff="sudo nvram boot-args='$(nvram boot-args 2>/dev/null | sed -e $'s/boot-args\t//;s/serverperfmode=1//')'"
alias flushdns="sudo killall -HUP mDNSResponder"
alias npmglob="npm list -g --depth=0"
alias nv='f -t -e nvim'
alias iosim='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vladimiriacob/Documents/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/vladimiriacob/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vladimiriacob/Documents/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/vladimiriacob/Documents/google-cloud-sdk/completion.zsh.inc'; fi
