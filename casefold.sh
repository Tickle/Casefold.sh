#!/bin/bash
find "$1" -type d | uniq >> temp.txt
mkdir result
while IFS= read -r i
do 
	mkdir "result/$i"
	sudo chattr +F "result/$i"

done < temp.txt

tree --noreport -if "$1" >> temp1.txt
tree --noreport -ifd "$1" >> temp2.txt
cat temp1.txt >> temp3.txt
cat temp2.txt >> temp3.txt
sort temp3.txt > temp9.txt
uniq -u temp9.txt > temp6.txt
mv temp6.txt result.txt

while IFS= read -r i
do
        mv "$i" "result/$i"
done < result.txt

rm temp.txt temp1.txt temp9.txt temp2.txt temp3.txt result.txt

