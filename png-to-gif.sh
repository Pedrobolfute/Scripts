#!/bin/bash

caminhoHome="/home/pedro/workspace/provocation-100-diebus"
seqInicial=1
seqFinal=71

for i in $(seq -w $seqInicial $seqFinal); do 
  if [ $seqFinal -ge 100 ];
    then
    numero=$i
    caminho=dia#$numero/assets/img
  elif [ $seqFinal -ge 10 -a $seqFinal -lt 100 ]; 
    then
    numero=0$i
    caminho=dia#$numero/assets/img
  elif [ $seqFinal -ge 0 -a $seqFinal -lt 10 ];
    then
    numero=00$i
    caminho=dia#$numero/assets/img
  else
    echo "Valor acima de 999 não suportadado."
  fi

  rm $caminhoHome/$caminho/$numero.gif
  rm $caminhoHome/$caminho/$numero.png
  mv /home/pedro/Área\ de\ trabalho/$numero.gif $caminhoHome/$caminho
  cp /home/pedro/Área\ de\ trabalho/foto.png $caminhoHome/$caminho/$numero.png

  sed -i "s/$numero.png/$numero.gif/" $caminhoHome/README.md

  cd $caminhoHome
  git add README.md
  git add $caminho/$numero.gif
  git add $caminho/$numero.png
  git commit -m "$numero - gif and shortcut icon"
done