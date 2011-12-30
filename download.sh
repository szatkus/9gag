#/bin/sh
TYPE="trending"
PHPSESSID="nc459fp79o9j7ql9auf9ib8ac0"

for i in $(seq $1 $2); do
	echo $i
	wget --header "Cookie: PHPSESSID=$PHPSESSID" -O temp "http://9gag.com/$TYPE/$i"
	./parse.sh temp
done
