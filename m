Received: from ns.hht.co.jp ([210.227.191.18])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwB4E-0002Pc-HI
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 02:16:03 +0000
Received: by manai.hht.co.jp (8.9.3/3.7W) with ESMTP id LAA63204
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 11:17:38 +0900 (JST)
Date: Thu, 26 Feb 2004 11:19:59 +0900
From: Yuzuru Nitta <nitta@hht.co.jp>
To: linux-mtd@lists.infradead.org
Message-Id: <20040226095217.4793.NITTA@hht.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 for ST M29W320DT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I am trying to install an JFFS2 filesystem on our original=20
board(CPU SH3).

It is fine about jffs2 filesystem on "ST M29W640DT",
but it doesn't work very well about "ST M29W320DT" ...


Here is the memory map(FlashROM).
/---------------------------------------------------------
   address               size   device          buswidth
/---------------------------------------------------------
0x00000000 - 0x01FFFFFF  32MB   ST M29W640DT x4  (32bit)
/---------------------------------------------------------
0x02000000 - 0x027FFFFF  8MB    ST M29W320DT x2  (32bit)
/---------------------------------------------------------


The boot log is:
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Kernel command line: root=3D/dev/mtdblock2 sh_mv=3DToughSoB console=3DttySC=
2,115200
ether=3D11,0x300,0,0,eth0

=2E..

JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.

=2E..

TOUGHSOB FLASH: Found 2 x16 devices at 0x1000000 in 32-bit mode
 Amd/Fujitsu Extended Query Table v0.3 at 0x0040
TOUGHSOB FLASH: JEDEC Device ID is 0xDE. Assuming broken CFI table.
TOUGHSOB FLASH: Swapping erase regions for broken CFI table.
number of CFI chips: 2
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
TOUGHSOB FLASH(LOG AREA): JEDEC Device ID is 0xCA. Assuming broken CFI tabl=
e.
TOUGHSOB FLASH(LOG AREA): Swapping erase regions for broken CFI table.
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
Creating 3 MTD partitions on "TOUGHSOB FLASH":
0x00000000-0x00020000 : "IPL"
mtd: Giving out device 0 to IPL
0x00020000-0x00120000 : "KERNEL IMAGE"
mtd: Giving out device 1 to KERNEL IMAGE
0x00120000-0x02000000 : "FS IMAGE"
mtd: Giving out device 2 to FS IMAGE
Creating 1 MTD partitions on "TOUGHSOB FLASH(LOG AREA)":
0x00000000-0x00800000 : "LOG AREA"
mtd: Giving out device 3 to LOG AREA

=2E...

ToughSoB login:
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

And, I mounted the LOG AREA ...

/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> mount -t jffs2 /dev/mtdblock3  /mnt/mtd3
root@ToughSoB:~# mount -t jffs2 /dev/mtdblock3 /mnt/mtd3/mtdblock_open
ok
jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0xe002, 0x0000002b) ha=
s invalid CRC 0xfddb6ee6=20
(calculated 0xfbb21c48)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x00=
2b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: 0x6e=
e6 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: 0x00=
01 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 0x00=
02 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0x47=
62 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 0x04=
03 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x00=
65 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0xa4=
5a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028: 0x6d=
74 instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x000082b8
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased

=2E..

JFFS2: Erase block at 0x00020000 is not formatted. It will be erased

=2E..
=2E..
=2E..

JFFS2: Erase block at 0x005e0000 is not formatted. It will be erased
Inode #6 was a directory with children - removing those too...
Inode #12 was a directory with children - removing those too...
Inode #13 was a directory with children - removing those too...
Inode #14 was a directory with children - removing those too...
Inode #45 was a directory with children - removing those too...
Inode #46 was a directory with children - removing those too...
Inode #49 was a directory with children - removing those too...
Inode #50 was a directory with children - removing those too...
Inode #51 was a directory with children - removing those too...
root@ToughSoB:~# Newly-erased block contained word 0x2003ffff at offset 0x0=
0660000
Newly-erased block contained word 0x2003ffff at offset 0x00640000
root@ToughSoB:~#
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

so, I copy some textfile to /mnt/mtd3 ,and remount /mnt/mtd3,
I get the following message ...

/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
root@ToughSoB:/mnt/mtd3# ls -l
Unknown INCOMPAT nodetype FFFF at 005613B8

=2E..

Unknown INCOMPAT nodetype FFFF at 00560558
jffs2_read_inode(): No data nodes found for ino #652
ls: sometextfile: Input/output error
total 0
root@ToughSoB:/mnt/mtd3#=20
/=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D


I just mistake making 'Mapping drivers for chip access' ?
I can't find where the plobrem is.


Thanks
Joe

---
Yuzuru (Joe) Nitta
HIJI HIGH-TECH CO.,LTD.
System Solution Group

mailto: nitta@hht.co.jp
http://www.hht.co.jp
