#!/bin/bash
sed  -e 's/[\r\n]//g'  data.csv > out.0 #Elimina Retorno
sed -r 's|([0-9]{2})/([0-9]{2})/([0-9]{2})|20\3-\2-\1|g' out.0 > out.1 #Organiza Formato Fecha
sed -r 's%,%.%g' out.1 > out.2 #Separador decimal por.
sed -r 's%;N%;\\N%g' out.2 > out.3 #Cambia Campos Nulos por \N
sed -r 's%;;%;\\N;%g' out.3 > out.4  #Cambia Campos Vacios por \N
sed -r 's%;$%;\\N%g' out.4 > out.5  #Cambia los finales vacios por \N
sed -r 's%;%,%g' out.5 > out.6   #Cambia ; por ,
sed 's/,/./4' out.6 > out.7     #Separador decimal por.
tr '[:lower:]' '[:upper:]' < out.7 > out.8   #Mayusculas
grep -v \\N  out.8 > resultado.csv  #Elimina Nulos
rm out.*     #elimina intermedios     