#
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

# Aliases
alias perfmon="sudo nvram boot-args='serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)'"
alias perfoff="sudo nvram boot-args='$(nvram boot-args 2>/dev/null | sed -e $'s/boot-args\t//;s/serverperfmode=1//')'"
alias lc="colorls"
alias flushdns="sudo killall -HUP mDNSResponder"