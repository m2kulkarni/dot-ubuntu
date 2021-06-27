#!/bin/bash

#tmp_file=$(mktemp)
todo_file=~/tasks/todo_$(date +%F).txt
alacritty --class="__text_scratchpad" -e $SHELL -lc "sleep 0.1 && vim + -c 'setlocal spell' ${todo_file}" 

