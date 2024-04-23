#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
export EDITOR=nvim

alias ls='ls --color=auto -la'
alias grep='grep --color=auto'
alias mv='mv -iv'
alias cp='cp -ivL'
alias rm='rm -rvI'
alias make='make -j9'
