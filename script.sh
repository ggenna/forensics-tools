IFS=$'\r\n'
for i in $(find ./DISCO/ -type f)
do
#echo $i

dire=$(dirname $i)
nuovo=$(basename $i)
#echo $dire"ciao"

nuovodire=$(echo $dire | sed 's/\//-/g' | sed 's/\ /_/g'| sed 's/\.//g')
file=$(echo $nuovo | sed 's/\//-/g' | sed 's/\ /_/g')
echo $nuovodire"-"$file
ultimo=$(echo $nuovodire"-"$file)

#echo $ultimo
mv $i ./DISCO/TUTTO/$ultimo


done

exit 0
