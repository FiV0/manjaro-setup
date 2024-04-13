#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1="\e\[\033[01;32m\][\u@\h \W]\$ \e[m"
PS1='[\u@\h \W]\$ '

# fzf
source /usr/share//fzf/key-bindings.bash
source /usr/share//fzf/completion.bash
# fd + fzf
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd -H -t d . $HOME"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# git completions
source /usr/share/git/completion/git-completion.bash

alias rm="mv -t ~/.local/share/Trash/files"
alias vi="vim"

# flush history after every command
export PROMPT_COMMAND='history -a; printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

HISTSIZE=20000
HISTFILESIZE=20000

# local executables
export PATH="$HOME/.local/bin:$PATH"

# history
alias bb='rlwrap --history-filename=$HOME/.${USER}_command_history bb'
