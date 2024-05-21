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
export EDITOR='/usr/bin/nvim'

eval "$(zoxide init bash)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

eval "$(fzf --bash)"

alias vi='/usr/bin/nvim'
alias ls='/usr/bin/ls --color=auto -la'
alias grep='/usr/bin/grep --color=auto'
alias mv='/usr/bin/mv -iv'
alias cp='/usr/bin/cp -ivL'
alias rm='/usr/bin/rm -rvI'
alias make='/usr/bin/make -j9'
alias neofetch='/usr/bin/fastfetch'
alias cat='/usr/bin/bat'
alias cd='z'
alias ls='eza --icons always -l'
