#/bin/sh
TYPE="trending"
PHPSESSID="167393tadmcfb2kdb0qisits15"

for i in $(seq $1 $2); do
	echo $i
	wget --header "Cookie: PHPSESSID=$PHPSESSID" -O temp "http://9gag.com/$TYPE/$i"
	./parse.sh temp
done
