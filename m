Received: from mta067b.interbusiness.it ([85.37.17.67])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXe5Y-0007yX-6m
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 07:48:49 -0400
Received: from gianlinux.eptar.com (massimo.eptar.com [192.168.143.6])
	by eptar.com (8.11.6/8.9.3) with ESMTP id j4GBSxY22919
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2005 13:28:59 +0200
From: Gianluca <gianlucarenzi@eptar.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 16 May 2005 13:29:17 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200505161329.17406.gianlucarenzi@eptar.com>
Subject: mounting a mtd or a mtblock??
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello list!
I have a little problem on using MTD flash device on my embedded-linux syst=
em.
My system is a LogicPD LH7A404-11 Sharp ARM9 with kernel 2.6.10 with=20
IntelStrataFlash 2x16bit chips addressable at 32bits.
In flash at address from 0x0000 to 0x40000 I have the bootloader (BLOB) and=
=20
from 0x40000 to 0x80000 the bootloader/kernel commandline parameters.
=46rom 0x80000 to 0x200000 I have the compressed zImage of kernel.
=46rom 0x200000 to the end all space is available for user.

I am booting from Compact Flash in read-only mode and create /var /tmp in=20
tmpfs in RAM.
I would like to have some files stored and modified, let's say 5/6 times ev=
ery=20
minute and I am worried about power loss.
So I was thinking about jffs2.

<KERNEL LOGS>
Probing "LPD7A40x-10 Flash" at physical address 0x00000000
LPD7A40x-10 Flash: Found 1 x32 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Using static partitions on "LPD7A40x-10 Flash"
Creating 4 MTD partitions on "LPD7A40x-10 Flash":
0x00000000-0x00040000 : "BLOB boot loader"
0x00040000-0x00080000 : "BLOB parameters"
0x00080000-0x00200000 : "kernel"
0x00200000-0x00800000 : "user"
</KERNEL LOGS>

Here is the /proc information:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "BLOB boot loader"
mtd1: 00040000 00020000 "BLOB parameters"
mtd2: 00180000 00020000 "kernel"
mtd3: 00600000 00020000 "user"
# cat /proc/partitions
major minor  #blocks  name

   3     0     125440 hda
   3     1     125333 hda1
  31     0        256 mtdblock0
  31     1        256 mtdblock1
  31     2       1536 mtdblock2
  31     3       6144 mtdblock3
#

What are the correct steps to mount a rw partition in this system?

I know I have to do:

# flash_eraseall -j /dev/mtd[n]
Erasing 128 Kibyte @ xxxxxx -- pp% complete. Cleanmarker written at xxxxxx

and it ends with no error at all.

As I can see 128KiB is the flash erase size. It's wrong! My system is compo=
sed=20
of 2 Chips 16bit for a total of 32bit!! So the flash erasesize must be=20
*DOUBLED*. How to correct this behaviour? Beside, the mount command:

# mount -t jffs2 /dev/mtdblock[n] /mnt/internal-flashdisk

is a piece of code unknown to me.
Why erasing mtd[n] with flash_eraseall command and mounting mtdblock[n] wit=
h=20
mount comand?
Why not erasing mtdblock[n] and mount mtdblock[n] as mount command uses onl=
y=20
BLOCK devices? Is this not completely *TRUE*??

Anyway if I try to launch those commands, here is what system gives to me:

[ a very long log...]
=2E..
Empty flash at 0x003de780 ends at 0x003de784
Empty flash at 0x003dfd3c ends at 0x003dfd40
jffs2_scan_eraseblock(): Node at 0x003e0000 {0x1985, 0x4e76, 0x7ecf000c) ha=
s=20
invalid CRC 0x59a7b0b1 (calculated 0xa3ed5d51)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0004: 0x00=
0c=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0008: 0xb0=
b1=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e000c: 0xff=
ff=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0010: 0xff=
ff=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0014: 0xff=
ff=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0018: 0xff=
ff=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e001c: 0xff=
ff=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0020: 0xff=
ff=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0024: 0xff=
ff=20
instead
=46urther such events for this erase block will not be printed
Empty flash at 0x003e102c ends at 0x003e1030
Empty flash at 0x003e22b8 ends at 0x003e22bc
[...]
Empty flash at 0x003ffcf4 ends at 0x003ffcf8
jffs2_scan_eraseblock(): Node at 0x00420000 {0x1985, 0xffff, 0xffff000c) ha=
s=20
invalid CRC 0xffffb0b1 (calculated 0x33cd93a4)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420004: 0x00=
0c=20
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00420008: 0xb0=
b1=20
instead
[...]

then it returns to prompt with this message:

Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 8, bad_blocks 0, c->nr_blocks 48
mount: /dev/mtdblock3: can't read superblock

Any Help?? Any Clue?


best regards,
=2D-=20
Gianluca Renzi
Eptar s.r.l.
Via Celletta 8/B
40026 Imola (BO) ITALY
Tel.:	+39-0542-609060
=46ax.:	+39-0542-609054
