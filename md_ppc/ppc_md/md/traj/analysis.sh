#!/bin/bash
cat > trajin.in << EOF
parm ../pep.top
trajin ../md1.nc 1 last 1
#trajin ../md2.nc 1 1000 1

#reference ../../pep.pdb
#center :1-9466 mass
#image center familiar
#rms reference @CA

##rms
#rms first mass out rmsd_pro.dat :1-582@CA,C,N   time 1
#rms first mass out rmsd_lig.dat :583-592@CA,C,N   time 1
rms first mass out rmsd_com.dat :1-335&!(@H=) time 1
#rms reference mass out rms_pro.dat :1-582@CA,C,N   time 1
#rms reference mass out rms_pro1.dat :1-467@CA,C,N   time 1
#rms reference mass out rms_pro2.dat :540-794@CA,C,N   time 1
#rms reference mass out rms_lig.dat :337 time 1

###bfactor
#atomicfluct out bfactor_residue.dat    :1-677@CA,C,N byres  bfactor time 0.1
#atomicfluct out bfactor_allatom.dat    :1-710@CA,C,N byatom bfactor time 0.1
#####rmsf
#atomicfluct out rmsf_residue.dat    :1-592@CA,C,N byres
#atomicfluct out rmsf_allatom.dat    :1-710@CA,C,N byatom time 0.1

#####hbond
#hbond angle 120.000 dist 3.500 donormask :1-582 acceptormask :583-592    out nhb0.dat avgout avghb0.dat
#hbond angle 120.000 dist 3.500 donormask :583-592 acceptormask :1-582    out nhb.dat avgout avghb.dat

###distant
#distance name1 @479 :331@N out dist1.dat time 1
#distance name2 :116@OD2 :337@C6 out dist2.dat time 10
#distance name3 :249@OH :396@O1 out dist3.dat time 10

###Rg
#radgyr :1-592&!(@H=) out rg.dat mass nomax

EOF
cpptraj -i trajin.in > trajin.out

