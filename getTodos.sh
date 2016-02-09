#!/bin/bash
DATA=$(wget -O - -q -t 1 http://site.lampd.com.br/todos.php)
IFS=\" read __ KEY __ MESSAGE __ <<< "$DATA"
while IFS=\" read -ra LINE; do
	printf -v TITLE '%b' "${LINE[3]}"
	printf -v DESCRIPTION '%b' "${LINE[7]}"
	printf -v COMMAND '%b' "${LINE[11]}"
done <<< "$DATA"
echo "$TITLE"
echo "$DESCRIPTION"
echo "- $COMMAND"