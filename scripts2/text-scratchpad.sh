#!/bin/bash

#tmp_file=$(mktemp)
todo_file=~/tasks/task.txt
alacritty --class="__text_scratchpad" -e $SHELL -lc "sleep 0.1 && vim + -c 'setlocal spell' ${todo_file}" 

