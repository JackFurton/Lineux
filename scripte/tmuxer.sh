#!/usr/bin/env bash

start_dir="$HOME"
# this checks if we passed a directory in the command to open this script
if [[ $# -eq 1 ]]; then
    dir_selected=$1
else
    dir_selected=$(find "$start_dir" -mindepth 1 -maxdepth 4 -type d \( ! -name '.*' -o -prune \) | fzf)
fi

if [[ -z $dir_selected ]]; then
    exit 0
fi

dir_selected_name=$(basename "$dir_selected" | tr . _)
file_selected=$(rg --files --hidden  $dir_selected | fzf)
file_selected_name=$(basename "$file_selected" | tr . _)


if [[ -z $file_selected ]]; then
    tmux new-session -ds $dir_selected_name -c $dir_selected
    tmux switch-client -t $dir_selected_name
    exit 0
else
tmux -c "tmux new-session -As $file_selected_name nvim \"$file_selected\""
fi

