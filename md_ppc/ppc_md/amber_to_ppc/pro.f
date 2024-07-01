      program replacecharge
      implicit none
      character(len=80)::pline
      character(len=30)::prmin,prmout,chargefile
      integer(kind=4)::i,j,k
      real(kind=8)::scalefactor
      integer(kind=4)::natm,npepatm
      real(kind=8),allocatable::newcharge(:),charge(:)
      scalefactor=sqrt(627.51*0.5291772)
c      print*,'input input prmtop file name:'
      prmin='pro.prmtop'
c      print*,'input output prmtop file name:'
      prmout='pro_ppc.prmtop'
c      print*,'input number of atoms in peptide:'
      npepatm=3151
      allocate(newcharge(npepatm))
      open(11,file='pro.dat')
      do i=1,npepatm
        read(11,*)newcharge(i)
      enddo
      open(12,file=prmin)
      open(13,file=prmout)
      do while(.True.)
        read(12,'(A80)',end=100)pline
        write(13,'(A80)')pline
        if(pline(1:14).eq.'%FLAG POINTERS')then
          read(12,'(A80)')pline
          write(13,'(A80)')pline
          read(12,'(A80)')pline
          write(13,'(A80)')pline
          read(pline(1:8),'(I8)')natm
          allocate(charge(natm))
        else if(pline(1:12).eq.'%FLAG CHARGE')then
          read(12,'(A80)')pline
          write(13,'(A80)')pline
          read(12,'(5E16.8)')charge
          forall(i=1:npepatm)
            charge(i)=newcharge(i)*scalefactor
          end forall
          write(13,'(5E16.8)')charge
        else

        endif
      end do
100   close(12)
      close(13)
      if(allocated(newcharge))deallocate(newcharge)
      if(allocated(charge))deallocate(charge)
      end


