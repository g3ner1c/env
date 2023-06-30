#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# add rust binaries to path
export PATH="/home/sky/.cargo/bin:$PATH"

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set vscode as default editor
export EDITOR='code'
export VISUAL='code'

# auto cd when entering file or directory path
shopt -s autocd

# fancy terminal graphics
eval "$(oh-my-posh --init --shell bash --config '~/.omp.json')"

alias please='sudo "$BASH" -c "$(history -p !!)"'

alias pip-upgrade="pip freeze --user | cut -d'=' -f1 | xargs -n1 pip install -U"
alias pip-upgrade-venv="pip freeze | cut -d'=' -f1 | xargs -n1 pip install -U"

update() {
    yay -Syyuu
    echo "--------------------"
    pip-upgrade
    echo "--------------------"
    cargo install-update --all
    echo "--------------------"
    ncu -g
}

alias "rm"="rm -i" # not nuking my file system again accidentaly lol

alias l="ls"
alias ll="ls -a"

export $(dbus-launch) # not needed if you have systemd enabled
export LIBGL_ALWAYS_INDIRECT=1

export WSL_HOST=$(cat "/etc/resolv.conf" | grep nameserver | awk '{print $2}')
export DISPLAY="${WSL_HOST}:0"
export PULSE_SERVER="tcp:${WSL_HOST}"

export GPG_TTY=$(tty)

# git bash completion
source /usr/share/bash-completion/completions/git

# gh bash completion
eval "$(gh completion -s bash)"
