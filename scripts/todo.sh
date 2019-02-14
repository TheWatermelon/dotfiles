#!/bin/bash

todo_file=~/Dropbox/todo.txt

create_item() {
	if [[ "$@" == "a "* ]]; then
		cmd=$@
		line=${cmd#"a "}
		echo $line >> $todo_file
		~/bin/string_sort $todo_file $todo_file
	else
		while read -r line; do
			[[ $line != "$@" ]] && echo $line
		done < $todo_file > /tmp/todo.txt
		mv /tmp/todo.txt $todo_file
	fi

	main_menu
}

main_menu() {
		while read -r line; do
			echo $line
		done < $todo_file
		echo ""
		echo "_______________________________________"
		echo "a <item> : add item to list"
		echo "<Enter> on item : remove item from list"
}

if [ ! -f $todo_file ]; then
		touch $todo_file
fi

if [ ! -z "$@" ]; then
	create_item $@
else
	main_menu
fi

