#!/bin/bash
function rimozione(){ #creo funzione rimozione file passati come argomenti
        echo "rimuovere?"
        echo "1)si"
        echo "2)no"
        read decisione #prendo valore input
                if ! [ $decisione -eq 1 ];then #controllo se valore preso in input non è uguale ad 1
                        echo "Non hai rimosso i file $1 e $2"
                        
                else
                        rm $1 #rimuovo primo file passato come argomento
                        rm $2 #rimuovo secondo file passato come argomento
						echo "Hai rimosso i file $1 e $2"
        fi
		exit 0
}
function archiviare(){ #creo funzione per archiviare file passati come argomento 
        echo "Sto archiviando..."
		echo 
		echo
		tar -czf $1$2.tar.gz $1 $2 #per archiviare entrambi i file passati come argomento eseguo tar -czf. c=crea directori, z=compirme file con gzip, f=specifica node archivio
		echo "ho creato archivio $1$2.tar.gz"
		exit 0 
}
function appendere(){ #creo funzione appendere i file
echo "sto appendendo i file....."
echo 
echo
cat $2 >> $1 #scrivo contenuto file 1 passato come primo argomento dentro al file 2 passato come secondo argomento 
echo "ho appeso il contenuto del file $1 dentro al file $2"
exit 0
}
function stampa(){ 
echo "*************"
echo "Menu"
echo "scegli cosa fare"
echo "1) Rimuovi entrambe i file"
echo "2) archivia i file"
echo "3) appendi i file"
echo "e) uscita"
echo -en "> " #si prepara a ricevere valore in input
echo "*************"
} 
if [ $# == 2 ]; then #controllo che tutti gli argomenti passati siano uguali a 2.
	if ! [ -d $2 ]; then #controllo che i 2 argomenti passati siano file
			stampa #richiamo funzione per stampare menù
				read s #prendo valore input
				case "$s" in
				1)
				rimozione $1 $2 #richiamo funzione rimozione, passandogli 2 argomenti.
				;;
				2)
				archiviare $1 $2 #richiamo funzione archiviazione, passandogli 2 argomenti
				;;
				3)
				appendere $1 $2 #richiamo funzione appendere, passandogli 2 argomenti
				;;
				e) #se valore preso in input = e. Esco
				echo "Uscita"
				exit 0
				;;
				*)
				echo "Comando non valido"
				echo "ERROE"
				exit 1
				echo
				echo
				
		esac
	else
		echo "Gli argomenti che hai inserito devono essere esattamente 2 file di testo"
		fi
		exit 1
else
	echo "Devi inserire esattamente 2 argomenti"
	fi
	exit 1

