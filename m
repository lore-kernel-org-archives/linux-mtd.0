Received: from firewall.cpi.fr ([194.206.204.100] helo=firewall)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zWTF-0002jW-0W
	for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2003 08:11:25 +0100
Message-ID: <AF34F8F089D16B4FABE02B5F375228E0022C@serveur21.SYNCHRO2>
From: Yves CLOUSIER <yves.clousier@synchronic.fr>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	"'uclinux-dev@uclinux.org'" <uclinux-dev@uclinux.org>
Date: Wed, 17 Sep 2003 09:07:00 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C37CEA.4A19DCCA"
Subject: Problem using DOC with mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C37CEA.4A19DCCA
Content-Type: text/plain;
	charset="iso-8859-1"

Hi all, 

I have 5272 plateform with the 20030305-uclinux-dist. 
In this plateform I have a disk-on-chip millenium module MD2802-D08. The DOC
is map at 0xE0000000.

But during booting, I have the message :
Possible DiskOnChip with unknown ChipID 00 found at 0xe0000000
No recognised DiskOnChip devices found

In the Doc_Check() fonction in probe.c I make a memory dump of the DOC (from
0xE0000000 to 0xE0002000), see the attach file.
I think that the acces of the DOC is correct because I see the DOC bios
singature at 0xE0000000. But I don't understand why the mtd doesn't
recognised the DOC. So if you have an idea ......


Thanks.





I configure the mtd like this :

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
# CONFIG_MTD_GEN_PROBE is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
CONFIG_MTD_DOC2000=y
# CONFIG_MTD_DOC2001 is not set
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADVANCED=y
CONFIG_MTD_DOCPROBE_ADDRESS=e0000000
# CONFIG_MTD_DOCPROBE_HIGH is not set
# CONFIG_MTD_DOCPROBE_55AA is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set



 <<dump.txt>> 

------_=_NextPart_000_01C37CEA.4A19DCCA
Content-Type: text/plain;
	name="dump.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="dump.txt"

Linux version 2.4.20-uc1 (root@linux_yc) (gcc version 2.95.3 20010315 =
(release)(ColdFire patches - 20010318 from =
http://fiddes.net/coldfire/)(-msep-data patches)) #85 mar sep 16 =
17:45:20 CEST 2003
=0D
uClinux/COLDFIRE(m5272)
COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
On node 0 totalpages: 4096
zone(0): 0 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
Kernel command line: CONSOLE=3D/dev/ttyS0,19200
Calibrating delay loop... 41.36 BogoMIPS
Memory available: 13892k/16384k RAM, 0k/0k ROM (822k kernel code, 220k =
data)
kmem_create: Forcing size word alignment - vm_area_struct
kmem_create: Forcing size word alignment - mm_struct
kmem_create: Forcing size word alignment - filp
Dentry cache hash table entries: 2048 (order: 2, 16384 bytes)
Inode cache hash table entries: 1024 (order: 1, 8192 bytes)
kmem_create: Forcing size word alignment - inode_cache
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
kmem_create: Forcing size word alignment - bdev_cache
kmem_create: Forcing size word alignment - cdev_cache
kmem_create: Forcing size word alignment - kiobuf
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
kmem_create: Forcing size word alignment - sock
Initializing RT netlink socket
Starting kswapd
kmem_create: Forcing size word alignment - file_lock_cache
kmem_create: Forcing size word alignment - nfs_read_data
kmem_create: Forcing size word alignment - nfs_write_data
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis =
Communications AB.
Serial driver version 5.05c (2001-07-08) with SHARE_IRQ enabled
serial: Resetting CDB4 UART
ColdFire internal UART serial driver version 1.00
ttyS0 at 0x10000100 (irq =3D 73) is a builtin ColdFire UART
ttyS1 at 0x10000140 (irq =3D 74) is a builtin ColdFire UART
DS1302: Copyright (C) 2001, Greg Ungerer (gerg@snapgear.com)
kmem_create: Forcing size word alignment - blkdev_requests
fec.c: Probe number 0 with 0x0000
eth0: FEC ENET Version 0.2, 00:d0:cf:00:00:72
fec: PHY @ 0x1f, ID 0x0022561b -- AM79C874
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
CSLIP: code copyright 1989 Regents of the University of California.
Blkmem copyright 1998,1999 D. Jeff Dionne
Blkmem copyright 1998 Kenneth Albanowski
Blkmem 1 disk images:
0: 124CA0-23F09F [VIRTUAL 124CA0-23F09F] (RO)
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Using configured DiskOnChip probe address 0xe0000000
Doc dump at e0000000 : 55 55 aa aa 10 10 eb eb
Doc dump at e0000008 : 3c 3c 00 00 00 00 28 28
Doc dump at e0000010 : 43 43 29 29 4d 4d 2d 2d
Doc dump at e0000018 : 53 53 79 79 73 73 74 74
Doc dump at e0000020 : 65 65 6d 6d 73 73 31 31
Doc dump at e0000028 : 39 39 39 39 38 38 00 00
Doc dump at e0000030 : 00 00 00 00 21 21 00 00
Doc dump at e0000038 : 00 00 04 04 00 00 1c 1c
Doc dump at e0000040 : 55 55 24 24 50 50 6e 6e
Doc dump at e0000048 : 50 50 01 01 02 02 00 00
Doc dump at e0000050 : 00 00 00 00 1e 1e 6d 6d
Doc dump at e0000058 : 1a 1a 01 01 10 10 00 00
Doc dump at e0000060 : 00 00 00 00 00 00 00 00
Doc dump at e0000068 : 80 80 01 01 94 94 00 00
Doc dump at e0000070 : 00 00 00 00 00 00 00 00
Doc dump at e0000078 : 00 00 00 00 00 00 00 00
Doc dump at e0000080 : 00 00 9c 9c 50 50 53 53
Doc dump at e0000088 : 51 51 52 52 56 56 57 57
Doc dump at e0000090 : 55 55 1e 1e 06 06 ba ba
Doc dump at e0000098 : c0 c0 1f 1f 33 33 c0 c0
Doc dump at e00000a0 : 8e 8e c0 c0 33 33 ff ff
Doc dump at e00000a8 : 83 83 c2 c2 40 40 8e 8e
Doc dump at e00000b0 : da da 81 81 fa fa 00 00
Doc dump at e00000b8 : a0 a0 74 74 1a 1a 33 33
Doc dump at e00000c0 : f6 f6 b9 b9 00 00 02 02
Doc dump at e00000c8 : fc fc ad ad 0b 0b c0 c0
Doc dump at e00000d0 : 75 75 e8 e8 e2 e2 f9 f9
Doc dump at e00000d8 : 83 83 ff ff 00 00 75 75
Doc dump at e00000e0 : 02 02 1e 1e 07 07 47 47
Doc dump at e00000e8 : 83 83 ff ff 30 30 72 72
Doc dump at e00000f0 : db db 83 83 ff ff 30 30
Doc dump at e00000f8 : 73 73 05 05 ba ba 00 00
Doc dump at e0000100 : 58 58 8e 8e c2 c2 0e 0e
Doc dump at e0000108 : 1f 1f 8b 8b ec ec 83 83
Doc dump at e0000110 : ec ec 04 04 8c 8c c0 c0
Doc dump at e0000118 : 8c 8c 46 46 fe fe c7 c7
Doc dump at e0000120 : 46 46 fc fc ab ab 00 00
Doc dump at e0000128 : 0e 0e e8 e8 13 13 00 00
Doc dump at e0000130 : 8b 8b 46 46 fe fe 8e 8e
Doc dump at e0000138 : c0 c0 33 33 ff ff b9 b9
Doc dump at e0000140 : 00 00 60 60 33 33 c0 c0
Doc dump at e0000148 : fc fc f3 f3 ab ab 8b 8b
Doc dump at e0000150 : e5 e5 eb eb 74 74 55 55
Doc dump at e0000158 : 8b 8b ec ec 8b 8b 46 46
Doc dump at e0000160 : 04 04 8e 8e d8 d8 bb bb
Doc dump at e0000168 : 00 00 00 00 c6 c6 87 87
Doc dump at e0000170 : 03 03 10 10 00 00 c6 c6
Doc dump at e0000178 : 87 87 02 02 10 10 85 85
Doc dump at e0000180 : c6 c6 87 87 02 02 10 10
Doc dump at e0000188 : 85 85 be be 00 00 08 08
Doc dump at e0000190 : b1 b1 ff ff e8 e8 5d 5d
Doc dump at e0000198 : 00 00 fc fc 32 32 e4 e4
Doc dump at e00001a0 : b1 b1 00 00 e8 e8 55 55
Doc dump at e00001a8 : 00 00 2e 2e 8b 8b 0e 0e
Doc dump at e00001b0 : 1e 1e 00 00 33 33 ff ff
Doc dump at e00001b8 : f7 f7 c1 c1 ff ff 01 01
Doc dump at e00001c0 : 75 75 23 23 c6 c6 87 87
Doc dump at e00001c8 : 04 04 10 10 0d 0d 2e 2e
Doc dump at e00001d0 : 8b 8b 16 16 1c 1c 00 00
Doc dump at e00001d8 : 03 03 d7 d7 d0 d0 ee ee
Doc dump at e00001e0 : 88 88 14 14 88 88 34 34
Doc dump at e00001e8 : 33 33 d2 d2 88 88 14 14
Doc dump at e00001f0 : c6 c6 87 87 1e 1e 10 10
Doc dump at e00001f8 : 00 00 c6 c6 87 87 04 04
Doc dump at e0000200 : 10 10 09 09 e8 e8 36 36
Doc dump at e0000208 : 00 00 84 84 87 87 0d 0d
Doc dump at e0000210 : 10 10 ac ac 02 02 e0 e0
Doc dump at e0000218 : aa aa 4e 4e e2 e2 cc cc
Doc dump at e0000220 : 2e 2e 3a 3a 26 26 20 20
Doc dump at e0000228 : 00 00 75 75 06 06 5d 5d
Doc dump at e0000230 : 06 06 33 33 c0 c0 50 50
Doc dump at e0000238 : cb cb 5d 5d cb cb 07 07
Doc dump at e0000240 : 1f 1f 5d 5d 5f 5f 5e 5e
Doc dump at e0000248 : 5a 5a 59 59 5b 5b 58 58
Doc dump at e0000250 : 9d 9d cb cb c6 c6 87 87
Doc dump at e0000258 : 04 04 10 10 0b 0b 88 88
Doc dump at e0000260 : 0c 0c c6 c6 87 87 1e 1e
Doc dump at e0000268 : 10 10 00 00 c6 c6 87 87
Doc dump at e0000270 : 04 04 10 10 09 09 f6 f6
Doc dump at e0000278 : 87 87 20 20 10 10 80 80
Doc dump at e0000280 : f6 f6 87 87 20 20 10 10
Doc dump at e0000288 : 80 80 f6 f6 87 87 20 20
Doc dump at e0000290 : 10 10 80 80 f6 f6 87 87
Doc dump at e0000298 : 20 20 10 10 80 80 f6 f6
Doc dump at e00002a0 : 87 87 04 04 10 10 80 80
Doc dump at e00002a8 : 74 74 f9 f9 f6 f6 87 87
Doc dump at e00002b0 : 20 20 10 10 80 80 f6 f6
Doc dump at e00002b8 : 87 87 20 20 10 10 80 80
Doc dump at e00002c0 : c3 c3 1c 1c 00 00 00 00
Doc dump at e00002c8 : 00 00 00 00 00 00 00 00
Doc dump at e00002d0 : 00 00 00 00 00 00 00 00
Doc dump at e00002d8 : 00 00 00 00 00 00 00 00
Doc dump at e00002e0 : 00 00 00 00 00 00 00 00
Doc dump at e00002e8 : 00 00 00 00 00 00 00 00
Doc dump at e00002f0 : 00 00 00 00 00 00 00 00
Doc dump at e00002f8 : 00 00 00 00 00 00 00 00
Doc dump at e0000300 : 00 00 00 00 00 00 00 00
Doc dump at e0000308 : 00 00 00 00 00 00 00 00
Doc dump at e0000310 : 00 00 00 00 00 00 00 00
Doc dump at e0000318 : 00 00 00 00 00 00 00 00
Doc dump at e0000320 : 00 00 00 00 00 00 00 00
Doc dump at e0000328 : 00 00 00 00 00 00 00 00
Doc dump at e0000330 : 00 00 00 00 00 00 00 00
Doc dump at e0000338 : 00 00 00 00 00 00 00 00
Doc dump at e0000340 : 00 00 00 00 00 00 00 00
Doc dump at e0000348 : 00 00 00 00 00 00 00 00
Doc dump at e0000350 : 00 00 00 00 00 00 00 00
Doc dump at e0000358 : 00 00 00 00 00 00 00 00
Doc dump at e0000360 : 00 00 00 00 00 00 00 00
Doc dump at e0000368 : 00 00 00 00 00 00 00 00
Doc dump at e0000370 : 00 00 00 00 00 00 00 00
Doc dump at e0000378 : 00 00 00 00 00 00 00 00
Doc dump at e0000380 : 00 00 00 00 00 00 00 00
Doc dump at e0000388 : 00 00 00 00 00 00 00 00
Doc dump at e0000390 : 00 00 00 00 00 00 00 00
Doc dump at e0000398 : 00 00 00 00 00 00 00 00
Doc dump at e00003a0 : 00 00 00 00 00 00 00 00
Doc dump at e00003a8 : 00 00 00 00 00 00 00 00
Doc dump at e00003b0 : 00 00 00 00 00 00 00 00
Doc dump at e00003b8 : 00 00 00 00 00 00 00 00
Doc dump at e00003c0 : 00 00 00 00 00 00 00 00
Doc dump at e00003c8 : 00 00 00 00 00 00 00 00
Doc dump at e00003d0 : 00 00 00 00 00 00 00 00
Doc dump at e00003d8 : 00 00 00 00 00 00 00 00
Doc dump at e00003e0 : 00 00 00 00 00 00 00 00
Doc dump at e00003e8 : 00 00 00 00 00 00 00 00
Doc dump at e00003f0 : 00 00 00 00 00 00 00 00
Doc dump at e00003f8 : 00 00 00 00 00 00 00 00
Doc dump at e0000400 : 55 55 aa aa 10 10 eb eb
Doc dump at e0000408 : 3c 3c 00 00 00 00 28 28
Doc dump at e0000410 : 43 43 29 29 4d 4d 2d 2d
Doc dump at e0000418 : 53 53 79 79 73 73 74 74
Doc dump at e0000420 : 65 65 6d 6d 73 73 31 31
Doc dump at e0000428 : 39 39 39 39 38 38 00 00
Doc dump at e0000430 : 00 00 00 00 21 21 00 00
Doc dump at e0000438 : 00 00 04 04 00 00 1c 1c
Doc dump at e0000440 : 55 55 24 24 50 50 6e 6e
Doc dump at e0000448 : 50 50 01 01 02 02 00 00
Doc dump at e0000450 : 00 00 00 00 1e 1e 6d 6d
Doc dump at e0000458 : 1a 1a 01 01 10 10 00 00
Doc dump at e0000460 : 00 00 00 00 00 00 00 00
Doc dump at e0000468 : 80 80 01 01 94 94 00 00
Doc dump at e0000470 : 00 00 00 00 00 00 00 00
Doc dump at e0000478 : 00 00 00 00 00 00 00 00
Doc dump at e0000480 : 00 00 9c 9c 50 50 53 53
Doc dump at e0000488 : 51 51 52 52 56 56 57 57
Doc dump at e0000490 : 55 55 1e 1e 06 06 ba ba
Doc dump at e0000498 : c0 c0 1f 1f 33 33 c0 c0
Doc dump at e00004a0 : 8e 8e c0 c0 33 33 ff ff
Doc dump at e00004a8 : 83 83 c2 c2 40 40 8e 8e
Doc dump at e00004b0 : da da 81 81 fa fa 00 00
Doc dump at e00004b8 : a0 a0 74 74 1a 1a 33 33
Doc dump at e00004c0 : f6 f6 b9 b9 00 00 02 02
Doc dump at e00004c8 : fc fc ad ad 0b 0b c0 c0
Doc dump at e00004d0 : 75 75 e8 e8 e2 e2 f9 f9
Doc dump at e00004d8 : 83 83 ff ff 00 00 75 75
Doc dump at e00004e0 : 02 02 1e 1e 07 07 47 47
Doc dump at e00004e8 : 83 83 ff ff 30 30 72 72
Doc dump at e00004f0 : db db 83 83 ff ff 30 30
Doc dump at e00004f8 : 73 73 05 05 ba ba 00 00
Doc dump at e0000500 : 58 58 8e 8e c2 c2 0e 0e
Doc dump at e0000508 : 1f 1f 8b 8b ec ec 83 83
Doc dump at e0000510 : ec ec 04 04 8c 8c c0 c0
Doc dump at e0000518 : 8c 8c 46 46 fe fe c7 c7
Doc dump at e0000520 : 46 46 fc fc ab ab 00 00
Doc dump at e0000528 : 0e 0e e8 e8 13 13 00 00
Doc dump at e0000530 : 8b 8b 46 46 fe fe 8e 8e
Doc dump at e0000538 : c0 c0 33 33 ff ff b9 b9
Doc dump at e0000540 : 00 00 60 60 33 33 c0 c0
Doc dump at e0000548 : fc fc f3 f3 ab ab 8b 8b
Doc dump at e0000550 : e5 e5 eb eb 74 74 55 55
Doc dump at e0000558 : 8b 8b ec ec 8b 8b 46 46
Doc dump at e0000560 : 04 04 8e 8e d8 d8 bb bb
Doc dump at e0000568 : 00 00 00 00 c6 c6 87 87
Doc dump at e0000570 : 03 03 10 10 00 00 c6 c6
Doc dump at e0000578 : 87 87 02 02 10 10 85 85
Doc dump at e0000580 : c6 c6 87 87 02 02 10 10
Doc dump at e0000588 : 85 85 be be 00 00 08 08
Doc dump at e0000590 : b1 b1 ff ff e8 e8 5d 5d
Doc dump at e0000598 : 00 00 fc fc 32 32 e4 e4
Doc dump at e00005a0 : b1 b1 00 00 e8 e8 55 55
Doc dump at e00005a8 : 00 00 2e 2e 8b 8b 0e 0e
Doc dump at e00005b0 : 1e 1e 00 00 33 33 ff ff
Doc dump at e00005b8 : f7 f7 c1 c1 ff ff 01 01
Doc dump at e00005c0 : 75 75 23 23 c6 c6 87 87
Doc dump at e00005c8 : 04 04 10 10 0d 0d 2e 2e
Doc dump at e00005d0 : 8b 8b 16 16 1c 1c 00 00
Doc dump at e00005d8 : 03 03 d7 d7 d0 d0 ee ee
Doc dump at e00005e0 : 88 88 14 14 88 88 34 34
Doc dump at e00005e8 : 33 33 d2 d2 88 88 14 14
Doc dump at e00005f0 : c6 c6 87 87 1e 1e 10 10
Doc dump at e00005f8 : 00 00 c6 c6 87 87 04 04
Doc dump at e0000600 : 10 10 09 09 e8 e8 36 36
Doc dump at e0000608 : 00 00 84 84 87 87 0d 0d
Doc dump at e0000610 : 10 10 ac ac 02 02 e0 e0
Doc dump at e0000618 : aa aa 4e 4e e2 e2 cc cc
Doc dump at e0000620 : 2e 2e 3a 3a 26 26 20 20
Doc dump at e0000628 : 00 00 75 75 06 06 5d 5d
Doc dump at e0000630 : 06 06 33 33 c0 c0 50 50
Doc dump at e0000638 : cb cb 5d 5d cb cb 07 07
Doc dump at e0000640 : 1f 1f 5d 5d 5f 5f 5e 5e
Doc dump at e0000648 : 5a 5a 59 59 5b 5b 58 58
Doc dump at e0000650 : 9d 9d cb cb c6 c6 87 87
Doc dump at e0000658 : 04 04 10 10 0b 0b 88 88
Doc dump at e0000660 : 0c 0c c6 c6 87 87 1e 1e
Doc dump at e0000668 : 10 10 00 00 c6 c6 87 87
Doc dump at e0000670 : 04 04 10 10 09 09 f6 f6
Doc dump at e0000678 : 87 87 20 20 10 10 80 80
Doc dump at e0000680 : f6 f6 87 87 20 20 10 10
Doc dump at e0000688 : 80 80 f6 f6 87 87 20 20
Doc dump at e0000690 : 10 10 80 80 f6 f6 87 87
Doc dump at e0000698 : 20 20 10 10 80 80 f6 f6
Doc dump at e00006a0 : 87 87 04 04 10 10 80 80
Doc dump at e00006a8 : 74 74 f9 f9 f6 f6 87 87
Doc dump at e00006b0 : 20 20 10 10 80 80 f6 f6
Doc dump at e00006b8 : 87 87 20 20 10 10 80 80
Doc dump at e00006c0 : c3 c3 1c 1c 00 00 00 00
Doc dump at e00006c8 : 00 00 00 00 00 00 00 00
Doc dump at e00006d0 : 00 00 00 00 00 00 00 00
Doc dump at e00006d8 : 00 00 00 00 00 00 00 00
Doc dump at e00006e0 : 00 00 00 00 00 00 00 00
Doc dump at e00006e8 : 00 00 00 00 00 00 00 00
Doc dump at e00006f0 : 00 00 00 00 00 00 00 00
Doc dump at e00006f8 : 00 00 00 00 00 00 00 00
Doc dump at e0000700 : 00 00 00 00 00 00 00 00
Doc dump at e0000708 : 00 00 00 00 00 00 00 00
Doc dump at e0000710 : 00 00 00 00 00 00 00 00
Doc dump at e0000718 : 00 00 00 00 00 00 00 00
Doc dump at e0000720 : 00 00 00 00 00 00 00 00
Doc dump at e0000728 : 00 00 00 00 00 00 00 00
Doc dump at e0000730 : 00 00 00 00 00 00 00 00
Doc dump at e0000738 : 00 00 00 00 00 00 00 00
Doc dump at e0000740 : 00 00 00 00 00 00 00 00
Doc dump at e0000748 : 00 00 00 00 00 00 00 00
Doc dump at e0000750 : 00 00 00 00 00 00 00 00
Doc dump at e0000758 : 00 00 00 00 00 00 00 00
Doc dump at e0000760 : 00 00 00 00 00 00 00 00
Doc dump at e0000768 : 00 00 00 00 00 00 00 00
Doc dump at e0000770 : 00 00 00 00 00 00 00 00
Doc dump at e0000778 : 00 00 00 00 00 00 00 00
Doc dump at e0000780 : 00 00 00 00 00 00 00 00
Doc dump at e0000788 : 00 00 00 00 00 00 00 00
Doc dump at e0000790 : 00 00 00 00 00 00 00 00
Doc dump at e0000798 : 00 00 00 00 00 00 00 00
Doc dump at e00007a0 : 00 00 00 00 00 00 00 00
Doc dump at e00007a8 : 00 00 00 00 00 00 00 00
Doc dump at e00007b0 : 00 00 00 00 00 00 00 00
Doc dump at e00007b8 : 00 00 00 00 00 00 00 00
Doc dump at e00007c0 : 00 00 00 00 00 00 00 00
Doc dump at e00007c8 : 00 00 00 00 00 00 00 00
Doc dump at e00007d0 : 00 00 00 00 00 00 00 00
Doc dump at e00007d8 : 00 00 00 00 00 00 00 00
Doc dump at e00007e0 : 00 00 00 00 00 00 00 00
Doc dump at e00007e8 : 00 00 00 00 00 00 00 00
Doc dump at e00007f0 : 00 00 00 00 00 00 00 00
Doc dump at e00007f8 : 00 00 00 00 00 00 00 00
Doc dump at e0000800 : 55 55 aa aa 10 10 eb eb
Doc dump at e0000808 : 3c 3c 00 00 00 00 28 28
Doc dump at e0000810 : 43 43 29 29 4d 4d 2d 2d
Doc dump at e0000818 : 53 53 79 79 73 73 74 74
Doc dump at e0000820 : 65 65 6d 6d 73 73 31 31
Doc dump at e0000828 : 39 39 39 39 38 38 00 00
Doc dump at e0000830 : 00 00 00 00 21 21 00 00
Doc dump at e0000838 : 00 00 04 04 00 00 1c 1c
Doc dump at e0000840 : 55 55 24 24 50 50 6e 6e
Doc dump at e0000848 : 50 50 01 01 02 02 00 00
Doc dump at e0000850 : 00 00 00 00 1e 1e 6d 6d
Doc dump at e0000858 : 1a 1a 01 01 10 10 00 00
Doc dump at e0000860 : 00 00 00 00 00 00 00 00
Doc dump at e0000868 : 80 80 01 01 94 94 00 00
Doc dump at e0000870 : 00 00 00 00 00 00 00 00
Doc dump at e0000878 : 00 00 00 00 00 00 00 00
Doc dump at e0000880 : 00 00 9c 9c 50 50 53 53
Doc dump at e0000888 : 51 51 52 52 56 56 57 57
Doc dump at e0000890 : 55 55 1e 1e 06 06 ba ba
Doc dump at e0000898 : c0 c0 1f 1f 33 33 c0 c0
Doc dump at e00008a0 : 8e 8e c0 c0 33 33 ff ff
Doc dump at e00008a8 : 83 83 c2 c2 40 40 8e 8e
Doc dump at e00008b0 : da da 81 81 fa fa 00 00
Doc dump at e00008b8 : a0 a0 74 74 1a 1a 33 33
Doc dump at e00008c0 : f6 f6 b9 b9 00 00 02 02
Doc dump at e00008c8 : fc fc ad ad 0b 0b c0 c0
Doc dump at e00008d0 : 75 75 e8 e8 e2 e2 f9 f9
Doc dump at e00008d8 : 83 83 ff ff 00 00 75 75
Doc dump at e00008e0 : 02 02 1e 1e 07 07 47 47
Doc dump at e00008e8 : 83 83 ff ff 30 30 72 72
Doc dump at e00008f0 : db db 83 83 ff ff 30 30
Doc dump at e00008f8 : 73 73 05 05 ba ba 00 00
Doc dump at e0000900 : 58 58 8e 8e c2 c2 0e 0e
Doc dump at e0000908 : 1f 1f 8b 8b ec ec 83 83
Doc dump at e0000910 : ec ec 04 04 8c 8c c0 c0
Doc dump at e0000918 : 8c 8c 46 46 fe fe c7 c7
Doc dump at e0000920 : 46 46 fc fc ab ab 00 00
Doc dump at e0000928 : 0e 0e e8 e8 13 13 00 00
Doc dump at e0000930 : 8b 8b 46 46 fe fe 8e 8e
Doc dump at e0000938 : c0 c0 33 33 ff ff b9 b9
Doc dump at e0000940 : 00 00 60 60 33 33 c0 c0
Doc dump at e0000948 : fc fc f3 f3 ab ab 8b 8b
Doc dump at e0000950 : e5 e5 eb eb 74 74 55 55
Doc dump at e0000958 : 8b 8b ec ec 8b 8b 46 46
Doc dump at e0000960 : 04 04 8e 8e d8 d8 bb bb
Doc dump at e0000968 : 00 00 00 00 c6 c6 87 87
Doc dump at e0000970 : 03 03 10 10 00 00 c6 c6
Doc dump at e0000978 : 87 87 02 02 10 10 85 85
Doc dump at e0000980 : c6 c6 87 87 02 02 10 10
Doc dump at e0000988 : 85 85 be be 00 00 08 08
Doc dump at e0000990 : b1 b1 ff ff e8 e8 5d 5d
Doc dump at e0000998 : 00 00 fc fc 32 32 e4 e4
Doc dump at e00009a0 : b1 b1 00 00 e8 e8 55 55
Doc dump at e00009a8 : 00 00 2e 2e 8b 8b 0e 0e
Doc dump at e00009b0 : 1e 1e 00 00 33 33 ff ff
Doc dump at e00009b8 : f7 f7 c1 c1 ff ff 01 01
Doc dump at e00009c0 : 75 75 23 23 c6 c6 87 87
Doc dump at e00009c8 : 04 04 10 10 0d 0d 2e 2e
Doc dump at e00009d0 : 8b 8b 16 16 1c 1c 00 00
Doc dump at e00009d8 : 03 03 d7 d7 d0 d0 ee ee
Doc dump at e00009e0 : 88 88 14 14 88 88 34 34
Doc dump at e00009e8 : 33 33 d2 d2 88 88 14 14
Doc dump at e00009f0 : c6 c6 87 87 1e 1e 10 10
Doc dump at e00009f8 : 00 00 c6 c6 87 87 04 04
Doc dump at e0000a00 : 10 10 09 09 e8 e8 36 36
Doc dump at e0000a08 : 00 00 84 84 87 87 0d 0d
Doc dump at e0000a10 : 10 10 ac ac 02 02 e0 e0
Doc dump at e0000a18 : aa aa 4e 4e e2 e2 cc cc
Doc dump at e0000a20 : 2e 2e 3a 3a 26 26 20 20
Doc dump at e0000a28 : 00 00 75 75 06 06 5d 5d
Doc dump at e0000a30 : 06 06 33 33 c0 c0 50 50
Doc dump at e0000a38 : cb cb 5d 5d cb cb 07 07
Doc dump at e0000a40 : 1f 1f 5d 5d 5f 5f 5e 5e
Doc dump at e0000a48 : 5a 5a 59 59 5b 5b 58 58
Doc dump at e0000a50 : 9d 9d cb cb c6 c6 87 87
Doc dump at e0000a58 : 04 04 10 10 0b 0b 88 88
Doc dump at e0000a60 : 0c 0c c6 c6 87 87 1e 1e
Doc dump at e0000a68 : 10 10 00 00 c6 c6 87 87
Doc dump at e0000a70 : 04 04 10 10 09 09 f6 f6
Doc dump at e0000a78 : 87 87 20 20 10 10 80 80
Doc dump at e0000a80 : f6 f6 87 87 20 20 10 10
Doc dump at e0000a88 : 80 80 f6 f6 87 87 20 20
Doc dump at e0000a90 : 10 10 80 80 f6 f6 87 87
Doc dump at e0000a98 : 20 20 10 10 80 80 f6 f6
Doc dump at e0000aa0 : 87 87 04 04 10 10 80 80
Doc dump at e0000aa8 : 74 74 f9 f9 f6 f6 87 87
Doc dump at e0000ab0 : 20 20 10 10 80 80 f6 f6
Doc dump at e0000ab8 : 87 87 20 20 10 10 80 80
Doc dump at e0000ac0 : c3 c3 1c 1c 00 00 00 00
Doc dump at e0000ac8 : 00 00 00 00 00 00 00 00
Doc dump at e0000ad0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ad8 : 00 00 00 00 00 00 00 00
Doc dump at e0000ae0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ae8 : 00 00 00 00 00 00 00 00
Doc dump at e0000af0 : 00 00 00 00 00 00 00 00
Doc dump at e0000af8 : 00 00 00 00 00 00 00 00
Doc dump at e0000b00 : 00 00 00 00 00 00 00 00
Doc dump at e0000b08 : 00 00 00 00 00 00 00 00
Doc dump at e0000b10 : 00 00 00 00 00 00 00 00
Doc dump at e0000b18 : 00 00 00 00 00 00 00 00
Doc dump at e0000b20 : 00 00 00 00 00 00 00 00
Doc dump at e0000b28 : 00 00 00 00 00 00 00 00
Doc dump at e0000b30 : 00 00 00 00 00 00 00 00
Doc dump at e0000b38 : 00 00 00 00 00 00 00 00
Doc dump at e0000b40 : 00 00 00 00 00 00 00 00
Doc dump at e0000b48 : 00 00 00 00 00 00 00 00
Doc dump at e0000b50 : 00 00 00 00 00 00 00 00
Doc dump at e0000b58 : 00 00 00 00 00 00 00 00
Doc dump at e0000b60 : 00 00 00 00 00 00 00 00
Doc dump at e0000b68 : 00 00 00 00 00 00 00 00
Doc dump at e0000b70 : 00 00 00 00 00 00 00 00
Doc dump at e0000b78 : 00 00 00 00 00 00 00 00
Doc dump at e0000b80 : 00 00 00 00 00 00 00 00
Doc dump at e0000b88 : 00 00 00 00 00 00 00 00
Doc dump at e0000b90 : 00 00 00 00 00 00 00 00
Doc dump at e0000b98 : 00 00 00 00 00 00 00 00
Doc dump at e0000ba0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ba8 : 00 00 00 00 00 00 00 00
Doc dump at e0000bb0 : 00 00 00 00 00 00 00 00
Doc dump at e0000bb8 : 00 00 00 00 00 00 00 00
Doc dump at e0000bc0 : 00 00 00 00 00 00 00 00
Doc dump at e0000bc8 : 00 00 00 00 00 00 00 00
Doc dump at e0000bd0 : 00 00 00 00 00 00 00 00
Doc dump at e0000bd8 : 00 00 00 00 00 00 00 00
Doc dump at e0000be0 : 00 00 00 00 00 00 00 00
Doc dump at e0000be8 : 00 00 00 00 00 00 00 00
Doc dump at e0000bf0 : 00 00 00 00 00 00 00 00
Doc dump at e0000bf8 : 00 00 00 00 00 00 00 00
Doc dump at e0000c00 : 55 55 aa aa 10 10 eb eb
Doc dump at e0000c08 : 3c 3c 00 00 00 00 28 28
Doc dump at e0000c10 : 43 43 29 29 4d 4d 2d 2d
Doc dump at e0000c18 : 53 53 79 79 73 73 74 74
Doc dump at e0000c20 : 65 65 6d 6d 73 73 31 31
Doc dump at e0000c28 : 39 39 39 39 38 38 00 00
Doc dump at e0000c30 : 00 00 00 00 21 21 00 00
Doc dump at e0000c38 : 00 00 04 04 00 00 1c 1c
Doc dump at e0000c40 : 55 55 24 24 50 50 6e 6e
Doc dump at e0000c48 : 50 50 01 01 02 02 00 00
Doc dump at e0000c50 : 00 00 00 00 1e 1e 6d 6d
Doc dump at e0000c58 : 1a 1a 01 01 10 10 00 00
Doc dump at e0000c60 : 00 00 00 00 00 00 00 00
Doc dump at e0000c68 : 80 80 01 01 94 94 00 00
Doc dump at e0000c70 : 00 00 00 00 00 00 00 00
Doc dump at e0000c78 : 00 00 00 00 00 00 00 00
Doc dump at e0000c80 : 00 00 9c 9c 50 50 53 53
Doc dump at e0000c88 : 51 51 52 52 56 56 57 57
Doc dump at e0000c90 : 55 55 1e 1e 06 06 ba ba
Doc dump at e0000c98 : c0 c0 1f 1f 33 33 c0 c0
Doc dump at e0000ca0 : 8e 8e c0 c0 33 33 ff ff
Doc dump at e0000ca8 : 83 83 c2 c2 40 40 8e 8e
Doc dump at e0000cb0 : da da 81 81 fa fa 00 00
Doc dump at e0000cb8 : a0 a0 74 74 1a 1a 33 33
Doc dump at e0000cc0 : f6 f6 b9 b9 00 00 02 02
Doc dump at e0000cc8 : fc fc ad ad 0b 0b c0 c0
Doc dump at e0000cd0 : 75 75 e8 e8 e2 e2 f9 f9
Doc dump at e0000cd8 : 83 83 ff ff 00 00 75 75
Doc dump at e0000ce0 : 02 02 1e 1e 07 07 47 47
Doc dump at e0000ce8 : 83 83 ff ff 30 30 72 72
Doc dump at e0000cf0 : db db 83 83 ff ff 30 30
Doc dump at e0000cf8 : 73 73 05 05 ba ba 00 00
Doc dump at e0000d00 : 58 58 8e 8e c2 c2 0e 0e
Doc dump at e0000d08 : 1f 1f 8b 8b ec ec 83 83
Doc dump at e0000d10 : ec ec 04 04 8c 8c c0 c0
Doc dump at e0000d18 : 8c 8c 46 46 fe fe c7 c7
Doc dump at e0000d20 : 46 46 fc fc ab ab 00 00
Doc dump at e0000d28 : 0e 0e e8 e8 13 13 00 00
Doc dump at e0000d30 : 8b 8b 46 46 fe fe 8e 8e
Doc dump at e0000d38 : c0 c0 33 33 ff ff b9 b9
Doc dump at e0000d40 : 00 00 60 60 33 33 c0 c0
Doc dump at e0000d48 : fc fc f3 f3 ab ab 8b 8b
Doc dump at e0000d50 : e5 e5 eb eb 74 74 55 55
Doc dump at e0000d58 : 8b 8b ec ec 8b 8b 46 46
Doc dump at e0000d60 : 04 04 8e 8e d8 d8 bb bb
Doc dump at e0000d68 : 00 00 00 00 c6 c6 87 87
Doc dump at e0000d70 : 03 03 10 10 00 00 c6 c6
Doc dump at e0000d78 : 87 87 02 02 10 10 85 85
Doc dump at e0000d80 : c6 c6 87 87 02 02 10 10
Doc dump at e0000d88 : 85 85 be be 00 00 08 08
Doc dump at e0000d90 : b1 b1 ff ff e8 e8 5d 5d
Doc dump at e0000d98 : 00 00 fc fc 32 32 e4 e4
Doc dump at e0000da0 : b1 b1 00 00 e8 e8 55 55
Doc dump at e0000da8 : 00 00 2e 2e 8b 8b 0e 0e
Doc dump at e0000db0 : 1e 1e 00 00 33 33 ff ff
Doc dump at e0000db8 : f7 f7 c1 c1 ff ff 01 01
Doc dump at e0000dc0 : 75 75 23 23 c6 c6 87 87
Doc dump at e0000dc8 : 04 04 10 10 0d 0d 2e 2e
Doc dump at e0000dd0 : 8b 8b 16 16 1c 1c 00 00
Doc dump at e0000dd8 : 03 03 d7 d7 d0 d0 ee ee
Doc dump at e0000de0 : 88 88 14 14 88 88 34 34
Doc dump at e0000de8 : 33 33 d2 d2 88 88 14 14
Doc dump at e0000df0 : c6 c6 87 87 1e 1e 10 10
Doc dump at e0000df8 : 00 00 c6 c6 87 87 04 04
Doc dump at e0000e00 : 10 10 09 09 e8 e8 36 36
Doc dump at e0000e08 : 00 00 84 84 87 87 0d 0d
Doc dump at e0000e10 : 10 10 ac ac 02 02 e0 e0
Doc dump at e0000e18 : aa aa 4e 4e e2 e2 cc cc
Doc dump at e0000e20 : 2e 2e 3a 3a 26 26 20 20
Doc dump at e0000e28 : 00 00 75 75 06 06 5d 5d
Doc dump at e0000e30 : 06 06 33 33 c0 c0 50 50
Doc dump at e0000e38 : cb cb 5d 5d cb cb 07 07
Doc dump at e0000e40 : 1f 1f 5d 5d 5f 5f 5e 5e
Doc dump at e0000e48 : 5a 5a 59 59 5b 5b 58 58
Doc dump at e0000e50 : 9d 9d cb cb c6 c6 87 87
Doc dump at e0000e58 : 04 04 10 10 0b 0b 88 88
Doc dump at e0000e60 : 0c 0c c6 c6 87 87 1e 1e
Doc dump at e0000e68 : 10 10 00 00 c6 c6 87 87
Doc dump at e0000e70 : 04 04 10 10 09 09 f6 f6
Doc dump at e0000e78 : 87 87 20 20 10 10 80 80
Doc dump at e0000e80 : f6 f6 87 87 20 20 10 10
Doc dump at e0000e88 : 80 80 f6 f6 87 87 20 20
Doc dump at e0000e90 : 10 10 80 80 f6 f6 87 87
Doc dump at e0000e98 : 20 20 10 10 80 80 f6 f6
Doc dump at e0000ea0 : 87 87 04 04 10 10 80 80
Doc dump at e0000ea8 : 74 74 f9 f9 f6 f6 87 87
Doc dump at e0000eb0 : 20 20 10 10 80 80 f6 f6
Doc dump at e0000eb8 : 87 87 20 20 10 10 80 80
Doc dump at e0000ec0 : c3 c3 1c 1c 00 00 00 00
Doc dump at e0000ec8 : 00 00 00 00 00 00 00 00
Doc dump at e0000ed0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ed8 : 00 00 00 00 00 00 00 00
Doc dump at e0000ee0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ee8 : 00 00 00 00 00 00 00 00
Doc dump at e0000ef0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ef8 : 00 00 00 00 00 00 00 00
Doc dump at e0000f00 : 00 00 00 00 00 00 00 00
Doc dump at e0000f08 : 00 00 00 00 00 00 00 00
Doc dump at e0000f10 : 00 00 00 00 00 00 00 00
Doc dump at e0000f18 : 00 00 00 00 00 00 00 00
Doc dump at e0000f20 : 00 00 00 00 00 00 00 00
Doc dump at e0000f28 : 00 00 00 00 00 00 00 00
Doc dump at e0000f30 : 00 00 00 00 00 00 00 00
Doc dump at e0000f38 : 00 00 00 00 00 00 00 00
Doc dump at e0000f40 : 00 00 00 00 00 00 00 00
Doc dump at e0000f48 : 00 00 00 00 00 00 00 00
Doc dump at e0000f50 : 00 00 00 00 00 00 00 00
Doc dump at e0000f58 : 00 00 00 00 00 00 00 00
Doc dump at e0000f60 : 00 00 00 00 00 00 00 00
Doc dump at e0000f68 : 00 00 00 00 00 00 00 00
Doc dump at e0000f70 : 00 00 00 00 00 00 00 00
Doc dump at e0000f78 : 00 00 00 00 00 00 00 00
Doc dump at e0000f80 : 00 00 00 00 00 00 00 00
Doc dump at e0000f88 : 00 00 00 00 00 00 00 00
Doc dump at e0000f90 : 00 00 00 00 00 00 00 00
Doc dump at e0000f98 : 00 00 00 00 00 00 00 00
Doc dump at e0000fa0 : 00 00 00 00 00 00 00 00
Doc dump at e0000fa8 : 00 00 00 00 00 00 00 00
Doc dump at e0000fb0 : 00 00 00 00 00 00 00 00
Doc dump at e0000fb8 : 00 00 00 00 00 00 00 00
Doc dump at e0000fc0 : 00 00 00 00 00 00 00 00
Doc dump at e0000fc8 : 00 00 00 00 00 00 00 00
Doc dump at e0000fd0 : 00 00 00 00 00 00 00 00
Doc dump at e0000fd8 : 00 00 00 00 00 00 00 00
Doc dump at e0000fe0 : 00 00 00 00 00 00 00 00
Doc dump at e0000fe8 : 00 00 00 00 00 00 00 00
Doc dump at e0000ff0 : 00 00 00 00 00 00 00 00
Doc dump at e0000ff8 : 00 00 00 00 00 00 00 00
Doc dump at e0001000 : 00 00 00 00 00 00 00 00
Doc dump at e0001008 : 00 00 00 00 00 00 00 00
Doc dump at e0001010 : 00 00 00 00 00 00 00 00
Doc dump at e0001018 : 00 00 00 00 00 00 00 00
Doc dump at e0001020 : 00 00 00 00 00 00 00 00
Doc dump at e0001028 : 00 00 00 00 00 00 00 00
Doc dump at e0001030 : 00 00 00 00 00 00 00 00
Doc dump at e0001038 : 00 00 00 00 00 00 00 00
Doc dump at e0001040 : 00 00 00 00 00 00 00 00
Doc dump at e0001048 : 00 00 00 00 00 00 00 00
Doc dump at e0001050 : 00 00 00 00 00 00 00 00
Doc dump at e0001058 : 00 00 00 00 00 00 00 00
Doc dump at e0001060 : 00 00 00 00 00 00 00 00
Doc dump at e0001068 : 00 00 00 00 00 00 00 00
Doc dump at e0001070 : 00 00 00 00 00 00 00 00
Doc dump at e0001078 : 00 00 00 00 00 00 00 00
Doc dump at e0001080 : 00 00 00 00 00 00 00 00
Doc dump at e0001088 : 00 00 00 00 00 00 00 00
Doc dump at e0001090 : 00 00 00 00 00 00 00 00
Doc dump at e0001098 : 00 00 00 00 00 00 00 00
Doc dump at e00010a0 : 00 00 00 00 00 00 00 00
Doc dump at e00010a8 : 00 00 00 00 00 00 00 00
Doc dump at e00010b0 : 00 00 00 00 00 00 00 00
Doc dump at e00010b8 : 00 00 00 00 00 00 00 00
Doc dump at e00010c0 : 00 00 00 00 00 00 00 00
Doc dump at e00010c8 : 00 00 00 00 00 00 00 00
Doc dump at e00010d0 : 00 00 00 00 00 00 00 00
Doc dump at e00010d8 : 00 00 00 00 00 00 00 00
Doc dump at e00010e0 : 00 00 00 00 00 00 00 00
Doc dump at e00010e8 : 00 00 00 00 00 00 00 00
Doc dump at e00010f0 : 00 00 00 00 00 00 00 00
Doc dump at e00010f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001100 : 00 00 00 00 00 00 00 00
Doc dump at e0001108 : 00 00 00 00 00 00 00 00
Doc dump at e0001110 : 00 00 00 00 00 00 00 00
Doc dump at e0001118 : 00 00 00 00 00 00 00 00
Doc dump at e0001120 : 00 00 00 00 00 00 00 00
Doc dump at e0001128 : 00 00 00 00 00 00 00 00
Doc dump at e0001130 : 00 00 00 00 00 00 00 00
Doc dump at e0001138 : 00 00 00 00 00 00 00 00
Doc dump at e0001140 : 00 00 00 00 00 00 00 00
Doc dump at e0001148 : 00 00 00 00 00 00 00 00
Doc dump at e0001150 : 00 00 00 00 00 00 00 00
Doc dump at e0001158 : 00 00 00 00 00 00 00 00
Doc dump at e0001160 : 00 00 00 00 00 00 00 00
Doc dump at e0001168 : 00 00 00 00 00 00 00 00
Doc dump at e0001170 : 00 00 00 00 00 00 00 00
Doc dump at e0001178 : 00 00 00 00 00 00 00 00
Doc dump at e0001180 : 00 00 00 00 00 00 00 00
Doc dump at e0001188 : 00 00 00 00 00 00 00 00
Doc dump at e0001190 : 00 00 00 00 00 00 00 00
Doc dump at e0001198 : 00 00 00 00 00 00 00 00
Doc dump at e00011a0 : 00 00 00 00 00 00 00 00
Doc dump at e00011a8 : 00 00 00 00 00 00 00 00
Doc dump at e00011b0 : 00 00 00 00 00 00 00 00
Doc dump at e00011b8 : 00 00 00 00 00 00 00 00
Doc dump at e00011c0 : 00 00 00 00 00 00 00 00
Doc dump at e00011c8 : 00 00 00 00 00 00 00 00
Doc dump at e00011d0 : 00 00 00 00 00 00 00 00
Doc dump at e00011d8 : 00 00 00 00 00 00 00 00
Doc dump at e00011e0 : 00 00 00 00 00 00 00 00
Doc dump at e00011e8 : 00 00 00 00 00 00 00 00
Doc dump at e00011f0 : 00 00 00 00 00 00 00 00
Doc dump at e00011f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001200 : 00 00 00 00 00 00 00 00
Doc dump at e0001208 : 00 00 00 00 00 00 00 00
Doc dump at e0001210 : 00 00 00 00 00 00 00 00
Doc dump at e0001218 : 00 00 00 00 00 00 00 00
Doc dump at e0001220 : 00 00 00 00 00 00 00 00
Doc dump at e0001228 : 00 00 00 00 00 00 00 00
Doc dump at e0001230 : 00 00 00 00 00 00 00 00
Doc dump at e0001238 : 00 00 00 00 00 00 00 00
Doc dump at e0001240 : 00 00 00 00 00 00 00 00
Doc dump at e0001248 : 00 00 00 00 00 00 00 00
Doc dump at e0001250 : 00 00 00 00 00 00 00 00
Doc dump at e0001258 : 00 00 00 00 00 00 00 00
Doc dump at e0001260 : 00 00 00 00 00 00 00 00
Doc dump at e0001268 : 00 00 00 00 00 00 00 00
Doc dump at e0001270 : 00 00 00 00 00 00 00 00
Doc dump at e0001278 : 00 00 00 00 00 00 00 00
Doc dump at e0001280 : 00 00 00 00 00 00 00 00
Doc dump at e0001288 : 00 00 00 00 00 00 00 00
Doc dump at e0001290 : 00 00 00 00 00 00 00 00
Doc dump at e0001298 : 00 00 00 00 00 00 00 00
Doc dump at e00012a0 : 00 00 00 00 00 00 00 00
Doc dump at e00012a8 : 00 00 00 00 00 00 00 00
Doc dump at e00012b0 : 00 00 00 00 00 00 00 00
Doc dump at e00012b8 : 00 00 00 00 00 00 00 00
Doc dump at e00012c0 : 00 00 00 00 00 00 00 00
Doc dump at e00012c8 : 00 00 00 00 00 00 00 00
Doc dump at e00012d0 : 00 00 00 00 00 00 00 00
Doc dump at e00012d8 : 00 00 00 00 00 00 00 00
Doc dump at e00012e0 : 00 00 00 00 00 00 00 00
Doc dump at e00012e8 : 00 00 00 00 00 00 00 00
Doc dump at e00012f0 : 00 00 00 00 00 00 00 00
Doc dump at e00012f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001300 : 00 00 00 00 00 00 00 00
Doc dump at e0001308 : 00 00 00 00 00 00 00 00
Doc dump at e0001310 : 00 00 00 00 00 00 00 00
Doc dump at e0001318 : 00 00 00 00 00 00 00 00
Doc dump at e0001320 : 00 00 00 00 00 00 00 00
Doc dump at e0001328 : 00 00 00 00 00 00 00 00
Doc dump at e0001330 : 00 00 00 00 00 00 00 00
Doc dump at e0001338 : 00 00 00 00 00 00 00 00
Doc dump at e0001340 : 00 00 00 00 00 00 00 00
Doc dump at e0001348 : 00 00 00 00 00 00 00 00
Doc dump at e0001350 : 00 00 00 00 00 00 00 00
Doc dump at e0001358 : 00 00 00 00 00 00 00 00
Doc dump at e0001360 : 00 00 00 00 00 00 00 00
Doc dump at e0001368 : 00 00 00 00 00 00 00 00
Doc dump at e0001370 : 00 00 00 00 00 00 00 00
Doc dump at e0001378 : 00 00 00 00 00 00 00 00
Doc dump at e0001380 : 00 00 00 00 00 00 00 00
Doc dump at e0001388 : 00 00 00 00 00 00 00 00
Doc dump at e0001390 : 00 00 00 00 00 00 00 00
Doc dump at e0001398 : 00 00 00 00 00 00 00 00
Doc dump at e00013a0 : 00 00 00 00 00 00 00 00
Doc dump at e00013a8 : 00 00 00 00 00 00 00 00
Doc dump at e00013b0 : 00 00 00 00 00 00 00 00
Doc dump at e00013b8 : 00 00 00 00 00 00 00 00
Doc dump at e00013c0 : 00 00 00 00 00 00 00 00
Doc dump at e00013c8 : 00 00 00 00 00 00 00 00
Doc dump at e00013d0 : 00 00 00 00 00 00 00 00
Doc dump at e00013d8 : 00 00 00 00 00 00 00 00
Doc dump at e00013e0 : 00 00 00 00 00 00 00 00
Doc dump at e00013e8 : 00 00 00 00 00 00 00 00
Doc dump at e00013f0 : 00 00 00 00 00 00 00 00
Doc dump at e00013f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001400 : 00 00 00 00 00 00 00 00
Doc dump at e0001408 : 00 00 00 00 00 00 00 00
Doc dump at e0001410 : 00 00 00 00 00 00 00 00
Doc dump at e0001418 : 00 00 00 00 00 00 00 00
Doc dump at e0001420 : 00 00 00 00 00 00 00 00
Doc dump at e0001428 : 00 00 00 00 00 00 00 00
Doc dump at e0001430 : 00 00 00 00 00 00 00 00
Doc dump at e0001438 : 00 00 00 00 00 00 00 00
Doc dump at e0001440 : 00 00 00 00 00 00 00 00
Doc dump at e0001448 : 00 00 00 00 00 00 00 00
Doc dump at e0001450 : 00 00 00 00 00 00 00 00
Doc dump at e0001458 : 00 00 00 00 00 00 00 00
Doc dump at e0001460 : 00 00 00 00 00 00 00 00
Doc dump at e0001468 : 00 00 00 00 00 00 00 00
Doc dump at e0001470 : 00 00 00 00 00 00 00 00
Doc dump at e0001478 : 00 00 00 00 00 00 00 00
Doc dump at e0001480 : 00 00 00 00 00 00 00 00
Doc dump at e0001488 : 00 00 00 00 00 00 00 00
Doc dump at e0001490 : 00 00 00 00 00 00 00 00
Doc dump at e0001498 : 00 00 00 00 00 00 00 00
Doc dump at e00014a0 : 00 00 00 00 00 00 00 00
Doc dump at e00014a8 : 00 00 00 00 00 00 00 00
Doc dump at e00014b0 : 00 00 00 00 00 00 00 00
Doc dump at e00014b8 : 00 00 00 00 00 00 00 00
Doc dump at e00014c0 : 00 00 00 00 00 00 00 00
Doc dump at e00014c8 : 00 00 00 00 00 00 00 00
Doc dump at e00014d0 : 00 00 00 00 00 00 00 00
Doc dump at e00014d8 : 00 00 00 00 00 00 00 00
Doc dump at e00014e0 : 00 00 00 00 00 00 00 00
Doc dump at e00014e8 : 00 00 00 00 00 00 00 00
Doc dump at e00014f0 : 00 00 00 00 00 00 00 00
Doc dump at e00014f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001500 : 00 00 00 00 00 00 00 00
Doc dump at e0001508 : 00 00 00 00 00 00 00 00
Doc dump at e0001510 : 00 00 00 00 00 00 00 00
Doc dump at e0001518 : 00 00 00 00 00 00 00 00
Doc dump at e0001520 : 00 00 00 00 00 00 00 00
Doc dump at e0001528 : 00 00 00 00 00 00 00 00
Doc dump at e0001530 : 00 00 00 00 00 00 00 00
Doc dump at e0001538 : 00 00 00 00 00 00 00 00
Doc dump at e0001540 : 00 00 00 00 00 00 00 00
Doc dump at e0001548 : 00 00 00 00 00 00 00 00
Doc dump at e0001550 : 00 00 00 00 00 00 00 00
Doc dump at e0001558 : 00 00 00 00 00 00 00 00
Doc dump at e0001560 : 00 00 00 00 00 00 00 00
Doc dump at e0001568 : 00 00 00 00 00 00 00 00
Doc dump at e0001570 : 00 00 00 00 00 00 00 00
Doc dump at e0001578 : 00 00 00 00 00 00 00 00
Doc dump at e0001580 : 00 00 00 00 00 00 00 00
Doc dump at e0001588 : 00 00 00 00 00 00 00 00
Doc dump at e0001590 : 00 00 00 00 00 00 00 00
Doc dump at e0001598 : 00 00 00 00 00 00 00 00
Doc dump at e00015a0 : 00 00 00 00 00 00 00 00
Doc dump at e00015a8 : 00 00 00 00 00 00 00 00
Doc dump at e00015b0 : 00 00 00 00 00 00 00 00
Doc dump at e00015b8 : 00 00 00 00 00 00 00 00
Doc dump at e00015c0 : 00 00 00 00 00 00 00 00
Doc dump at e00015c8 : 00 00 00 00 00 00 00 00
Doc dump at e00015d0 : 00 00 00 00 00 00 00 00
Doc dump at e00015d8 : 00 00 00 00 00 00 00 00
Doc dump at e00015e0 : 00 00 00 00 00 00 00 00
Doc dump at e00015e8 : 00 00 00 00 00 00 00 00
Doc dump at e00015f0 : 00 00 00 00 00 00 00 00
Doc dump at e00015f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001600 : 00 00 00 00 00 00 00 00
Doc dump at e0001608 : 00 00 00 00 00 00 00 00
Doc dump at e0001610 : 00 00 00 00 00 00 00 00
Doc dump at e0001618 : 00 00 00 00 00 00 00 00
Doc dump at e0001620 : 00 00 00 00 00 00 00 00
Doc dump at e0001628 : 00 00 00 00 00 00 00 00
Doc dump at e0001630 : 00 00 00 00 00 00 00 00
Doc dump at e0001638 : 00 00 00 00 00 00 00 00
Doc dump at e0001640 : 00 00 00 00 00 00 00 00
Doc dump at e0001648 : 00 00 00 00 00 00 00 00
Doc dump at e0001650 : 00 00 00 00 00 00 00 00
Doc dump at e0001658 : 00 00 00 00 00 00 00 00
Doc dump at e0001660 : 00 00 00 00 00 00 00 00
Doc dump at e0001668 : 00 00 00 00 00 00 00 00
Doc dump at e0001670 : 00 00 00 00 00 00 00 00
Doc dump at e0001678 : 00 00 00 00 00 00 00 00
Doc dump at e0001680 : 00 00 00 00 00 00 00 00
Doc dump at e0001688 : 00 00 00 00 00 00 00 00
Doc dump at e0001690 : 00 00 00 00 00 00 00 00
Doc dump at e0001698 : 00 00 00 00 00 00 00 00
Doc dump at e00016a0 : 00 00 00 00 00 00 00 00
Doc dump at e00016a8 : 00 00 00 00 00 00 00 00
Doc dump at e00016b0 : 00 00 00 00 00 00 00 00
Doc dump at e00016b8 : 00 00 00 00 00 00 00 00
Doc dump at e00016c0 : 00 00 00 00 00 00 00 00
Doc dump at e00016c8 : 00 00 00 00 00 00 00 00
Doc dump at e00016d0 : 00 00 00 00 00 00 00 00
Doc dump at e00016d8 : 00 00 00 00 00 00 00 00
Doc dump at e00016e0 : 00 00 00 00 00 00 00 00
Doc dump at e00016e8 : 00 00 00 00 00 00 00 00
Doc dump at e00016f0 : 00 00 00 00 00 00 00 00
Doc dump at e00016f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001700 : 00 00 00 00 00 00 00 00
Doc dump at e0001708 : 00 00 00 00 00 00 00 00
Doc dump at e0001710 : 00 00 00 00 00 00 00 00
Doc dump at e0001718 : 00 00 00 00 00 00 00 00
Doc dump at e0001720 : 00 00 00 00 00 00 00 00
Doc dump at e0001728 : 00 00 00 00 00 00 00 00
Doc dump at e0001730 : 00 00 00 00 00 00 00 00
Doc dump at e0001738 : 00 00 00 00 00 00 00 00
Doc dump at e0001740 : 00 00 00 00 00 00 00 00
Doc dump at e0001748 : 00 00 00 00 00 00 00 00
Doc dump at e0001750 : 00 00 00 00 00 00 00 00
Doc dump at e0001758 : 00 00 00 00 00 00 00 00
Doc dump at e0001760 : 00 00 00 00 00 00 00 00
Doc dump at e0001768 : 00 00 00 00 00 00 00 00
Doc dump at e0001770 : 00 00 00 00 00 00 00 00
Doc dump at e0001778 : 00 00 00 00 00 00 00 00
Doc dump at e0001780 : 00 00 00 00 00 00 00 00
Doc dump at e0001788 : 00 00 00 00 00 00 00 00
Doc dump at e0001790 : 00 00 00 00 00 00 00 00
Doc dump at e0001798 : 00 00 00 00 00 00 00 00
Doc dump at e00017a0 : 00 00 00 00 00 00 00 00
Doc dump at e00017a8 : 00 00 00 00 00 00 00 00
Doc dump at e00017b0 : 00 00 00 00 00 00 00 00
Doc dump at e00017b8 : 00 00 00 00 00 00 00 00
Doc dump at e00017c0 : 00 00 00 00 00 00 00 00
Doc dump at e00017c8 : 00 00 00 00 00 00 00 00
Doc dump at e00017d0 : 00 00 00 00 00 00 00 00
Doc dump at e00017d8 : 00 00 00 00 00 00 00 00
Doc dump at e00017e0 : 00 00 00 00 00 00 00 00
Doc dump at e00017e8 : 00 00 00 00 00 00 00 00
Doc dump at e00017f0 : 00 00 00 00 00 00 00 00
Doc dump at e00017f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001800 : 00 00 00 00 00 00 00 00
Doc dump at e0001808 : 00 00 00 00 00 00 00 00
Doc dump at e0001810 : 00 00 00 00 00 00 00 00
Doc dump at e0001818 : 00 00 00 00 00 00 00 00
Doc dump at e0001820 : 00 00 00 00 00 00 00 00
Doc dump at e0001828 : 00 00 00 00 00 00 00 00
Doc dump at e0001830 : 00 00 00 00 00 00 00 00
Doc dump at e0001838 : 00 00 00 00 00 00 00 00
Doc dump at e0001840 : 00 00 00 00 00 00 00 00
Doc dump at e0001848 : 00 00 00 00 00 00 00 00
Doc dump at e0001850 : 00 00 00 00 00 00 00 00
Doc dump at e0001858 : 00 00 00 00 00 00 00 00
Doc dump at e0001860 : 00 00 00 00 00 00 00 00
Doc dump at e0001868 : 00 00 00 00 00 00 00 00
Doc dump at e0001870 : 00 00 00 00 00 00 00 00
Doc dump at e0001878 : 00 00 00 00 00 00 00 00
Doc dump at e0001880 : 00 00 00 00 00 00 00 00
Doc dump at e0001888 : 00 00 00 00 00 00 00 00
Doc dump at e0001890 : 00 00 00 00 00 00 00 00
Doc dump at e0001898 : 00 00 00 00 00 00 00 00
Doc dump at e00018a0 : 00 00 00 00 00 00 00 00
Doc dump at e00018a8 : 00 00 00 00 00 00 00 00
Doc dump at e00018b0 : 00 00 00 00 00 00 00 00
Doc dump at e00018b8 : 00 00 00 00 00 00 00 00
Doc dump at e00018c0 : 00 00 00 00 00 00 00 00
Doc dump at e00018c8 : 00 00 00 00 00 00 00 00
Doc dump at e00018d0 : 00 00 00 00 00 00 00 00
Doc dump at e00018d8 : 00 00 00 00 00 00 00 00
Doc dump at e00018e0 : 00 00 00 00 00 00 00 00
Doc dump at e00018e8 : 00 00 00 00 00 00 00 00
Doc dump at e00018f0 : 00 00 00 00 00 00 00 00
Doc dump at e00018f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001900 : 00 00 00 00 00 00 00 00
Doc dump at e0001908 : 00 00 00 00 00 00 00 00
Doc dump at e0001910 : 00 00 00 00 00 00 00 00
Doc dump at e0001918 : 00 00 00 00 00 00 00 00
Doc dump at e0001920 : 00 00 00 00 00 00 00 00
Doc dump at e0001928 : 00 00 00 00 00 00 00 00
Doc dump at e0001930 : 00 00 00 00 00 00 00 00
Doc dump at e0001938 : 00 00 00 00 00 00 00 00
Doc dump at e0001940 : 00 00 00 00 00 00 00 00
Doc dump at e0001948 : 00 00 00 00 00 00 00 00
Doc dump at e0001950 : 00 00 00 00 00 00 00 00
Doc dump at e0001958 : 00 00 00 00 00 00 00 00
Doc dump at e0001960 : 00 00 00 00 00 00 00 00
Doc dump at e0001968 : 00 00 00 00 00 00 00 00
Doc dump at e0001970 : 00 00 00 00 00 00 00 00
Doc dump at e0001978 : 00 00 00 00 00 00 00 00
Doc dump at e0001980 : 00 00 00 00 00 00 00 00
Doc dump at e0001988 : 00 00 00 00 00 00 00 00
Doc dump at e0001990 : 00 00 00 00 00 00 00 00
Doc dump at e0001998 : 00 00 00 00 00 00 00 00
Doc dump at e00019a0 : 00 00 00 00 00 00 00 00
Doc dump at e00019a8 : 00 00 00 00 00 00 00 00
Doc dump at e00019b0 : 00 00 00 00 00 00 00 00
Doc dump at e00019b8 : 00 00 00 00 00 00 00 00
Doc dump at e00019c0 : 00 00 00 00 00 00 00 00
Doc dump at e00019c8 : 00 00 00 00 00 00 00 00
Doc dump at e00019d0 : 00 00 00 00 00 00 00 00
Doc dump at e00019d8 : 00 00 00 00 00 00 00 00
Doc dump at e00019e0 : 00 00 00 00 00 00 00 00
Doc dump at e00019e8 : 00 00 00 00 00 00 00 00
Doc dump at e00019f0 : 00 00 00 00 00 00 00 00
Doc dump at e00019f8 : 00 00 00 00 00 00 00 00
Doc dump at e0001a00 : 00 00 00 00 00 00 00 00
Doc dump at e0001a08 : 00 00 00 00 00 00 00 00
Doc dump at e0001a10 : 00 00 00 00 00 00 00 00
Doc dump at e0001a18 : 00 00 00 00 00 00 00 00
Doc dump at e0001a20 : 00 00 00 00 00 00 00 00
Doc dump at e0001a28 : 00 00 00 00 00 00 00 00
Doc dump at e0001a30 : 00 00 00 00 00 00 00 00
Doc dump at e0001a38 : 00 00 00 00 00 00 00 00
Doc dump at e0001a40 : 00 00 00 00 00 00 00 00
Doc dump at e0001a48 : 00 00 00 00 00 00 00 00
Doc dump at e0001a50 : 00 00 00 00 00 00 00 00
Doc dump at e0001a58 : 00 00 00 00 00 00 00 00
Doc dump at e0001a60 : 00 00 00 00 00 00 00 00
Doc dump at e0001a68 : 00 00 00 00 00 00 00 00
Doc dump at e0001a70 : 00 00 00 00 00 00 00 00
Doc dump at e0001a78 : 00 00 00 00 00 00 00 00
Doc dump at e0001a80 : 00 00 00 00 00 00 00 00
Doc dump at e0001a88 : 00 00 00 00 00 00 00 00
Doc dump at e0001a90 : 00 00 00 00 00 00 00 00
Doc dump at e0001a98 : 00 00 00 00 00 00 00 00
Doc dump at e0001aa0 : 00 00 00 00 00 00 00 00
Doc dump at e0001aa8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ab0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ab8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ac0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ac8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ad0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ad8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ae0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ae8 : 00 00 00 00 00 00 00 00
Doc dump at e0001af0 : 00 00 00 00 00 00 00 00
Doc dump at e0001af8 : 00 00 00 00 00 00 00 00
Doc dump at e0001b00 : 00 00 00 00 00 00 00 00
Doc dump at e0001b08 : 00 00 00 00 00 00 00 00
Doc dump at e0001b10 : 00 00 00 00 00 00 00 00
Doc dump at e0001b18 : 00 00 00 00 00 00 00 00
Doc dump at e0001b20 : 00 00 00 00 00 00 00 00
Doc dump at e0001b28 : 00 00 00 00 00 00 00 00
Doc dump at e0001b30 : 00 00 00 00 00 00 00 00
Doc dump at e0001b38 : 00 00 00 00 00 00 00 00
Doc dump at e0001b40 : 00 00 00 00 00 00 00 00
Doc dump at e0001b48 : 00 00 00 00 00 00 00 00
Doc dump at e0001b50 : 00 00 00 00 00 00 00 00
Doc dump at e0001b58 : 00 00 00 00 00 00 00 00
Doc dump at e0001b60 : 00 00 00 00 00 00 00 00
Doc dump at e0001b68 : 00 00 00 00 00 00 00 00
Doc dump at e0001b70 : 00 00 00 00 00 00 00 00
Doc dump at e0001b78 : 00 00 00 00 00 00 00 00
Doc dump at e0001b80 : 00 00 00 00 00 00 00 00
Doc dump at e0001b88 : 00 00 00 00 00 00 00 00
Doc dump at e0001b90 : 00 00 00 00 00 00 00 00
Doc dump at e0001b98 : 00 00 00 00 00 00 00 00
Doc dump at e0001ba0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ba8 : 00 00 00 00 00 00 00 00
Doc dump at e0001bb0 : 00 00 00 00 00 00 00 00
Doc dump at e0001bb8 : 00 00 00 00 00 00 00 00
Doc dump at e0001bc0 : 00 00 00 00 00 00 00 00
Doc dump at e0001bc8 : 00 00 00 00 00 00 00 00
Doc dump at e0001bd0 : 00 00 00 00 00 00 00 00
Doc dump at e0001bd8 : 00 00 00 00 00 00 00 00
Doc dump at e0001be0 : 00 00 00 00 00 00 00 00
Doc dump at e0001be8 : 00 00 00 00 00 00 00 00
Doc dump at e0001bf0 : 00 00 00 00 00 00 00 00
Doc dump at e0001bf8 : 00 00 00 00 00 00 00 00
Doc dump at e0001c00 : 00 00 00 00 00 00 00 00
Doc dump at e0001c08 : 00 00 00 00 00 00 00 00
Doc dump at e0001c10 : 00 00 00 00 00 00 00 00
Doc dump at e0001c18 : 00 00 00 00 00 00 00 00
Doc dump at e0001c20 : 00 00 00 00 00 00 00 00
Doc dump at e0001c28 : 00 00 00 00 00 00 00 00
Doc dump at e0001c30 : 00 00 00 00 00 00 00 00
Doc dump at e0001c38 : 00 00 00 00 00 00 00 00
Doc dump at e0001c40 : 00 00 00 00 00 00 00 00
Doc dump at e0001c48 : 00 00 00 00 00 00 00 00
Doc dump at e0001c50 : 00 00 00 00 00 00 00 00
Doc dump at e0001c58 : 00 00 00 00 00 00 00 00
Doc dump at e0001c60 : 00 00 00 00 00 00 00 00
Doc dump at e0001c68 : 00 00 00 00 00 00 00 00
Doc dump at e0001c70 : 00 00 00 00 00 00 00 00
Doc dump at e0001c78 : 00 00 00 00 00 00 00 00
Doc dump at e0001c80 : 00 00 00 00 00 00 00 00
Doc dump at e0001c88 : 00 00 00 00 00 00 00 00
Doc dump at e0001c90 : 00 00 00 00 00 00 00 00
Doc dump at e0001c98 : 00 00 00 00 00 00 00 00
Doc dump at e0001ca0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ca8 : 00 00 00 00 00 00 00 00
Doc dump at e0001cb0 : 00 00 00 00 00 00 00 00
Doc dump at e0001cb8 : 00 00 00 00 00 00 00 00
Doc dump at e0001cc0 : 00 00 00 00 00 00 00 00
Doc dump at e0001cc8 : 00 00 00 00 00 00 00 00
Doc dump at e0001cd0 : 00 00 00 00 00 00 00 00
Doc dump at e0001cd8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ce0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ce8 : 00 00 00 00 00 00 00 00
Doc dump at e0001cf0 : 00 00 00 00 00 00 00 00
Doc dump at e0001cf8 : 00 00 00 00 00 00 00 00
Doc dump at e0001d00 : 00 00 00 00 00 00 00 00
Doc dump at e0001d08 : 00 00 00 00 00 00 00 00
Doc dump at e0001d10 : 00 00 00 00 00 00 00 00
Doc dump at e0001d18 : 00 00 00 00 00 00 00 00
Doc dump at e0001d20 : 00 00 00 00 00 00 00 00
Doc dump at e0001d28 : 00 00 00 00 00 00 00 00
Doc dump at e0001d30 : 00 00 00 00 00 00 00 00
Doc dump at e0001d38 : 00 00 00 00 00 00 00 00
Doc dump at e0001d40 : 00 00 00 00 00 00 00 00
Doc dump at e0001d48 : 00 00 00 00 00 00 00 00
Doc dump at e0001d50 : 00 00 00 00 00 00 00 00
Doc dump at e0001d58 : 00 00 00 00 00 00 00 00
Doc dump at e0001d60 : 00 00 00 00 00 00 00 00
Doc dump at e0001d68 : 00 00 00 00 00 00 00 00
Doc dump at e0001d70 : 00 00 00 00 00 00 00 00
Doc dump at e0001d78 : 00 00 00 00 00 00 00 00
Doc dump at e0001d80 : 00 00 00 00 00 00 00 00
Doc dump at e0001d88 : 00 00 00 00 00 00 00 00
Doc dump at e0001d90 : 00 00 00 00 00 00 00 00
Doc dump at e0001d98 : 00 00 00 00 00 00 00 00
Doc dump at e0001da0 : 00 00 00 00 00 00 00 00
Doc dump at e0001da8 : 00 00 00 00 00 00 00 00
Doc dump at e0001db0 : 00 00 00 00 00 00 00 00
Doc dump at e0001db8 : 00 00 00 00 00 00 00 00
Doc dump at e0001dc0 : 00 00 00 00 00 00 00 00
Doc dump at e0001dc8 : 00 00 00 00 00 00 00 00
Doc dump at e0001dd0 : 00 00 00 00 00 00 00 00
Doc dump at e0001dd8 : 00 00 00 00 00 00 00 00
Doc dump at e0001de0 : 00 00 00 00 00 00 00 00
Doc dump at e0001de8 : 00 00 00 00 00 00 00 00
Doc dump at e0001df0 : 00 00 00 00 00 00 00 00
Doc dump at e0001df8 : 00 00 00 00 00 00 00 00
Doc dump at e0001e00 : 00 00 00 00 00 00 00 00
Doc dump at e0001e08 : 00 00 00 00 00 00 00 00
Doc dump at e0001e10 : 00 00 00 00 00 00 00 00
Doc dump at e0001e18 : 00 00 00 00 00 00 00 00
Doc dump at e0001e20 : 00 00 00 00 00 00 00 00
Doc dump at e0001e28 : 00 00 00 00 00 00 00 00
Doc dump at e0001e30 : 00 00 00 00 00 00 00 00
Doc dump at e0001e38 : 00 00 00 00 00 00 00 00
Doc dump at e0001e40 : 00 00 00 00 00 00 00 00
Doc dump at e0001e48 : 00 00 00 00 00 00 00 00
Doc dump at e0001e50 : 00 00 00 00 00 00 00 00
Doc dump at e0001e58 : 00 00 00 00 00 00 00 00
Doc dump at e0001e60 : 00 00 00 00 00 00 00 00
Doc dump at e0001e68 : 00 00 00 00 00 00 00 00
Doc dump at e0001e70 : 00 00 00 00 00 00 00 00
Doc dump at e0001e78 : 00 00 00 00 00 00 00 00
Doc dump at e0001e80 : 00 00 00 00 00 00 00 00
Doc dump at e0001e88 : 00 00 00 00 00 00 00 00
Doc dump at e0001e90 : 00 00 00 00 00 00 00 00
Doc dump at e0001e98 : 00 00 00 00 00 00 00 00
Doc dump at e0001ea0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ea8 : 00 00 00 00 00 00 00 00
Doc dump at e0001eb0 : 00 00 00 00 00 00 00 00
Doc dump at e0001eb8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ec0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ec8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ed0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ed8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ee0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ee8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ef0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ef8 : 00 00 00 00 00 00 00 00
Doc dump at e0001f00 : 00 00 00 00 00 00 00 00
Doc dump at e0001f08 : 00 00 00 00 00 00 00 00
Doc dump at e0001f10 : 00 00 00 00 00 00 00 00
Doc dump at e0001f18 : 00 00 00 00 00 00 00 00
Doc dump at e0001f20 : 00 00 00 00 00 00 00 00
Doc dump at e0001f28 : 00 00 00 00 00 00 00 00
Doc dump at e0001f30 : 00 00 00 00 00 00 00 00
Doc dump at e0001f38 : 00 00 00 00 00 00 00 00
Doc dump at e0001f40 : 00 00 00 00 00 00 00 00
Doc dump at e0001f48 : 00 00 00 00 00 00 00 00
Doc dump at e0001f50 : 00 00 00 00 00 00 00 00
Doc dump at e0001f58 : 00 00 00 00 00 00 00 00
Doc dump at e0001f60 : 00 00 00 00 00 00 00 00
Doc dump at e0001f68 : 00 00 00 00 00 00 00 00
Doc dump at e0001f70 : 00 00 00 00 00 00 00 00
Doc dump at e0001f78 : 00 00 00 00 00 00 00 00
Doc dump at e0001f80 : 00 00 00 00 00 00 00 00
Doc dump at e0001f88 : 00 00 00 00 00 00 00 00
Doc dump at e0001f90 : 00 00 00 00 00 00 00 00
Doc dump at e0001f98 : 00 00 00 00 00 00 00 00
Doc dump at e0001fa0 : 00 00 00 00 00 00 00 00
Doc dump at e0001fa8 : 00 00 00 00 00 00 00 00
Doc dump at e0001fb0 : 00 00 00 00 00 00 00 00
Doc dump at e0001fb8 : 00 00 00 00 00 00 00 00
Doc dump at e0001fc0 : 00 00 00 00 00 00 00 00
Doc dump at e0001fc8 : 00 00 00 00 00 00 00 00
Doc dump at e0001fd0 : 00 00 00 00 00 00 00 00
Doc dump at e0001fd8 : 00 00 00 00 00 00 00 00
Doc dump at e0001fe0 : 00 00 00 00 00 00 00 00
Doc dump at e0001fe8 : 00 00 00 00 00 00 00 00
Doc dump at e0001ff0 : 00 00 00 00 00 00 00 00
Doc dump at e0001ff8 : 00 00 00 00 00 00 00 00
Possible DiskOnChip with unknown ChipID 00 found at 0xe0000000
No recognised DiskOnChip devices found
init_mtdchar: allocated major number 90.
init_mtdblock: allocated major number 31.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
kmem_create: Forcing size word alignment - ip_dst_cache
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (romfs filesystem) readonly.
Freeing unused kernel memory: 24k freed (0x10a000 - 0x10f000)
Shell invoked to run file: /etc/rc
Command: hostname uClinux
Command: /bin/expand /etc/ramfs.img /dev/ram1
Command: mount -t proc proc /proc
Command: mount -t ext2 /dev/ram1 /var
Command: mkdir /var/tmp
Command: mkdir /var/log
Command: mkdir /var/run
Command: mkdir /var/lock
Command: ifconfig lo 127.0.0.1
Commeand: route add -net 127.0t.0.0 netmask 255.0.0.0 loh
Command: #dhcpcd -p -a 0eth0 &
Command: ifconfig: eth0 10.10.0.121
 config: auto-negotiation on, 100FDX, 100HDX, 10FDX, 10HDX.
Command: route add -net 10.10.0.0 netmask 255.255.0.0 eth0
Command: mount -t nfs -o nolock -o rw 10.10.0.20:/c/linux /mnt/net

------_=_NextPart_000_01C37CEA.4A19DCCA--
