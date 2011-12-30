#!/bin/sh
SQL_CLIENT="sqlite3"
DATABASE="9g.db"

list=$(grep -o "gagId=[^\ ]*" $1)
for i in $list; do
	id=$(echo $i | tr -d "\"" | sed s/gagId=//)
	data=$(grep "photo/$id" $1 | tr -d "\t" | sed "s/<img src=//g" | sed "s/alt=/,/g" | sed "s/\/>//g")
	$SQL_CLIENT $DATABASE "INSERT INTO '9gag' VALUES ($id, 'False', $data)"
done
