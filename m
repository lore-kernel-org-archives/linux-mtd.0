Received: from postfix4-1.free.fr ([213.228.0.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18boEl-00086h-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 20:46:11 +0000
Received: from windows (lyon-4-a7-62-147-49-4.dial.proxad.net [62.147.49.4])
	by postfix4-1.free.fr (Postfix) with SMTP id B9377FE33
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 22:17:04 +0100 (CET)
Message-ID: <002e01c2c323$b3c99740$0200a8c0@windows>
From: "Olivier ERIBON" <olivier.eribon@free.fr>
To: <linux-mtd@lists.infradead.org>
Subject: Pb : JFFS2 & NAND with bad blocks
Date: Thu, 23 Jan 2003 22:09:21 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi!

I use the latest CVS MTD together with a 64MB NAND Flash and
JFFS2 (from 2.4.18 Montavista kernel).

I patch mtd only (without -j option in order to patch jffs2 because I have a
problem with ZLIB)

cd MTD_CVS/patches
sh patchin.sh /usr/src/linux-2.4.18_mvl30

Booting on the kernel

JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications AB.
NAND device: Manufacture ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MB 3,3V)
Creating 2 MTD partitions on "NAND 64MB 3,3V":
0x00000000-0x02000000 : "32 Mo"
0x02000000-0x04000000 : "32 Mo"

[root@172 util]# eraseall /dev/mtd0
Erasing 16 Kibyte @ 400nand_erase: attempt to erase a bad block at page
0x00000400
Erasing 16 Kibyte @ 80000 --  1 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erased 32768 Kibyte @ 0 -- 100% complete.

[root@172 util]# eraseall /dev/mtd1
Erasing 16 Kibyte @ b0c000 -- 3nand_erase: attempt to erase a bad block at
page 0x00015a20
Erasing 16 Kibyte @ b44000 -- 35 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 1340000 -- 60 % compnand_erase: attempt to erase a bad
block at page 0x0001a1e0
Erasing 16 Kibyte @ 143c000 -- 63 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erased 32768 Kibyte @ 0 -- 100% complete.

So I have 3 bad blocks:
1 at page 0x400 in mtdblock0
and 2 at pages 0x15a20 & 0x1a1e0 in mtdblock1

[root@172 util]# mount -t jffs2 /dev/mtdblock0 /mnt/jffs2
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock0,
       or too many mounted file systems

[root@172 util]# mount -t jffs2 /dev/mtdblock1 /mnt/jffs2
JFFS2: Erase block at 0x00b44000 is not formatted. It will be erased
JFFS2: Erase block at 0x0143c000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
       or too many mounted file systems

I can not mount a jffs2 on NAND partitions which contained bad blocks !!!!!!
If I use a small partition without bad block, I can use jffs2 without
problem.

What can I do to use this version of jffs2 (from 2.4.18 kernel) with
partition which
contains bad blocks ?

(fs/jffs/scan.c version = * $Id: scan.c,v 1.1 2002/12/19 08:20:44 linux Exp
$)

Do you have any ideas?

Regards

Olivier Eribon

PS :

[oeribon@serdnt25 linux-2.4.18_mvl30]$ grep MTD .config
# Memory Technology Devices (MTD)
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
# CONFIG_MTD_GEN_PROBE is not set
# CONFIG_MTD_CFI_INTELEXT is not set
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_CFI_STAA is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_MBX860 is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_REDWOOD is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PCMCIA is not set
# Self-contained MTD device drivers
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_VERIFY_WRITE=y
CONFIG_MTD_NAND_UTS=y  (hardware specific NAND driver)
CONFIG_MTD_NAND_IDS=y

[oeribon@serdnt25 linux-2.4.18_mvl30]$ grep JFFS2 .config
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
