#!/bin/bash


#. /opt/ohpc/pub/apps/amber/amber20/amber.sh

#cd $PBS_O_WORKDIR
### pdb4amber删除所有氨基酸的H
pdb4amber -i ligand0.pdb -o ligand_noH.pdb -y --dry
### 使用reduce添加H原子
reduce ligand_noH.pdb > ligand_H.pdb
### 使用pdb4amber对加氢后的pdb文件进行规范化处理
pdb4amber -i ligand_H.pdb -o ligand.pdb
### tleap补足
#cat > leap.in << EOF
#source oldff/leaprc.ff14SB
#p = loadpdb protein.pdb
#savepdb p Protein.pdb
#quit

#EOF

#tleap -sf leap.in >leap.log

