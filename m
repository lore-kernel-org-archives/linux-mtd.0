Received: from smtp-out4.blueyonder.co.uk ([195.188.213.7])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALiZG-0004hg-Mh
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 12:33:22 +0000
Message-ID: <005401c3ad06$ea2c80e0$6401a8c0@f87htyy9967774jjyuww2>
From: "stephen" <lcbr17306@blueyonder.co.uk>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 17 Nov 2003 12:32:50 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Hi All - new email - new problem :D
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

*WARNING - longish email*

Hi All (David etc),

I have just signed up with a new email since I am doing my Final Year at
University now,

Background (as much as I can think of/ is relevant):

I have a SBC-675 it has a back plane but works on its own with an external
PSU, I have a harddrive attached to it and an M-Sys DOC 2000 32MB,
Celeron 400 MHz , 64 MB sdram.

I usually create boot disks with:

drdflash.exe

put the M-Sys tools on the disk and then do my formatting from DOS, etc etc,

I thought that it might be a good idea this year to make a bootable DOC,
with jffs, build a nice Realtime Operating System on it, I have so far
successfully built kernel:

2.4.22 with RT-Linux real-time extensions base is redhat 9 (kernel 2.4.20-8)

The reason why I chose this kernel is it gets rid of a few 'TAINTED KERNEL'
warning messages that were present in 2.4.21 and the RTLINUX patch,

I can setup a jumper setting on the board so the DOC can sit at the
following:

DC00
D400
D800

Problems:

Basically I tried patching the kernel with the latest CVS patchin.sh etc,
but at the end of:

make modules_install

i get unresolved symbols for a fair few different modules (im not going to
post this info yet i can re-do the test later and let you know)
my compile options are the basic requirements of the DOC included JFFS, I
couldn't get the modules to insmod once i rebooted the new kernel:

insmod /lib/modules/2.4.22-rtlinux/kernel/drivers/mtd/nftl.o (unresolved
symbols)

so I built a fresh kernel :

instead of patching with MTD CVS, i used the default provided by the kernel,
patched with rtlinux 2.4.22 patch,

this ended with only a couple of unresolved symbols, after:

make modules_install

this now works, kernel probes DOC successfully (although this still worked
in the previous build)

I can mount:

mount /dev/nftla1 /mnt/test

write data to it etc as a default DOS partition,

then I started messing with JFFS via the CVS, had to use 'ERASEALL' a couple
of times and boot back into DOS with my DOS bootdisk to re-format, I read in
Karim Yaghmours book (building embedded linux systems) that unless you
compile the latest MTD CVS with your kernel will you be able to have full
use of the tools in:

/usr/src/mtd/util

I have also tried DOC42.EXB & DOC514.EXB, each time with my latest kernel
build that includes default m-sys drivers I can get access to the DOC via my
new RT-Linux kernel, but If i try to format the DOC say:

mke2fs /dev/nftla1

ntfl.o automatically loads (autoclean) and it locks up the machine while
buidling superblock, such that i can't remove the nftl module etc, I have
all my modules except nftl.o as built-ins, maybe I should recompile and have
them as modules?

I also looked for a 2.4.22 MTD patch on the net and didn't find one , is
there one?

I also tried compiling outside of the kernel tree, the redhat kernel
2.4.20-8 by default didn't have CONFIG_MODULES enabled, weird! doesnt this
mean that i cant insmod , rmmod etc?, i can certainly do all that, managed
to eventually get the tools compiled in:

/usr/src/mtd/util

but not NFTL_FORMAT,

I know i'm probably going round in circles at the moment, I 'hosed' my DOC a
couple of times, I also read a post from someone who was told by M-Sys that
his DOC was broken when experiencing the same errors I was receiving after
using the 'default MTD drivers' with 'the tools provided in the CVS', for
example :

cp jffs.image /dev/mtd0

when you try to use DFORMAT it gives error 24 or error 119 complaining that
the DOC's IPL is corrupt, until I used 'ERASEALL' could I successfully
DFORMAT the disk again. This is probably down to the fact the CVS tools
don't match my kernel driver?

also I tried using:

./erase /dev/mtd0 <offset> <erase-size>

erase-size = total-size 'divided by' your mtd device erase size ?

Basically I have until April to finish my finalyear project, I could:

a) keep DOS use loadln.exe and load the system directly into memory using a
RAMDISK (initrd etc)

or

b) install jffs and bootloader onto DOC etc (havent a clue to be honest) -
but i thinks this is the way i would prefer so im not limited to ramdisk
size.

should I drop back to an older kernel? 2.4.17 maybe?


I think i've gone as far as I can until i've read more of Karims book or
taken advice from the mtd forum :D

any advice or pointers in the right direction would be most appreciated!

kind regards

Stephen
