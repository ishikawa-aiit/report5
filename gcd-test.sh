#!/bin/bash


ans="/tmp/$$-ans"
res="/tmp/$$-res"
err="/tmp/$$-err"

echo "最大公約数は2です。" > $ans
./gcd.sh 4 2 > $res
diff $ans $res || echo "error in 1" > $err

echo "最大公約数はありませんでした。" > $ans
./gcd.sh 5 3 > $res
diff $ans $res || echo "error in 2" > $err

echo "引数を2つ指定してください。" > $ans
./gcd.sh 4 > $res
diff $ans $res || echo "error in 3" > $err

echo "引数を2つ指定してください。" > $ans
./gcd.sh 4 2 8 > $res
diff $ans $res || echo "error in 4" > $err

echo "aは正の整数ではありません。" > $ans
./gcd.sh a 4 > $res
diff $ans $res || echo "error in 5" > $err

echo "bは正の整数ではありません。" > $ans
./gcd.sh 4 b > $res
diff $ans $res || echo "error in 6" > $err

echo "-1は正の整数ではありません。" > $ans
./gcd.sh -1 4 > $res
diff $ans $res || echo "error in 7" > $err

echo "-3は正の整数ではありません。" > $ans
./gcd.sh 4 -3 > $res
diff $ans $res || echo "error in 8" > $err

if [ -f $err ];
then
	cat $err
	rm /tmp/$$-*
	exit 1
fi
