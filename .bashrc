if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    exec Hyprland
    exit
fi

add_to_path () {
    export PATH=$1:$PATH
}

add_to_path "~/.config/hypr/"

export DISPLAY=:0.0

if tmux has-session 2> /dev/null; then
    tmux attach
else
    tmux new -d -s std -n std
    tmux send-keys -t std:std "source ~/.tmux_start_bashrc" Enter "clear" Enter
    
    tmux attach
fi
. "$HOME/.cargo/env"
