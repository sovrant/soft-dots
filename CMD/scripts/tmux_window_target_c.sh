#!/bin/zsh

re='^[0-9]+$'

while true; do
  read -n 1 -s -t 0.1 input

  if [[ $input =~ $re ]]; then
    tmux killw -t $input
    break
  elif [[ $input == 'q' ]]; then
    echo "canceled"
    break
  fi

done
