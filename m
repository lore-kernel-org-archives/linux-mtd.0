Received: from smtp5.cluster.oleane.net ([195.25.12.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17es5G-00084I-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 07:56:46 +0100
Received: from dg ([217.167.163.86]) by smtp5.cluster.oleane.net with SMTP id g7E6uid12711 for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 08:56:44 +0200 (CEST)
From: "dag4004" <dag4004@free.fr>
To: <linux-mtd@lists.infradead.org>
Subject: It neems that CVS isnot any morel compatible with 2.2.17 kernel ?
Date: Wed, 14 Aug 2002 08:59:43 +0200
Message-ID: <BNEJIGKFJNJLELKBCMDAIEOFCBAA.dag4004@free.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I use an ELAN-104NC PC Board.
It use JFFS/MTD with the 2.2.17 kernel.
I actually use an old CVS snap shot (15 September 2000)
It work well but it is quit slow (~ 1min to mount the
JFFS file system)

So wanted to update.
I download the last CVS today.
I download linux-2.2.17 from kernel.org

I patch the kernel with :
- inter-module-2.2.17
- mtd-patch-2.2.17-20001218-2230GMT
build zImage
All goes right

BUT at run time when i boot the kernel it got this :
(my root is 1f:02 it i a JFFS partition)

...
ELAN-104NC flash: IO:0x22-0x23 MEM:0xb0000-0xb7fff
ELAN-104NC flash: Found 1 x16 CFI device at 0x0 in 16 bit mode
...
JFFS version 1.0, (C) 1999, 2000 Axis Communications AB
ll_rw_block: Trying to read nonexistent block-device 1f:02 (1)
EXT2-fs: unable to read superblock
Invalid session number or type of track
ll_rw_block: Trying to read nonexistent block-device 1f:02 (32)
isofs_read_super: bread failed, dev=1f:02, iso_blknum=16, block=32
VFS: Mounted root (jffs filesystem) readonly.
Freeing unused kernel memory: 48k freed
...

I try to BUT

what does mean :
ll_rw_block: Trying to read nonexistent block-device 1f:02 (32)
isofs_read_super: bread failed, dev=1f:02, iso_blknum=16, block=32

Is it dangerous ?


So i tried to put last CVS mtd : i patch with
sh patchin.sh /usr/src/linux

But when i try to compile i got this :

make zImage
...
make -C mtd
make[2]: Entering directory `/usr/src/linux/drivers/mtd'
make -C chips
make[3]: Entering directory `/usr/src/linux/drivers/mtd/chips'
make all_targets
make[4]: Entering directory `/usr/src/linux/drivers/mtd/chips'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -DEXPORT_SYMTAB -c chipreg.c
chipreg.c:11: linux/spinlock.h: Aucun fichier ou répertoire de ce type
make[4]: *** [chipreg.o] Error 1
make[4]: Leaving directory `/usr/src/linux/drivers/mtd/chips'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/usr/src/linux/drivers/mtd/chips'
make[2]: *** [_subdir_chips] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_dir_drivers] Error 2

I do not undesrtant but i try this
cd /usr/src/linux/include/linux
ln -s ../asm-i386/spinlock.h
cd /usr/src/linux
make zImage

Is it a good idea ?
It seams not because few secand later i stop with that :

...
make -C mtd
make[2]: Entering directory `/usr/src/linux/drivers/mtd'
make -C chips
make[3]: Entering directory `/usr/src/linux/drivers/mtd/chips'
make all_targets
make[4]: Entering directory `/usr/src/linux/drivers/mtd/chips'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -DEXPORT_SYMTAB -c chipreg.c
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -DEXPORT_SYMTAB -c gen_probe.c
gen_probe.c: In function `genprobe_ident_chips':
gen_probe.c:100: warning: implicit declaration of function `BUG'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -c -o cfi_probe.o cfi_probe.c
cfi_probe.c:336: warning: type defaults to `int' in declaration of
`module_init'
cfi_probe.c:336: warning: parameter names (without types) in function
declaration
cfi_probe.c:336: warning: data definition has no type or storage class
cfi_probe.c:337: warning: type defaults to `int' in declaration of
`module_exit'
cfi_probe.c:337: warning: parameter names (without types) in function
declaration
cfi_probe.c:337: warning: data definition has no type or storage class
cfi_probe.c:332: warning: `cfi_probe_exit' defined but not used
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -c -o cfi_cmdset_0001.o cfi_cmdset_0001.c
cfi_cmdset_0001.c: In function `do_xxlock_oneblock':
cfi_cmdset_0001.c:1488: warning: implicit declaration of function `BUG'
cfi_cmdset_0001.c: At top level:
cfi_cmdset_0001.c:1682: warning: type defaults to `int' in declaration of
`module_init'
cfi_cmdset_0001.c:1682: warning: parameter names (without types) in function
declaration
cfi_cmdset_0001.c:1682: warning: data definition has no type or storage
class
cfi_cmdset_0001.c:1683: warning: type defaults to `int' in declaration of
`module_exit'
cfi_cmdset_0001.c:1683: warning: parameter names (without types) in function
declaration
cfi_cmdset_0001.c:1683: warning: data definition has no type or storage
class
cfi_cmdset_0001.c:1677: warning: `cfi_intelext_exit' defined but not used
rm -f chipslink.o
ld -m elf_i386  -r -o chipslink.o chipreg.o gen_probe.o cfi_probe.o
cfi_cmdset_0001.o
make[4]: Leaving directory `/usr/src/linux/drivers/mtd/chips'
make[3]: Leaving directory `/usr/src/linux/drivers/mtd/chips'
make -C maps
make[3]: Entering directory `/usr/src/linux/drivers/mtd/maps'
make all_targets
make[4]: Entering directory `/usr/src/linux/drivers/mtd/maps'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -c -o elan-104nc.o elan-104nc.c
elan-104nc.c:271: warning: type defaults to `int' in declaration of
`module_init'
elan-104nc.c:271: warning: parameter names (without types) in function
declaration
elan-104nc.c:271: warning: data definition has no type or storage class
elan-104nc.c:272: warning: type defaults to `int' in declaration of
`module_exit'
elan-104nc.c:272: warning: parameter names (without types) in function
declaration
elan-104nc.c:272: warning: data definition has no type or storage class
rm -f mapslink.o
ld -m elf_i386  -r -o mapslink.o  elan-104nc.o
make[4]: Leaving directory `/usr/src/linux/drivers/mtd/maps'
make[3]: Leaving directory `/usr/src/linux/drivers/mtd/maps'
make -C devices
make[3]: Entering directory `/usr/src/linux/drivers/mtd/devices'
make all_targets
make[4]: Entering directory `/usr/src/linux/drivers/mtd/devices'
rm -f devlink.o
ar rcs devlink.o
make[4]: Leaving directory `/usr/src/linux/drivers/mtd/devices'
make[3]: Leaving directory `/usr/src/linux/drivers/mtd/devices'
make -C nand
make[3]: Entering directory `/usr/src/linux/drivers/mtd/nand'
make all_targets
make[4]: Entering directory `/usr/src/linux/drivers/mtd/nand'
rm -f nandlink.o
ar rcs nandlink.o
make[4]: Leaving directory `/usr/src/linux/drivers/mtd/nand'
make[3]: Leaving directory `/usr/src/linux/drivers/mtd/nand'
make all_targets
make[3]: Entering directory `/usr/src/linux/drivers/mtd'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -DEXPORT_SYMTAB -c mtdcore.c
mtdcore.c: In function `init_mtd':
mtdcore.c:332: warning: implicit declaration of function `init_mtd_devices'
mtdcore.c: At top level:
mtdcore.c:360: warning: type defaults to `int' in declaration of
`module_init'
mtdcore.c:360: warning: parameter names (without types) in function
declaration
mtdcore.c:360: warning: data definition has no type or storage class
mtdcore.c:361: warning: type defaults to `int' in declaration of
`module_exit'
mtdcore.c:361: warning: parameter names (without types) in function
declaration
mtdcore.c:361: warning: data definition has no type or storage class
mtdcore.c:342: warning: `cleanup_mtd' defined but not used
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -DEXPORT_SYMTAB -c mtdpart.c
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -c -o mtdchar-compat.o mtdchar-compat.c
mtdchar-compat.c:589: warning: type defaults to `int' in declaration of
`module_init'
mtdchar-compat.c:589: warning: parameter names (without types) in function
declaration
mtdchar-compat.c:589: warning: data definition has no type or storage class
mtdchar-compat.c:590: warning: type defaults to `int' in declaration of
`module_exit'
mtdchar-compat.c:590: warning: parameter names (without types) in function
declaration
mtdchar-compat.c:590: warning: data definition has no type or storage class
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomi
t-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m386 -DCPU=
386   -c -o mtdblock.o mtdblock.c
mtdblock.c:470: warning: type defaults to `int' in declaration of
`DECLARE_MUTEX_LOCKED'
mtdblock.c:470: warning: parameter names (without types) in function
declaration
mtdblock.c: In function `mtdblock_thread':
mtdblock.c:485: warning: implicit declaration of function `daemonize'
mtdblock.c:491: `QUEUE_EMPTY' undeclared (first use in this function)
mtdblock.c:491: (Each undeclared identifier is reported only once
mtdblock.c:491: for each function it appears in.)
mtdblock.c:503: `thread_sem' undeclared (first use in this function)
mtdblock.c: In function `cleanup_mtdblock':
mtdblock.c:654: `thread_sem' undeclared (first use in this function)
mtdblock.c:662: array subscript is not an integer
mtdblock.c: At top level:
mtdblock.c:667: warning: type defaults to `int' in declaration of
`module_init'
mtdblock.c:667: warning: parameter names (without types) in function
declaration
mtdblock.c:667: warning: data definition has no type or storage class
mtdblock.c:668: warning: type defaults to `int' in declaration of
`module_exit'
mtdblock.c:668: warning: parameter names (without types) in function
declaration
mtdblock.c:668: warning: data definition has no type or storage class
mtdblock.c:51: warning: `mtdblock_lock' defined but not used
mtdblock.c:470: warning: `DECLARE_MUTEX_LOCKED' declared `static' but never
defined
mtdblock.c:651: warning: `cleanup_mtdblock' defined but not used
make[3]: *** [mtdblock.o] Error 1
make[3]: Leaving directory `/usr/src/linux/drivers/mtd'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_dir_drivers] Error 2


Does some one understand what append ?
I am curous to know the truth.

Thanks

Damien
