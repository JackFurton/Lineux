#!/usr/bin/env bash

start_dir="$HOME"
# this checks if we passed a directory in the command to open this script
if [[ $# -eq 1 ]]; then
    dir_selected=$1
    dir_selected_name=$(basename "$dir_selected" | tr . _)
    tmux new-session -ds $dir_selected_name -c $dir_selected
    tmux switch-client -t $dir_selected_name
    exit 0

else
    dir_selected=$(find "$start_dir" -mindepth 1 -maxdepth 4 -type d \( ! -name '.*' -o -prune \) | fzf)
fi

if [[ -z $dir_selected ]]; then
    exit 0
fi

dir_selected_name=$(basename "$dir_selected" | tr . _)

while :
do
echo "Press 'q' to exit"
read -p "Search files in folder? [y/n]  " answer
  case $answer in
    y)
      echo "search files in folder"
      file_selected=$(rg --files --hidden  $dir_selected | fzf)
      file_selected_name=$(basename "$file_selected" | tr . _)
      if [[ -z $file_selected ]]; then
          exit 0
      else
      tmux -c "tmux new-session -As $file_selected_name nvim \"$file_selected\""
      exit 0
      fi
      ;;

    n)
      read -p "Open folder in split or new session?  [sp/s]  " answer2

    case $answer2 in
      sp)
        tmux split-window -c $dir_selected
        exit 0
        ;;

      s)
        tmux new-session -ds $dir_selected_name -c $dir_selected
        tmux switch-client -t $dir_selected_name
        exit 0
        ;;
    esac
      ;;

    q)
      echo "quiting"
      exit 0
      ;;

    *)
      echo "quiting"
      exit 0
      ;;
  esac

done

