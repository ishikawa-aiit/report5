#!/bin/bash

if [ $# != 2 ];then
	echo "引数を2つ指定してください。"
	exit 1
fi

for arg in $@;
do	
	if expr "$arg" : "[^0-9]*" > /dev/null
	then
		echo "${arg}は正の整数ではありません。"
		exit 1
	fi
done

num1=$1
num2=$2

if [[ $num2 -gt $num1 ]];then
	pre=$num1
	num1=$num2
	num2=$pre
fi

while :
do
	var=$(( $num1 % $num2 ))
	if [ $var = 0 ];then
		echo "最大公約数は${num2}です。"
		break
	fi

	if [ $var = 1 ];then
		echo "最大公約数はありませんでした。"
		break
	fi
	
	num1=$num2
	num2=$var
done
