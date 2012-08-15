Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1h6a-0007OG-Pb
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 17:10:07 +0000
Received: from coredoba.hi.pengutronix.de ([2001:6f8:1178:2:219:99ff:fe56:8d7])
 by metis.ext.pengutronix.de with esmtp (Exim 4.72)
 (envelope-from <jlu@pengutronix.de>) id 1T1h6W-00048I-Bl
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 19:10:00 +0200
Received: from jlu by coredoba.hi.pengutronix.de with local (Exim 4.80)
 (envelope-from <jlu@pengutronix.de>) id 1T1h6W-0001Ff-5R
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 19:10:00 +0200
Message-ID: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
Subject: UBI on SPI NOR flash
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 15 Aug 2012 19:10:00 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

I'm trying to use UBIFS on SPI NOR flash, but have been unable to get it
to work on kernel version 3.5. It is a Numonyx N25Q128 connected to an
TI AM3505.

I've added the JEDEC-ID to the m25p80 driver:
        { "n25q128", INFO(0x20ba18,  0, 64 * 1024,  256, 0) },
=20
Now, when i try to use it with UBI I get this:
~ # cat /proc/mtd=20
dev:    size   erasesize  name
mtd0: 00380000 00020000 "kernel"
mtd1: 00c00000 00020000 "root"
mtd2: 00400000 00020000 "appkernel"
mtd3: 02000000 00020000 "approot"
mtd4: 04a00000 00020000 "data"
mtd5: 01000000 00010000 "NOR-N25Q128"
~ # flash_erase /dev/mtd5 0 0
Erasing 64 Kibyte @ ff0000 -- 100 % complete=20
~ # ubiattach -m 5
[  372.903594] UBI: attaching mtd5 to ubi0
[  372.908538] UBI: physical eraseblock size:   65536 bytes (64 KiB)
[  372.914916] UBI: logical eraseblock size:    65408 bytes
[  372.922393] UBI: smallest flash I/O unit:    1
[  372.927062] UBI: VID header offset:          64 (aligned 64)
[  372.933380] UBI: data offset:                128
[  372.985931] UBI: empty MTD device detected
[  372.990814] UBI: max. sequence number:       0
[  372.995635] UBI: create volume table (copy #1)
[  373.901519] UBI: create volume table (copy #2)
[  374.812377] UBI: attached mtd5 to ubi0
[  374.816345] UBI: MTD device name:            "NOR-N25Q128"
[  374.822875] UBI: MTD device size:            16 MiB
[  374.828338] UBI: number of good PEBs:        256
[  374.833190] UBI: number of bad PEBs:         0
[  374.838226] UBI: number of corrupted PEBs:   0
[  374.842895] UBI: max. allowed volumes:       128
[  374.848083] UBI: wear-leveling threshold:    4096
[  374.853027] UBI: number of internal volumes: 1
[  374.858032] UBI: number of user volumes:     0
[  374.862701] UBI: available PEBs:             252
[  374.867858] UBI: total number of reserved PEBs: 4
[  374.872802] UBI: number of PEBs reserved for bad PEB handling: 0
[  374.879425] UBI: max/mean erase counter: 0/0
[  374.883911] UBI: image sequence number:  -15869967
[  374.889282] UBI: background thread "ubi_bgt0d" started, PID 603
UBI device number 0, total 256 LEBs (16744448 bytes, 16.0 MiB), available 2=
52 LEBs (16482816 bytes, 15.7 MiB), LEB size 65408 bytes (63.9 KiB)
~ # ubidetach -m 5
[  458.280059] UBI: mtd5 is detached from ubi0
~ # ubiattach -m 5
[  598.920166] UBI: attaching mtd5 to ubi0
[  598.924377] UBI: physical eraseblock size:   65536 bytes (64 KiB)
[  598.933044] UBI: logical eraseblock size:    65408 bytes
[  598.938934] UBI: smallest flash I/O unit:    1
[  598.943603] UBI: VID header offset:          64 (aligned 64)
[  598.949890] UBI: data offset:                128
[  599.021850] UBI: max. sequence number:       2
[  599.103698] UBI error: vtbl_check: bad CRC at record 0: 0x2b4f6dd5, not =
0x000000
[  599.111877] UBI error: vtbl_check: bad CRC at record 0: 0x2b4f6dd5, not =
0x000000
[  599.120788] UBI error: process_lvol: both volume tables are corrupted
[  599.128784] UBI error: ubi_attach_mtd_dev: failed to attach mtd5, error =
-22
ubiattach: error!: cannot attach mtd5
           error 22 (Invalid argument)

Here's a dump the beginning of the device:
~ # hd /dev/mtd5 | head -n 20
00000000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 01  |UBI#..........=
..|
00000010  00 00 00 40 00 00 00 80  ff 0d d7 f1 00 00 00 00  |...@..........=
..|
00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 4d d2 53 1c  |............M.=
S.|
00000040  55 42 49 21 01 01 00 05  7f ff ef ff 00 00 00 00  |UBI!..........=
..|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 01  |..............=
..|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 65 b3 bd 2d  |............e.=
.-|
00000080  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000100  d5 a0 01 58 e0 a0 01 22  b8 f9 81 01 c1 21 54 e6  |...X...".....!=
T.|
00000110  a6 01 23 f8 0c 17 a9 0d  af 03 22 19 6b 0b e8 01  |..#.......".k.=
..|
00000120  5c 09 ac 01 23 de f9 65  0f 8c 01 54 51 78 00 23  |\...#..e...TQx=
.#|
00000130  84 50 62 01 c5 f3 21 b2  95 73 0c 8c 01 22 6c 63  |.Pb...!..s..."=
lc|
00000140  21 95 bf 0a 27 32 00 bc  0e 28 28 00 22 dd 93 0b  |!...'2...((.".=
..|
00000150  f8 01 59 82 0d ec 01 02  63 74 c0 c5 73 a4 11 59  |..Y.....ct..s.=
.Y|
00000160  40 65 bb 14 8f 75 b4 ae  0a 81 ca 22 cd 24 65 a6  |@e...u.....".$=
e.|
00000170  07 73 d9 61 14 0c 27 2c  00 44 14 b0 0d 23 d0 76  |.s.a..',.D...#=
.v|
00000180  5a 26 d2 dc 21 e0 2c 7d  00 70 44 e4 5d 2a 73 55  |Z&..!.,}.pD.]*=
sU|
00000190  28 0e 7a 00 d8 98 26 21  77 08 78 01 c5 24 73 03  |(.z...&!w.x..$=
s.|

After some kB like this it continues with UBI headers at the start of
each erase block. Is this the way it should be?

I noticed, that mtdinfo -u reports reports min IO size and sub-page size
as 1 byte:
~ # mtdinfo -u /dev/mtd5
mtd5
Name:                           NOR-N25Q128
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          256 (16777216 bytes, 16.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:10
Bad blocks are allowed:         false
Device is writable:             true
Default UBI VID header offset:  64
Default UBI data offset:        128
Default UBI LEB size:           65408 bytes, 63.9 KiB
Maximum UBI volumes count:      128

Thanks in advance for any replies and best regards,
Jan L=C3=BCbbe
--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
