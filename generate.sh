#!/bin/sh
SQL_CLIENT="sqlite3"
DATABASE="9g.db"

results=$($SQL_CLIENT $DATABASE "SELECT Id, Url, Title from '9gag' WHERE Checked='False' LIMIT $1")

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<?xml-stylesheet type="text/xsl" href="9gag.xsl"?>'
echo '<gags>'
IFS='
'
for gag in $results; do
	echo '<gag>'
	IFS='|'
	col=0
	id=0
	title=""
	url=""
	for data in $gag; do
		case $col in
			0)id=$data;;
			1)url=$data;;
			2)title=$data;;
			*)title="$title|$data"
		esac
		col=$(expr $col + 1)
	done
	$SQL_CLIENT $DATABASE "UPDATE '9gag' SET Checked='True' WHERE Id=$id"
	title=$(echo $title|sed "s/& /and /g")
	echo "<title>$title</title>"
	echo "<url>$url</url>"
	echo "<id>$id</id>"
	echo '</gag>'
done
echo '</gags>'
