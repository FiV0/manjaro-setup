set fish_greeting

fish_vi_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR vim
set -x BROWSER firefox

function rm
    mv -t ~/.local/share/Trash/files $argv
end

function vi
    vim $argv
end

fzf_configure_bindings --history=\cr --directory=\cf --variables=\cv --git_status=\cs --processes=\cp --git_log=\cg

alias cc='claude --dangerously-skip-permissions'
alias gg='gemini --yolo'

# ruby
set -gx PATH $HOME/.local/share/gem/ruby/3.4.0/bin $PATH

# Android SDK
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $PATH
