findword ()
{
echo "converting files to .txt"
textutil -convert txt $direttoriofw/*.doc
textutil -convert txt $direttoriofw/*.docx

ls DISCO/TUTTO/*.doc* | wc -l
echo "files converted"

awk -f filtro.awk  $(find $direttoriofw -name "*.txt")
mv nuovofile.txt elenco.xls
echo "file elenco.xls created"

}

filtro="./filtro.awk"
seleziona="./seleziona.txt"
somma=0
numero=1


if [ ! -e "$filtro" ]
then
 echo "$filtro not found"
 exit 1
fi

if [ ! -e "$seleziona" ]
then
 echo "$seleziona not found"
 echo "Usage: $seleziona contains the string patterns to be selected"
 exit 1
fi



if [ $2 == "jf" ] || [ $2 == "fw" ]  
then
 
 
if [ $2 == "jf" ] # inizio comando joinfiles
then 

direttorio=$(basename $1)
oldfold=$(echo $direttorio"old")
mkdir $oldfold
	cp -r $1/ $oldfold/



IFS=$'\r\n'
for i in $(find $1 -type f)
do
#echo $i

dire=$(dirname $i)
nuovo=$(basename $i)
#echo $dire"ciao"

nuovodire=$(echo $dire | sed 's/\//_/g' | sed 's/\ //g'| sed 's/\.//g')
file=$(echo $nuovo | sed 's/\//_/g' | sed 's/\ //g')
#echo $nuovodire"-"$file
ultimo=$(echo $nuovodire"_"$file)

#echo $ultimo
mv $i $1/TUTTO/$ultimo


done

direttoriofw=$(echo $1/TUTTO)

else # inizio comando findword


direttoriofw=$1

fi # fine comando joinfiles

# area comune dei due cmandi jf e fw

mkdir stampa
findword

else # errori comandi
	echo "error num arg $#"
	echo "Usage: $0 path_fold_files jf/fw"
	echo "jf: join files"
	echo "fw: find words"
	exit 1
fi



exit 0

