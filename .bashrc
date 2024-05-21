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

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

eval "$(fzf --bash)"

_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

source $HOME/.local/share/fzf-git.sh/fzf-git.sh

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
