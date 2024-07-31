BEGIN{
filen=0
filenprec=0
flag=0
nomefile=0
 while(getline <"seleziona.txt" > 0)
   {
  #legge per riga
 	 for(i=1;i<=NF;i++)
 	 {
 	 vett_perole[$i]=0;
 	 parola_trovata[$i]=0;
 	# printf("%s\n",$i) >> "ecco.txt";
 	 }
  }
  



}
{ 

 #  FNR NUMERO D'ORDINE DEL FILE IN INGRESSO( =1 alla prima riga di ogni file)
	 if(FNR==1) 
	   { 
	   
	   
	     filen=filen+1;
	     if(filen==1)
	     {
	     printf("NOME_FILE\tMATCH\tPAROLA_TROVATA\tNUMERO_OCCORRENZE\n") >> "nuovofile.txt";
	     }
	     
	     if(filenprec!=filen)
	     {
	     
	     
	     print "processing "FILENAME filen"° file ... .. .";
	     filenprec=filen;
	     }
	     
	     
	     # printf("%d ",filen) >> "nuovofile.txt";
	      printf("\n") >> "nuovofile.txt";

 #OPPURE : ( FILENAME == ARGV[1] )
 

	 if(filen>1)
	{     
	 
	 flag2=0;
	 
	    for(s in  vett_perole)
	     {
	      if(vett_perole[s]>=1)
		     {
				flag=1;
				flag2=1;
			}
			
		 if(flag==1)
	     {	
	       flag=0;
	       printf("%s ",nomefile) >> "nuovofile.txt"; 
	       printf("\t") >> "nuovofile.txt";
	       printf("%s ",s) >> "nuovofile.txt"; 
	        printf("\t") >> "nuovofile.txt";
	        printf("%s ",parola_trovata[s]) >> "nuovofile.txt";         
	        printf("\t") >> "nuovofile.txt";
	        printf("%d ",vett_perole[s]) >> "nuovofile.txt"; 
	         printf("\n") >> "nuovofile.txt";
	      } 
	      
	       
	     }
	    
	      if(flag2==1)
	       {
	         
	          system("cp "nomefile " stampa/ ");
	         } 
	       
	    for(indice in vett_perole)
	     {
	        vett_perole[indice]=0;
	     }
	}
	    
} 
 

	   for(j=1;j<=NF;j++)
	   {  
	  
	    for(k in vett_perole)
	     {
	     nomefile=FILENAME;
	 
		    if(toupper($j) ~ toupper(k))
		    {
		    
	     #printf("file=%s seleziona=%s parola=%s\n",FILENAME,toupper($j),k) >> "nuovofile.txt";
		 #printf("%s\n",$0) >> "nuovofile.txt";   
		   vett_perole[k]++;
           parola_trovata[k]=$j;
			  }
		 }
	   } 
	   
	    
	    
	   
	 

}	
END{

for(s in  vett_perole)
	     {
	      if(vett_perole[s]>=1)
		     {
				flag=1;
			}
			
		 if(flag==1)
	     {	
	       flag=0;
	       printf("%s ",FILENAME) >> "nuovofile.txt"; 
	       printf("\t") >> "nuovofile.txt";
	       printf("%s ",s) >> "nuovofile.txt"; 
	        printf("\t") >> "nuovofile.txt";
	        printf("%s ",parola_trovata[s]) >> "nuovofile.txt";         
	        printf("\t") >> "nuovofile.txt";
	        printf("%d ",vett_perole[s]) >> "nuovofile.txt"; 
	         printf("\n") >> "nuovofile.txt";
	      }   
	         
	     }

 printf("\n") >> "nuovofile.txt";
		printf("FINE") >> "nuovofile.txt";
	
}
# accetta una lista di file e conta quante volte le parole contenute 
# nel primo file della
# sono presenti nei rimanenti file
