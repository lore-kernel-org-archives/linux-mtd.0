From: jebc@c4solutions.net (Jeb Campbell)
Date: Sat, 15 Feb 2003 05:15:33 -0500
Subject: Grub 0.93 grub-2003-01-08-doc.patch DOC2000 trouble
Message-ID: <3E4E1345.9020806@c4solutions.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Problem with MBR -- steps to get there:

1)patch grub-0.93 with grub-2003-01-08-doc.patch:
cd grub-0.93
patch -p1 < ../grub-2003-01-08-doc.patch
export WANT_AUTOMAKE_1_5=1 WANT_AUTOCONF_2_5=1
aclocal && automake --add-missing && autoconf
./configure --exec-prefix=/ \
         --disable-auto-linux-mem-opt \
         --enable-diskonchip-2000 \
         --enable-diskonchip-ctrlbypass \
         --enable-rtl8139

This patches and compiles fine and grub_firmware is 120K

2) boot dos
use v4.2 DUPDATE /win:d600 /s:DOC42.EXB and power cycle

3) boot dos to format 48M DOC2000 and load grub_firmware
use v5.1 DFORMAT /win:d600 /BDKF0:grub_fir /BDKL0:160000
formats ok and then power cylcle

4) use grub to boot linux off hard drive (2.4.19 with cvs mtd nftlcore 
1.87 and nftlmount 1.31)
fdisk -l /dev/nftla
shows the fat16 partion
mke2fs -m 0 /dev/nftla1 (no root reserve)
and it mounts fine

But when I unplug the hd, grub fails on invalid MBR on the DOC2000-48M
I can netboot and get a kernel from tftp and boot the chip fine.

But the strangest thing is grub will get the menu.lst from the DOC on 
the first partition!  But then error out when trying to boot/load the 
kernel.

Any help would be appreciated.  I don't know if I need to take out some 
of the error checking for the MBR?  Anyway I would like to use grub-0.93 
because the realtek netboot driver works (and 0.92 will not).

Thanks again,

Jeb Campbell
