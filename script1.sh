#!/bin/bash

# Verifica che i parametri siano stati forniti correttamente
if [ $# -ne 3 ]; then
  echo "Usage: $0 <string1> <string2> <directory>"
  exit 1
fi

# Assegna i parametri alle variabili
string1=$1
string2=$2
directory=$3

# Verifica che la directory esista e sia effettivamente una directory
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# Sostituisce ogni occorrenza di string1 con string2 per ogni file nella directory e nelle sue sottodirectory
find "$directory" -type f -exec sed -i -r "s/\Q$string1\E/$string2/g" {} +

# Mostra un messaggio di conferma
echo "Sostituzione completata con successo per la directory: $directory"

