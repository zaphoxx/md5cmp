#!/bin/bash

usage() {
	echo "----------------------------------------------------------"
	echo "md5cmp - compares provided md5hash with calculated md5hash"
	echo "[usage] ./md5cmp FILE MD5HASH"
	echo "----------------------------------------------------------"
}

usage

if [ $1 ]; then
	echo "FILE=$1"
else
	exit 1
fi
if [ $2 ]; then
	echo "MD5=$2"
else
	exit 1 
fi

file=$1
md5=$2 

md5calc=$(md5sum $file | sed -e "s/^\([a-z0-9]\{32\}\)\{1\}.*/\1/")
echo "[+] calculating hash ..."
echo ""
echo "[+] calc: $md5calc" == "orig: $md5 ?"

if [ $md5 == $md5calc ]; then
	echo "[+] Match! File integrity ok!"
else
	echo "[-] Hashes dont match! Potential malicious file!"
fi
