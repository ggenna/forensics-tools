 #!/bin/bash
 


if [ $# -ne 4 ]
then
 echo "Usage: rinominafile.sh path oldnamefile newnamefile r/m "
 echo "r= rinomina"
 echo "m= mostra"
 exit 1
fi


for i in $( find $1 -name $2 )
do

echo $i
let count=count+1

if [ $4 == 'r' ] 
then


echo $i >> "$2.txt"

#echo $i
dir=$(dirname $i)
#echo $dir
mv $i $dir/$3

fi

done

if [ $4 == 'r' ] 
then
echo $count >> "$2.txt"
echo $count 
else
echo $count 
fi


exit 0
# 
# 
# if [ ! -e "$seleziona" ]
# then
#  echo "$seleziona not found"
#  echo "Usage: $seleziona contains the string patterns to be selected"
#  exit 1
# fi
# 
# 
# 
# if [ $2 == "jf" ] || [ $2 == "fw" ]  
# then
#  
#  
# if [ $2 == "jf" ] # inizio comando joinfiles
# then 
# 
# direttorio=$(basename $1)
# oldfold=$(echo $direttorio"old")
# mkdir $oldfold
# 	cp -r $1/ $oldfold/
# 
# 
# 
# IFS=$'\r\n'
# for i in $(find $1 -type f)
# do
# #echo $i
# 
# dire=$(dirname $i)
# nuovo=$(basename $i)
# #echo $dire"ciao"
# 
# nuovodire=$(echo $dire | sed 's/\//_/g' | sed 's/\ //g'| sed 's/\.//g')
# file=$(echo $nuovo | sed 's/\//_/g' | sed 's/\ //g')
# #echo $nuovodire"-"$file
# ultimo=$(echo $nuovodire"_"$file)
# 
# #echo $ultimo
# mv $i $1/TUTTO/$ultimo
# 
# 
# done
# 
# direttoriofw=$(echo $1/TUTTO)
# 
# else # inizio comando findword
# 
# 
# direttoriofw=$1
# 
# fi # fine comando joinfiles
# 
# # area comune dei due cmandi jf e fw
# 
# mkdir stampa
# findword
# 
# else # errori comandi
# 	echo "error num arg $#"
# 	echo "Usage: $0 path_fold_files jf/fw"
# 	echo "jf: join files"
# 	echo "fw: find words"
# 	exit 1
# fi
# 
# 
# 
# exit 0
# 
