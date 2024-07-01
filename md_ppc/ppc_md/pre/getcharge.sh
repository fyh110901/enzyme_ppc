#!/bin/bash
#cat peptide.out.pdb | awk '/TER/{++count}  count==2 {exit}  {print $NF}' > pro.dat
#cat peptide.out.pdb | sed -n "3154,3285p" | awk '{print $NF}'> lig.dat
#cat peptide.out.pdb | sed -n "3286,3288p" | awk '{print $NF}'> lig1.dat
#cat peptide.out.pdb | sed -n "1,3288p" | awk '{print $NF}'> com.dat
#cat peptide.out.pdb | sed -n "1,46402p" | awk '{print $NF}' > com_solv.dat
#sed -i '/TER/d'  com_solv.dat
#cat peptide.out.pdb | sed -n "1,4683p" | awk '{print $NF}'> pro.dat
#cat peptide.out.pdb | sed -n "4685,4816p" | awk '{print $NF}'> lig.dat
#cat peptide.out.pdb | sed -n "4818,4820p" | awk '{print $NF}'> lig1.dat
cat peptide.out.pdb | sed -n "1,4820p" | awk '{print $NF}'> com.dat
sed -i '/TER/d'  com.dat
#cat peptide.out.pdb | sed -n "1,46402p" | awk '{print $NF}' > com_solv.dat






