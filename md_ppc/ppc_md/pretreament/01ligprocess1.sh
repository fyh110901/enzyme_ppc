#!/bin/bash



antechamber -i ligand1.pdb -fi pdb -o ligand1.mol2 -fo mol2 -rn MOL -c bcc -nc 0 -m 1 -pf y
echo "done 1"
parmchk2 -i ligand1.mol2 -f mol2 -o ligand1.frcmod
echo "done 2"
###ligand1
#antechamber -i ligand1.pdb -fi pdb -o ligand1.mol2 -fo mol2 -rn MOL -c bcc -nc 0 -m 1 -pf y
#parmchk2 -i ligand1.mol2 -f mol2 -o ligand1.frcmod
###ligand2
#antechamber -i ligand2.pdb -fi pdb -o ligand2.mol2 -fo mol2 -rn MOL -c bcc -nc -2 -m 1 -pf y
#parmchk2 -i ligand2.mol2 -f mol2 -o ligand2.frcmod


