Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18en7S-00053w-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Feb 2003 02:10:59 +0000
Message-ID: <000701c2c997$111f3de0$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: <tglx@linutronix.de>, <linux-mtd@lists.infradead.org>
References: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com> <20030130210325.0F2BB405E@tiger.actrix.co.nz> <004701c2c8ce$107caea0$1a00a8c0@itc.intrinsyc.com> <200301310810.31301.tglx@linutronix.de>
Date: Fri, 31 Jan 2003 18:10:12 -0800
MIME-Version: 1.0
Subject: Re: NAND subsector writing problem
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

Ok thank you.

I try to mount partition woth files and empty one -  see my log (huge)

All CONFIG variables setted correctly ( JFFS2_NAND=y etc)

Alex

#insmod ice_nand.o

NAND device: Manufacture ID: 0x98, Chip ID: 0x75 (Toshiba NAND 32MB 3,3V)
Creating 3 MTD partitions on "NAND 32MB 3,3V":
0x00000000-0x00200000 : "NAND flash partition 1"
0x00200000-0x00800000 : "NAND flash partition 2"
0x00800000-0x00a00000 : "NAND flash partition 3"

debian:/home# util/mkfs.jffs  -d /home/util -e 0x4000 -o test.jffs

debian:/home# util/eraseall /dev/mtd0

Erasing 16 Kibynand_erase: start = 0x00000000, len = 16384
te @ 0 --  0 % complete.nand_erase: start = 0x00004000, len = 16384
Erasing 16 Kibyte @ 4000 --  0 nand_erase: start = 0x00008000, len = 16384
% complete.Erasing 16 Kibyte @ nand_erase: start = 0x0000c000, len = 16384
8000 --  1 % complete.Erasing 1nand_erase: start = 0x00010000, len = 16384
6 Kibyte @ c000 --  2 % completenand_erase: start = 0x00014000, len = 16384
.Erasing 16 Kibyte @ 10000 --  nand_erase: start = 0x00018000, len = 16384
3 % complete.Erasing 16 Kibyte nand_erase: start = 0x0001c000, len = 16384
@ 14000 --  3 % complete.Erasinnand_erase: start = 0x00020000, len = 16384
g 16 Kibyte @ 18000 --  4 % compnand_erase: start = 0x00024000, len = 16384
lete.Erasing 16 Kibyte @ 1c000 nand_erase: start = 0x00028000, len = 16384
--  5 % complete.Erasing 16 Kibnand_erase: start = 0x0002c000, len = 16384
yte @ 20000 --  6 % complete.Ernand_erase: start = 0x00030000, len = 16384
asing 16 Kibyte @ 24000 --  7 % nand_erase: start = 0x00034000, len = 16384
complete.Erasing 16 Kibyte @ 28nand_erase: start = 0x00038000, len = 16384
000 --  7 % complete.Erasing 16nand_erase: start = 0x0003c000, len = 16384
 Kibyte @ 2c000 --  8 % completenand_erase: start = 0x00040000, len = 16384
.Erasing 16 Kibyte @ 30000 --  nand_erase: start = 0x00044000, len = 16384
9 % complete.Erasing 16 Kibyte nand_erase: start = 0x00048000, len = 16384
@ 34000 -- 10 % complete.Erasinnand_erase: start = 0x0004c000, len = 16384
g 16 Kibyte @ 38000 -- 10 % compnand_erase: start = 0x00050000, len = 16384
lete.Erasing 16 Kibyte @ 3c000 nand_erase: start = 0x00054000, len = 16384
-- 11 % complete.Erasing 16 Kibnand_erase: start = 0x00058000, len = 16384
yte @ 40000 -- 12 % complete.Ernand_erase: start = 0x0005c000, len = 16384
asing 16 Kibyte @ 44000 -- 13 % nand_erase: start = 0x00060000, len = 16384
complete.Erasing 16 Kibyte @ 48nand_erase: start = 0x00064000, len = 16384
000 -- 14 % complete.Erasing 16nand_erase: start = 0x00068000, len = 16384
 Kibyte @ 4c000 -- 14 % completenand_erase: start = 0x0006c000, len = 16384
.Erasing 16 Kibyte @ 50000 -- 1nand_erase: start = 0x00070000, len = 16384
5 % complete.Erasing 16 Kibyte nand_erase: start = 0x00074000, len = 16384
@ 54000 -- 16 % complete.Erasinnand_erase: start = 0x00078000, len = 16384
g 16 Kibyte @ 58000 -- 17 % compnand_erase: start = 0x0007c000, len = 16384
lete.Erasing 16 Kibyte @ 5c000 nand_erase: start = 0x00080000, len = 16384
-- 17 % complete.Erasing 16 Kibnand_erase: start = 0x00084000, len = 16384
yte @ 60000 -- 18 % complete.Ernand_erase: start = 0x00088000, len = 16384
asing 16 Kibyte @ 64000 -- 19 % nand_erase: start = 0x0008c000, len = 16384
complete.Erasing 16 Kibyte @ 68nand_erase: start = 0x00090000, len = 16384
000 -- 20 % complete.Erasing 16nand_erase: start = 0x00094000, len = 16384
 Kibyte @ 6c000 -- 21 % completenand_erase: start = 0x00098000, len = 16384
.Erasing 16 Kibyte @ 70000 -- 2nand_erase: start = 0x0009c000, len = 16384
1 % complete.Erasing 16 Kibyte nand_erase: start = 0x000a0000, len = 16384
@ 74000 -- 22 % complete.Erasinnand_erase: start = 0x000a4000, len = 16384
g 16 Kibyte @ 78000 -- 23 % compnand_erase: start = 0x000a8000, len = 16384
lete.Erasing 16 Kibyte @ 7c000 nand_erase: start = 0x000ac000, len = 16384
-- 24 % complete.Erasing 16 Kibnand_erase: start = 0x000b0000, len = 16384
yte @ 80000 -- 25 % complete.Ernand_erase: start = 0x000b4000, len = 16384
asing 16 Kibyte @ 84000 -- 25 % nand_erase: start = 0x000b8000, len = 16384
complete.Erasing 16 Kibyte @ 88nand_erase: start = 0x000bc000, len = 16384
000 -- 26 % complete.Erasing 16nand_erase: start = 0x000c0000, len = 16384
 Kibyte @ 8c000 -- 27 % completenand_erase: start = 0x000c4000, len = 16384
.Erasing 16 Kibyte @ 90000 -- 2nand_erase: start = 0x000c8000, len = 16384
8 % complete.Erasing 16 Kibyte nand_erase: start = 0x000cc000, len = 16384
@ 94000 -- 28 % complete.Erasinnand_erase: start = 0x000d0000, len = 16384
g 16 Kibyte @ 98000 -- 29 % compnand_erase: start = 0x000d4000, len = 16384
lete.Erasing 16 Kibyte @ 9c000 nand_erase: start = 0x000d8000, len = 16384
-- 30 % complete.Erasing 16 Kibnand_erase: start = 0x000dc000, len = 16384
yte @ a0000 -- 31 % complete.Ernand_erase: start = 0x000e0000, len = 16384
asing 16 Kibyte @ a4000 -- 32 % nand_erase: start = 0x000e4000, len = 16384
complete.Erasing 16 Kibyte @ a8nand_erase: start = 0x000e8000, len = 16384
000 -- 32 % complete.Erasing 16nand_erase: start = 0x000ec000, len = 16384
 Kibyte @ ac000 -- 33 % completenand_erase: start = 0x000f0000, len = 16384
.Erasing 16 Kibyte @ b0000 -- 3nand_erase: start = 0x000f4000, len = 16384
4 % complete.Erasing 16 Kibyte nand_erase: start = 0x000f8000, len = 16384
@ b4000 -- 35 % complete.Erasinnand_erase: start = 0x000fc000, len = 16384
g 16 Kibyte @ b8000 -- 35 % compnand_erase: start = 0x00100000, len = 16384
lete.Erasing 16 Kibyte @ bc000 nand_erase: start = 0x00104000, len = 16384
-- 36 % complete.Erasing 16 Kibnand_erase: start = 0x00108000, len = 16384
yte @ c0000 -- 37 % complete.Ernand_erase: start = 0x0010c000, len = 16384
asing 16 Kibyte @ c4000 -- 38 % nand_erase: start = 0x00110000, len = 16384
complete.Erasing 16 Kibyte @ c8nand_erase: start = 0x00114000, len = 16384
000 -- 39 % complete.Erasing 16nand_erase: start = 0x00118000, len = 16384
 Kibyte @ cc000 -- 39 % completenand_erase: start = 0x0011c000, len = 16384
.Erasing 16 Kibyte @ d0000 -- 4nand_erase: start = 0x00120000, len = 16384
0 % complete.Erasing 16 Kibyte nand_erase: start = 0x00124000, len = 16384
@ d4000 -- 41 % complete.Erasinnand_erase: start = 0x00128000, len = 16384
g 16 Kibyte @ d8000 -- 42 % compnand_erase: start = 0x0012c000, len = 16384
lete.Erasing 16 Kibyte @ dc000 nand_erase: start = 0x00130000, len = 16384
-- 42 % complete.Erasing 16 Kibnand_erase: start = 0x00134000, len = 16384
yte @ e0000 -- 43 % complete.Ernand_erase: start = 0x00138000, len = 16384
asing 16 Kibyte @ e4000 -- 44 % nand_erase: start = 0x0013c000, len = 16384
complete.Erasing 16 Kibyte @ e8nand_erase: start = 0x00140000, len = 16384
000 -- 45 % complete.Erasing 16nand_erase: start = 0x00144000, len = 16384
 Kibyte @ ec000 -- 46 % completenand_erase: start = 0x00148000, len = 16384
.Erasing 16 Kibyte @ f0000 -- 4nand_erase: start = 0x0014c000, len = 16384
6 % complete.Erasing 16 Kibyte nand_erase: start = 0x00150000, len = 16384
@ f4000 -- 47 % complete.Erasinnand_erase: start = 0x00154000, len = 16384
g 16 Kibyte @ f8000 -- 48 % compnand_erase: start = 0x00158000, len = 16384
lete.Erasing 16 Kibyte @ fc000 nand_erase: start = 0x0015c000, len = 16384
-- 49 % complete.Erasing 16 Kibnand_erase: start = 0x00160000, len = 16384
yte @ 100000 -- 50 % complete.Enand_erase: start = 0x00164000, len = 16384
rasing 16 Kibyte @ 104000 -- 50 nand_erase: start = 0x00168000, len = 16384
% complete.Erasing 16 Kibyte @ nand_erase: start = 0x0016c000, len = 16384
108000 -- 51 % complete.Erasingnand_erase: start = 0x00170000, len = 16384
 16 Kibyte @ 10c000 -- 52 % compnand_erase: start = 0x00174000, len = 16384
lete.Erasing 16 Kibyte @ 110000nand_erase: start = 0x00178000, len = 16384
 -- 53 % complete.Erasing 16 Kinand_erase: start = 0x0017c000, len = 16384
byte @ 114000 -- 53 % complete.nand_erase: start = 0x00180000, len = 16384
Erasing 16 Kibyte @ 118000 -- 54nand_erase: start = 0x00184000, len = 16384
 % complete.Erasing 16 Kibyte @nand_erase: start = 0x00188000, len = 16384
 11c000 -- 55 % complete.Erasinnand_erase: start = 0x0018c000, len = 16384
g 16 Kibyte @ 120000 -- 56 % comnand_erase: start = 0x00190000, len = 16384
plete.Erasing 16 Kibyte @ 12400nand_erase: start = 0x00194000, len = 16384
0 -- 57 % complete.Erasing 16 Knand_erase: start = 0x00198000, len = 16384
ibyte @ 128000 -- 57 % complete.nand_erase: start = 0x0019c000, len = 16384
Erasing 16 Kibyte @ 12c000 -- 5nand_erase: start = 0x001a0000, len = 16384
8 % complete.Erasing 16 Kibyte nand_erase: start = 0x001a4000, len = 16384
@ 130000 -- 59 % complete.Erasinand_erase: start = 0x001a8000, len = 16384
ng 16 Kibyte @ 134000 -- 60 % conand_erase: start = 0x001ac000, len = 16384
mplete.Erasing 16 Kibyte @ 1380nand_erase: start = 0x001b0000, len = 16384
00 -- 60 % complete.Erasing 16 nand_erase: start = 0x001b4000, len = 16384
Kibyte @ 13c000 -- 61 % completenand_erase: start = 0x001b8000, len = 16384
.Erasing 16 Kibyte @ 140000 -- nand_erase: start = 0x001bc000, len = 16384
62 % complete.Erasing 16 Kibytenand_erase: start = 0x001c0000, len = 16384
 @ 144000 -- 63 % complete.Erasnand_erase: start = 0x001c4000, len = 16384
ing 16 Kibyte @ 148000 -- 64 % cnand_erase: start = 0x001c8000, len = 16384
omplete.Erasing 16 Kibyte @ 14cnand_erase: start = 0x001cc000, len = 16384
000 -- 64 % complete.Erasing 16nand_erase: start = 0x001d0000, len = 16384
 Kibyte @ 150000 -- 65 % completnand_erase: start = 0x001d4000, len = 16384
e.Erasing 16 Kibyte @ 154000 --nand_erase: start = 0x001d8000, len = 16384
 66 % complete.Erasing 16 Kibytnand_erase: start = 0x001dc000, len = 16384
e @ 158000 -- 67 % complete.Eranand_erase: start = 0x001e0000, len = 16384
sing 16 Kibyte @ 15c000 -- 67 % nand_erase: start = 0x001e4000, len = 16384
complete.Erasing 16 Kibyte @ 16nand_erase: start = 0x001e8000, len = 16384
0000 -- 68 % complete.Erasing 1nand_erase: start = 0x001ec000, len = 16384
6 Kibyte @ 164000 -- 69 % complenand_erase: start = 0x001f0000, len = 16384
te.Erasing 16 Kibyte @ 168000 -nand_erase: start = 0x001f4000, len = 16384
- 70 % complete.Erasing 16 Kibynand_erase: start = 0x001f8000, len = 16384
te @ 16c000 -- 71 % complete.Ernand_erase: start = 0x001fc000, len = 16384
asing 16 Kibyte @ 170000 -- 71 %nand_sync: called
 complete.Erasing 16 Kibyte @ 174000 -- 72 % complete.Erasing 16 Kibyte @
178000 -- 73 % complete.Erasing 16 Kibyte @ 17c000 -- 74 % complete.Erasing
16 Kibyte @ 180000 -- 75 % complete.Erasing 16 Kibyte @ 184000 -- 75 %
complete.Erasing 16 Kibyte @ 188000 -- 76 % complete.Erasing 16 Kibyte @
18c000 -- 77 % complete.Erasing 16 Kibyte @ 190000 -- 78 % complete.Erasing
16 Kibyte @ 194000 -- 78 % complete.Erasing 16 Kibyte @ 198000 -- 79 %
complete.Erasing 16 Kibyte @ 19c000 -- 80 % complete.Erasing 16 Kibyte @
1a0000 -- 81 % complete.Erasing 16 Kibyte @ 1a4000 -- 82 % complete.Erasing
16 Kibyte @ 1a8000 -- 82 % complete.Erasing 16 Kibyte @ 1ac000 -- 83 %
complete.Erasing 16 Kibyte @ 1b0000 -- 84 % complete.Erasing 16 Kibyte @
1b4000 -- 85 % complete.Erasing 16 Kibyte @ 1b8000 -- 85 % complete.Erasing
16 Kibyte @ 1bc000 -- 86 % complete.Erasing 16 Kibyte @ 1c0000 -- 87 %
complete.Erasing 16 Kibyte @ 1c4000 -- 88 % complete.Erasing 16 Kibyte @
1c8000 -- 89 % complete.Erasing 16 Kibyte @ 1cc000 -- 89 % complete.Erasing
16 Kibyte @ 1d0000 -- 90 % complete.Erasing 16 Kibyte @ 1d4000 -- 91 %
complete.Erasing 16 Kibyte @ 1d8000 -- 92 % complete.Erasing 16 Kibyte @
1dc000 -- 92 % complete.Erasing 16 Kibyte @ 1e0000 -- 93 % complete.Erasing
16 Kibyte @ 1e4000 -- 94 % complete.Erasing 16 Kibyte @ 1e8000 -- 95 %
complete.Erasing 16 Kibyte @ 1ec000 -- 96 % complete.Erasing 16 Kibyte @
1f0000 -- 96 % complete.Erasing 16 Kibyte @ 1f4000 -- 97 % complete.Erasing
16 Kibyte @ 1f8000 -- 98 % complete.Erasing 16 Kibyte @ 1fc000 -- 99 %
complete.Erased 2048 Kibyte @ 0 -- 100% complete.

debian:/home# cp jffs.bin test.jffs /dev/mtd0

nand_write_ecc: to = 0x00000000, len = 4096
nand_write_ecc: to = 0x00001000, len = 4096
nand_write_ecc: to = 0x00002000, len = 4096
nand_write_ecc: to = 0x00003000, len = 4096
nand_write_ecc: to = 0x00004000, len = 4096
nand_write_ecc: to = 0x00005000, len = 4096
nand_write_ecc: to = 0x00006000, len = 4096
nand_write_ecc: to = 0x00007000, len = 4096
nand_write_ecc: to = 0x00008000, len = 4096
nand_write_ecc: to = 0x00009000, len = 4096
nand_write_ecc: to = 0x0000a000, len = 4096
nand_write_ecc: to = 0x0000b000, len = 4096
nand_write_ecc: to = 0x0000c000, len = 4096
nand_write_ecc: to = 0x0000d000, len = 4096
nand_write_ecc: to = 0x0000e000, len = 4096
nand_write_ecc: to = 0x0000f000, len = 4096
nand_write_ecc: to = 0x00010000, len = 4096
nand_write_ecc: to = 0x00011000, len = 4096
nand_write_ecc: to = 0x00012000, len = 4096
nand_write_ecc: to = 0x00013000, len = 4096
nand_write_ecc: to = 0x00014000, len = 4096
nand_write_ecc: to = 0x00015000, len = 4096
nand_write_ecc: to = 0x00016000, len = 4096
nand_write_ecc: to = 0x00017000, len = 4096
nand_write_ecc: to = 0x00018000, len = 4096
nand_write_ecc: to = 0x00019000, len = 4096
nand_write_ecc: to = 0x0001a000, len = 4096
nand_write_ecc: to = 0x0001b000, len = 4096
nand_write_ecc: to = 0x0001c000, len = 4096
nand_write_ecc: to = 0x0001d000, len = 4096
nand_write_ecc: to = 0x0001e000, len = 4096
nand_write_ecc: to = 0x0001f000, len = 4096
nand_write_ecc: to = 0x00020000, len = 4096
nand_write_ecc: to = 0x00021000, len = 4096
nand_write_ecc: to = 0x00022000, len = 4096
nand_write_ecc: to = 0x00023000, len = 4096
nand_write_ecc: to = 0x00024000, len = 4096
nand_write_ecc: to = 0x00025000, len = 4096
nand_write_ecc: to = 0x00026000, len = 4096
nand_write_ecc: to = 0x00027000, len = 4096
nand_write_ecc: to = 0x00028000, len = 4096
nand_write_ecc: to = 0x00029000, len = 4096
nand_write_ecc: to = 0x0002a000, len = 4096
nand_write_ecc: to = 0x0002b000, len = 4096
nand_write_ecc: to = 0x0002c000, len = 4096
nand_write_ecc: to = 0x0002d000, len = 4096
nand_write_ecc: to = 0x0002e000, len = 4096
nand_write_ecc: to = 0x0002f000, len = 4096
nand_write_ecc: to = 0x00030000, len = 4096
nand_write_ecc: to = 0x00031000, len = 4096
nand_write_ecc: to = 0x00032000, len = 4096
nand_write_ecc: to = 0x00033000, len = 4096
nand_write_ecc: to = 0x00034000, len = 4096
nand_write_ecc: to = 0x00035000, len = 4096
nand_write_ecc: to = 0x00036000, len = 4096
nand_write_ecc: to = 0x00037000, len = 4096
nand_write_ecc: to = 0x00038000, len = 4096
nand_write_ecc: to = 0x00039000, len = 4096
nand_write_ecc: to = 0x0003a000, len = 4096
nand_write_ecc: to = 0x0003b000, len = 4096
nand_write_ecc: to = 0x0003c000, len = 4096
nand_write_ecc: to = 0x0003d000, len = 4096
nand_write_ecc: to = 0x0003e000, len = 4096
nand_write_ecc: to = 0x0003f000, len = 4096
nand_write_ecc: to = 0x00040000, len = 4096
nand_write_ecc: to = 0x00041000, len = 4096
nand_write_ecc: to = 0x00042000, len = 4096
nand_write_ecc: to = 0x00043000, len = 4096
nand_write_ecc: to = 0x00044000, len = 4096
nand_write_ecc: to = 0x00045000, len = 4096
nand_write_ecc: to = 0x00046000, len = 4096
nand_write_ecc: to = 0x00047000, len = 4096
nand_write_ecc: to = 0x00048000, len = 4096
nand_write_ecc: to = 0x00049000, len = 4096
nand_write_ecc: to = 0x0004a000, len = 4096
nand_write_ecc: to = 0x0004b000, len = 4096
nand_write_ecc: to = 0x0004c000, len = 4096
nand_write_ecc: to = 0x0004d000, len = 4096
nand_write_ecc: to = 0x0004e000, len = 4096
nand_write_ecc: to = 0x0004f000, len = 4096
nand_write_ecc: to = 0x00050000, len = 4096
nand_write_ecc: to = 0x00051000, len = 4096
nand_write_ecc: to = 0x00052000, len = 4096
nand_write_ecc: to = 0x00053000, len = 4096
nand_write_ecc: to = 0x00054000, len = 4096
nand_write_ecc: to = 0x00055000, len = 4096
nand_write_ecc: to = 0x00056000, len = 4096
nand_write_ecc: to = 0x00057000, len = 4096
nand_write_ecc: to = 0x00058000, len = 4096
nand_write_ecc: to = 0x00059000, len = 4096
nand_write_ecc: to = 0x0005a000, len = 4096
nand_write_ecc: to = 0x0005b000, len = 4096
nand_write_ecc: to = 0x0005c000, len = 4096
nand_write_ecc: to = 0x0005d000, len = 4096
nand_write_ecc: to = 0x0005e000, len = 4096
nand_write_ecc: to = 0x0005f000, len = 4096
nand_write_ecc: to = 0x00060000, len = 4096
nand_write_ecc: to = 0x00061000, len = 4096
nand_write_ecc: to = 0x00062000, len = 4096
nand_write_ecc: to = 0x00063000, len = 4096
nand_write_ecc: to = 0x00064000, len = 4096
nand_write_ecc: to = 0x00065000, len = 4096
nand_write_ecc: to = 0x00066000, len = 4096
nand_write_ecc: to = 0x00067000, len = 4096
nand_write_ecc: to = 0x00068000, len = 4096
nand_write_ecc: to = 0x00069000, len = 4096
nand_write_ecc: to = 0x0006a000, len = 4096
nand_write_ecc: to = 0x0006b000, len = 4096
nand_write_ecc: to = 0x0006c000, len = 4096
nand_write_ecc: to = 0x0006d000, len = 4096
nand_write_ecc: to = 0x0006e000, len = 4096
nand_write_ecc: to = 0x0006f000, len = 4096
nand_write_ecc: to = 0x00070000, len = 144
nand_sync: called

debian:/home# mount -t jffs2 /dev/mtdblock0 /mnt/nand/

nand_read_ecc: from = 0x00000000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x3438 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
0x3e3b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0x3e38 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0x3e38 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000030:
0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000003c:
0x3438 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000050:
0x03f8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000054:
0x3e3a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000058:
0x3e36 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000005c:
0x3e36 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000003f8, len = 4096
Empty flash at 0x00000dc8 ends at 0x00000dcc
Empty flash at 0x00000dd0 ends at 0x00000dd4
nand_read_ecc: from = 0x000013f0, len = 4096
nand_read_ecc: from = 0x000023e8, len = 4096
nand_read_ecc: from = 0x000033e0, len = 3104
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
nand_read_ecc: from = 0x00004000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004000:
0x5f32 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004004:
0x005f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004008:
0x7472 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000400c:
0x756c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004010:
0x6e74 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004014:
0x6e61 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004018:
0x4047 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000401c:
0x4243 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004020:
0x2e30 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004024:
0x6174 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000043f8, len = 4096
Empty flash at 0x00004e98 ends at 0x00004e9c
Empty flash at 0x00004ea0 ends at 0x00004ea4
nand_read_ecc: from = 0x000053f0, len = 4096
nand_read_ecc: from = 0x000063e8, len = 4096
nand_read_ecc: from = 0x000073e0, len = 3104
JFFS2: Erase block at 0x00004000 is not formatted. It will be erased
nand_read_ecc: from = 0x00008000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008000:
0x5f73 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008004:
0x7274 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008008:
0x6169 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000800c:
0x5f5f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008010:
0x6263 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008014:
0x7461 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008018:
0x5f6d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000801c:
0x6e40 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008020:
0x4c49 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00008024:
0x5f32 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000083f8, len = 4096
Empty flash at 0x00008f6c ends at 0x00008f70
Empty flash at 0x00008f74 ends at 0x00008f78
nand_read_ecc: from = 0x000093f0, len = 4096
nand_read_ecc: from = 0x0000a3e8, len = 4096
nand_read_ecc: from = 0x0000b3e0, len = 3104
JFFS2: Erase block at 0x00008000 is not formatted. It will be erased
nand_read_ecc: from = 0x0000c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c000:
0x696c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c004:
0x7465 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c008:
0x2f62 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c00c:
0x6c64 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c010:
0x6c69 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c014:
0x2d32 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c018:
0x2e35 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c01c:
0x7375 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c020:
0x7274 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c024:
0x5300 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0000c3f8, len = 4096
Empty flash at 0x0000d2b4 ends at 0x0000d2b8
Empty flash at 0x0000d2bc ends at 0x0000d2c0
nand_read_ecc: from = 0x0000d3f0, len = 4096
nand_read_ecc: from = 0x0000e3e8, len = 4096
nand_read_ecc: from = 0x0000f3e0, len = 3104
JFFS2: Erase block at 0x0000c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00010000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010000:
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010008:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010010:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010018:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010020:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010028:
0x2000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010030:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010038:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010040:
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010048:
0x1200 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000103f8, len = 4096
nand_read_ecc: from = 0x000113f0, len = 4096
Empty flash at 0x00011b30 ends at 0x00011b34
Empty flash at 0x00011b38 ends at 0x00011b3c
nand_read_ecc: from = 0x000123e8, len = 4096
nand_read_ecc: from = 0x000133e0, len = 3104
JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
nand_read_ecc: from = 0x00014000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00014014:
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001403c:
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00014064:
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001408c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000140b4:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000140dc:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00014104:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001412c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00014154:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001417c:
0x1001 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000143f8, len = 4096
nand_read_ecc: from = 0x000153f0, len = 4096
nand_read_ecc: from = 0x000163e8, len = 4096
nand_read_ecc: from = 0x000173e0, len = 3104
Empty flash at 0x00017e4c ends at 0x00017e50
Empty flash at 0x00017e54 ends at 0x00017e58
JFFS2: Erase block at 0x00014000 is not formatted. It will be erased
nand_read_ecc: from = 0x00018000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018008:
0xa200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018014:
0xa200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018020:
0xa200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001802c:
0x8200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018038:
0x8000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018044:
0xa200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018050:
0x8000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001805c:
0x8000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018068:
0x8000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00018074:
0x8000 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000183f8, len = 4096
nand_read_ecc: from = 0x000193f0, len = 4096
nand_read_ecc: from = 0x0001a3e8, len = 4096
nand_read_ecc: from = 0x0001b3e0, len = 3104
JFFS2: Erase block at 0x00018000 is not formatted. It will be erased
nand_read_ecc: from = 0x0001c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c000:
0x3863 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c004:
0x4801 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c008:
0x7e23 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c00c:
0x4801 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c010:
0x3860 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c014:
0x4801 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c018:
0x2c1e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c01c:
0x3b60 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c020:
0x81c1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c024:
0x8281 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0001c3f8, len = 4096
Empty flash at 0x0001c7bc ends at 0x0001c7c0
Empty flash at 0x0001c7c4 ends at 0x0001c7c8
nand_read_ecc: from = 0x0001d3f0, len = 4096
nand_read_ecc: from = 0x0001e3e8, len = 4096
nand_read_ecc: from = 0x0001f3e0, len = 3104
JFFS2: Erase block at 0x0001c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00020000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000:
0x4801 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004:
0x9421 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008:
0x7c08 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002000c:
0x93c1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020010:
0x93e1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020014:
0x9001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020018:
0x4801 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002001c:
0x7fc8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020020:
0x801e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020024:
0x2c00 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000203f8, len = 4096
Empty flash at 0x00020d30 ends at 0x00020d38
Empty flash at 0x00020e00 ends at 0x00020e04
Empty flash at 0x00020e08 ends at 0x00020e0c
nand_read_ecc: from = 0x000213f0, len = 4096
nand_read_ecc: from = 0x000223e8, len = 4096
nand_read_ecc: from = 0x000233e0, len = 3104
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
nand_read_ecc: from = 0x00024000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024000:
0x005f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024004:
0x7373 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024008:
0x7461 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002400c:
0x006d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024010:
0x6e00 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024014:
0x6c69 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024018:
0x5f73 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002401c:
0x7274 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024020:
0x6169 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00024024:
0x4047 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000243f8, len = 4096
Empty flash at 0x00024ba0 ends at 0x00024ba4
Empty flash at 0x00024ba8 ends at 0x00024bac
nand_read_ecc: from = 0x000253f0, len = 4096
nand_read_ecc: from = 0x000263e8, len = 4096
nand_read_ecc: from = 0x000273e0, len = 3104
JFFS2: Erase block at 0x00024000 is not formatted. It will be erased
nand_read_ecc: from = 0x00028000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028018:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028020:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028028:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028030:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028038:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028040:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028048:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028050:
0x1200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028058:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00028060:
0x1200 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000283f8, len = 4096
Empty flash at 0x000292f8 ends at 0x000292fc
Empty flash at 0x00029300 ends at 0x00029304
Empty flash at 0x0002931c ends at 0x00029320
nand_read_ecc: from = 0x000293f0, len = 4096
nand_read_ecc: from = 0x0002a3e8, len = 4096
nand_read_ecc: from = 0x0002b3e0, len = 3104
JFFS2: Erase block at 0x00028000 is not formatted. It will be erased
nand_read_ecc: from = 0x0002c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c004:
0x0100 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c00c:
0x1000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c014:
0x0200 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c01c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c02c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c03c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c04c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c05c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c06c:
0x1001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002c07c:
0x1000 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0002c3f8, len = 4096
nand_read_ecc: from = 0x0002d3f0, len = 4096
Empty flash at 0x0002e1dc ends at 0x0002e1e0
Empty flash at 0x0002e1e4 ends at 0x0002e1e8
nand_read_ecc: from = 0x0002e3e8, len = 4096
nand_read_ecc: from = 0x0002f3e0, len = 3104
JFFS2: Erase block at 0x0002c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00030000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030000:
0x292c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030004:
0x362c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030008:
0x3b5f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003000c:
0x6178 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030010:
0x6565 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030014:
0x645f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030018:
0x6f6d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003001c:
0x302c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030020:
0x2c32 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030024:
0x2c33 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000303f8, len = 4096
nand_read_ecc: from = 0x000313f0, len = 4096
nand_read_ecc: from = 0x000323e8, len = 4096
nand_read_ecc: from = 0x000333e0, len = 3104
JFFS2: Erase block at 0x00030000 is not formatted. It will be erased
nand_read_ecc: from = 0x00034000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034000:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034004:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034008:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003400c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034010:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034014:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034018:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003401c:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034020:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00034024:
0x3030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000343f8, len = 4096
nand_read_ecc: from = 0x000353f0, len = 4096
nand_read_ecc: from = 0x000363e8, len = 4096
nand_read_ecc: from = 0x000373e0, len = 3104
JFFS2: Erase block at 0x00034000 is not formatted. It will be erased
nand_read_ecc: from = 0x00038000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038000:
0x3130 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038004:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038008:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003800c:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038010:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038014:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038018:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003801c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038020:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00038024:
0x2030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000383f8, len = 4096
nand_read_ecc: from = 0x000393f0, len = 4096
nand_read_ecc: from = 0x0003a3e8, len = 4096
nand_read_ecc: from = 0x0003b3e0, len = 3104
JFFS2: Erase block at 0x00038000 is not formatted. It will be erased
nand_read_ecc: from = 0x0003c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c000:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c004:
0x3830 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c008:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c00c:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c010:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c014:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c018:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c01c:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c020:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003c024:
0x3020 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0003c3f8, len = 4096
nand_read_ecc: from = 0x0003d3f0, len = 4096
nand_read_ecc: from = 0x0003e3e8, len = 4096
nand_read_ecc: from = 0x0003f3e0, len = 3104
JFFS2: Erase block at 0x0003c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00040000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
0x6630 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004000c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040010:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040014:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040018:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004001c:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040020:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040024:
0x3030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000403f8, len = 4096
nand_read_ecc: from = 0x000413f0, len = 4096
nand_read_ecc: from = 0x000423e8, len = 4096
nand_read_ecc: from = 0x000433e0, len = 3104
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
nand_read_ecc: from = 0x00044000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044000:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044004:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044008:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004400c:
0x3530 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044010:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044014:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044018:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004401c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044020:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00044024:
0x2030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000443f8, len = 4096
nand_read_ecc: from = 0x000453f0, len = 4096
nand_read_ecc: from = 0x000463e8, len = 4096
nand_read_ecc: from = 0x000473e0, len = 3104
JFFS2: Erase block at 0x00044000 is not formatted. It will be erased
nand_read_ecc: from = 0x00048000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048000:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048004:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048008:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004800c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048010:
0x6330 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048014:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048018:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004801c:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048020:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00048024:
0x3020 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000483f8, len = 4096
nand_read_ecc: from = 0x000493f0, len = 4096
nand_read_ecc: from = 0x0004a3e8, len = 4096
nand_read_ecc: from = 0x0004b3e0, len = 3104
JFFS2: Erase block at 0x00048000 is not formatted. It will be erased
nand_read_ecc: from = 0x0004c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c000:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c004:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c008:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c00c:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c010:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c014:
0x3330 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c018:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c01c:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c020:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0004c024:
0x3030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0004c3f8, len = 4096
nand_read_ecc: from = 0x0004d3f0, len = 4096
nand_read_ecc: from = 0x0004e3e8, len = 4096
nand_read_ecc: from = 0x0004f3e0, len = 3104
JFFS2: Erase block at 0x0004c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00050000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050000:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050004:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050008:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005000c:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050010:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050014:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050018:
0x6130 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005001c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050020:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050024:
0x2030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000503f8, len = 4096
nand_read_ecc: from = 0x000513f0, len = 4096
nand_read_ecc: from = 0x000523e8, len = 4096
nand_read_ecc: from = 0x000533e0, len = 3104
JFFS2: Erase block at 0x00050000 is not formatted. It will be erased
nand_read_ecc: from = 0x00054000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054000:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054004:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054008:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005400c:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054010:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054014:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054018:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005401c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054020:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00054024:
0x3020 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000543f8, len = 4096
nand_read_ecc: from = 0x000553f0, len = 4096
nand_read_ecc: from = 0x000563e8, len = 4096
nand_read_ecc: from = 0x000573e0, len = 3104
JFFS2: Erase block at 0x00054000 is not formatted. It will be erased
nand_read_ecc: from = 0x00058000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058000:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058004:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058008:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005800c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058010:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058014:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058018:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005801c:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058020:
0x3730 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00058024:
0x3030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000583f8, len = 4096
nand_read_ecc: from = 0x000593f0, len = 4096
nand_read_ecc: from = 0x0005a3e8, len = 4096
nand_read_ecc: from = 0x0005b3e0, len = 3104
JFFS2: Erase block at 0x00058000 is not formatted. It will be erased
nand_read_ecc: from = 0x0005c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c000:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c004:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c008:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c00c:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c010:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c014:
0x3020 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c018:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c01c:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c020:
0x3030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005c024:
0x6530 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0005c3f8, len = 4096
nand_read_ecc: from = 0x0005d3f0, len = 4096
nand_read_ecc: from = 0x0005e3e8, len = 4096
nand_read_ecc: from = 0x0005f3e0, len = 3104
JFFS2: Erase block at 0x0005c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00060000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060000:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060008:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006000c:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060010:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060014:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060018:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006001c:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060020:
0x3078 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060024:
0x3030 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000603f8, len = 4096
nand_read_ecc: from = 0x000613f0, len = 4096
nand_read_ecc: from = 0x000623e8, len = 4096
nand_read_ecc: from = 0x000633e0, len = 3104
JFFS2: Erase block at 0x00060000 is not formatted. It will be erased
nand_read_ecc: from = 0x00064000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064000:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064004:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064008:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006400c:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064010:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064014:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064018:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006401c:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064020:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00064024:
0x3078 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000643f8, len = 4096
nand_read_ecc: from = 0x000653f0, len = 4096
nand_read_ecc: from = 0x000663e8, len = 4096
nand_read_ecc: from = 0x000673e0, len = 3104
JFFS2: Erase block at 0x00064000 is not formatted. It will be erased
nand_read_ecc: from = 0x00068000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068000:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068004:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068008:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006800c:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068010:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068014:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068018:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006801c:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068020:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00068024:
0x2066 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x000683f8, len = 4096
nand_read_ecc: from = 0x000693f0, len = 4096
nand_read_ecc: from = 0x0006a3e8, len = 4096
nand_read_ecc: from = 0x0006b3e0, len = 3104
JFFS2: Erase block at 0x00068000 is not formatted. It will be erased
nand_read_ecc: from = 0x0006c000, len = 1024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c000:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c004:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c008:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c00c:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c010:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c014:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c018:
0x6620 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c01c:
0x2066 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c020:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0006c024:
0x6620 instead
Further such events for this erase block will not be printed
nand_read_ecc: from = 0x0006c3f8, len = 4096
nand_read_ecc: from = 0x0006d3f0, len = 4096
nand_read_ecc: from = 0x0006e3e8, len = 4096
nand_read_ecc: from = 0x0006f3e0, len = 3104
JFFS2: Erase block at 0x0006c000 is not formatted. It will be erased
nand_read_ecc: from = 0x00070000, len = 1024
nand_read_ecc: from = 0x00074000, len = 1024
nand_read_ecc: from = 0x00078000, len = 1024
nand_read_ecc: from = 0x0007c000, len = 1024
nand_read_ecc: from = 0x00080000, len = 1024
nand_read_ecc: from = 0x00084000, len = 1024
nand_read_ecc: from = 0x00088000, len = 1024
nand_read_ecc: from = 0x0008c000, len = 1024
nand_read_ecc: from = 0x00090000, len = 1024
nand_read_ecc: from = 0x00094000, len = 1024
nand_read_ecc: from = 0x00098000, len = 1024
nand_read_ecc: from = 0x0009c000, len = 1024
nand_read_ecc: from = 0x000a0000, len = 1024
nand_read_ecc: from = 0x000a4000, len = 1024
nand_read_ecc: from = 0x000a8000, len = 1024
nand_read_ecc: from = 0x000ac000, len = 1024
nand_read_ecc: from = 0x000b0000, len = 1024
nand_read_ecc: from = 0x000b4000, len = 1024
nand_read_ecc: from = 0x000b8000, len = 1024
nand_read_ecc: from = 0x000bc000, len = 1024
nand_read_ecc: from = 0x000c0000, len = 1024
nand_read_ecc: from = 0x000c4000, len = 1024
nand_read_ecc: from = 0x000c8000, len = 1024
nand_read_ecc: from = 0x000cc000, len = 1024
nand_read_ecc: from = 0x000d0000, len = 1024
nand_read_ecc: from = 0x000d4000, len = 1024
nand_read_ecc: from = 0x000d8000, len = 1024
nand_read_ecc: from = 0x000dc000, len = 1024
nand_read_ecc: from = 0x000e0000, len = 1024
nand_read_ecc: from = 0x000e4000, len = 1024
nand_read_ecc: from = 0x000e8000, len = 1024
nand_read_ecc: from = 0x000ec000, len = 1024
nand_read_ecc: from = 0x000f0000, len = 1024
nand_read_ecc: from = 0x000f4000, len = 1024
nand_read_ecc: from = 0x000f8000, len = 1024
nand_read_ecc: from = 0x000fc000, len = 1024
nand_read_ecc: from = 0x00100000, len = 1024
nand_read_ecc: from = 0x00104000, len = 1024
nand_read_ecc: from = 0x00108000, len = 1024
nand_read_ecc: from = 0x0010c000, len = 1024
nand_read_ecc: from = 0x00110000, len = 1024
nand_read_ecc: from = 0x00114000, len = 1024
nand_read_ecc: from = 0x00118000, len = 1024
nand_read_ecc: from = 0x0011c000, len = 1024
nand_read_ecc: from = 0x00120000, len = 1024
nand_read_ecc: from = 0x00124000, len = 1024
nand_read_ecc: from = 0x00128000, len = 1024
nand_read_ecc: from = 0x0012c000, len = 1024
nand_read_ecc: from = 0x00130000, len = 1024
nand_read_ecc: from = 0x00134000, len = 1024
nand_read_ecc: from = 0x00138000, len = 1024
nand_read_ecc: from = 0x0013c000, len = 1024
nand_read_ecc: from = 0x00140000, len = 1024
nand_read_ecc: from = 0x00144000, len = 1024
nand_read_ecc: from = 0x00148000, len = 1024
nand_read_ecc: from = 0x0014c000, len = 1024
nand_read_ecc: from = 0x00150000, len = 1024
nand_read_ecc: from = 0x00154000, len = 1024
nand_read_ecc: from = 0x00158000, len = 1024
nand_read_ecc: from = 0x0015c000, len = 1024
nand_read_ecc: from = 0x00160000, len = 1024
nand_read_ecc: from = 0x00164000, len = 1024
nand_read_ecc: from = 0x00168000, len = 1024
nand_read_ecc: from = 0x0016c000, len = 1024
nand_read_ecc: from = 0x00170000, len = 1024
nand_read_ecc: from = 0x00174000, len = 1024
nand_read_ecc: from = 0x00178000, len = 1024
nand_read_ecc: from = 0x0017c000, len = 1024
nand_read_ecc: from = 0x00180000, len = 1024
nand_read_ecc: from = 0x00184000, len = 1024
nand_read_ecc: from = 0x00188000, len = 1024
nand_read_ecc: from = 0x0018c000, len = 1024
nand_read_ecc: from = 0x00190000, len = 1024
nand_read_ecc: from = 0x00194000, len = 1024
nand_read_ecc: from = 0x00198000, len = 1024
nand_read_ecc: from = 0x0019c000, len = 1024
nand_read_ecc: from = 0x001a0000, len = 1024
nand_read_ecc: from = 0x001a4000, len = 1024
nand_read_ecc: from = 0x001a8000, len = 1024
nand_read_ecc: from = 0x001ac000, len = 1024
nand_read_ecc: from = 0x001b0000, len = 1024
nand_read_ecc: from = 0x001b4000, len = 1024
nand_read_ecc: from = 0x001b8000, len = 1024
nand_read_ecc: from = 0x001bc000, len = 1024
nand_read_ecc: from = 0x001c0000, len = 1024
nand_read_ecc: from = 0x001c4000, len = 1024
nand_read_ecc: from = 0x001c8000, len = 1024
nand_read_ecc: from = 0x001cc000, len = 1024
nand_read_ecc: from = 0x001d0000, len = 1024
nand_read_ecc: from = 0x001d4000, len = 1024
nand_read_ecc: from = 0x001d8000, len = 1024
nand_read_ecc: from = 0x001dc000, len = 1024
nand_read_ecc: from = 0x001e0000, len = 1024
nand_read_ecc: from = 0x001e4000, len = 1024
nand_read_ecc: from = 0x001e8000, len = 1024
nand_read_ecc: from = 0x001ec000, len = 1024
nand_read_ecc: from = 0x001f0000, len = 1024
nand_read_ecc: from = 0x001f4000, len = 1024
nand_read_ecc: from = 0x001f8000, len = 1024
nand_read_ecc: from = 0x001fc000, len = 1024
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 100, bad_blocks 0, c->nr_blocks 128
nand_sync: called
mount: wrong fs nand_sync: called
type, bad option, bad superblock on /dev/mtdblock0,
       or too many mounted file systems


==============================================================
    attempt N2
==============================================================

debian:/home# util/eraseall /dev/mtd0

Erasing 16 Kibynand_erase: start = 0x00000000, len = 16384
te @ 0 --  0 % complete.nand_erase: start = 0x00004000, len = 16384
Erasing 16 Kibyte @ 4000 --  0 nand_erase: start = 0x00008000, len = 16384
% complete.Erasing 16 Kibyte @ nand_erase: start = 0x0000c000, len = 16384
8000 --  1 % complete.Erasing 1nand_erase: start = 0x00010000, len = 16384
6 Kibyte @ c000 --  2 % completenand_erase: start = 0x00014000, len = 16384
.Erasing 16 Kibyte @ 10000 --  nand_erase: start = 0x00018000, len = 16384
3 % complete.Erasing 16 Kibyte nand_erase: start = 0x0001c000, len = 16384
@ 14000 --  3 % complete.Erasinnand_erase: start = 0x00020000, len = 16384
g 16 Kibyte @ 18000 --  4 % compnand_erase: start = 0x00024000, len = 16384
lete.Erasing 16 Kibyte @ 1c000 nand_erase: start = 0x00028000, len = 16384
--  5 % complete.Erasing 16 Kibnand_erase: start = 0x0002c000, len = 16384
yte @ 20000 --  6 % complete.Ernand_erase: start = 0x00030000, len = 16384
asing 16 Kibyte @ 24000 --  7 % nand_erase: start = 0x00034000, len = 16384
complete.Erasing 16 Kibyte @ 28nand_erase: start = 0x00038000, len = 16384
000 --  7 % complete.Erasing 16nand_erase: start = 0x0003c000, len = 16384
 Kibyte @ 2c000 --  8 % completenand_erase: start = 0x00040000, len = 16384
.Erasing 16 Kibyte @ 30000 --  nand_erase: start = 0x00044000, len = 16384
9 % complete.Erasing 16 Kibyte nand_erase: start = 0x00048000, len = 16384
@ 34000 -- 10 % complete.Erasinnand_erase: start = 0x0004c000, len = 16384
g 16 Kibyte @ 38000 -- 10 % compnand_erase: start = 0x00050000, len = 16384
lete.Erasing 16 Kibyte @ 3c000 nand_erase: start = 0x00054000, len = 16384
-- 11 % complete.Erasing 16 Kibnand_erase: start = 0x00058000, len = 16384
yte @ 40000 -- 12 % complete.Ernand_erase: start = 0x0005c000, len = 16384
asing 16 Kibyte @ 44000 -- 13 % nand_erase: start = 0x00060000, len = 16384
complete.Erasing 16 Kibyte @ 48nand_erase: start = 0x00064000, len = 16384
000 -- 14 % complete.Erasing 16nand_erase: start = 0x00068000, len = 16384
 Kibyte @ 4c000 -- 14 % completenand_erase: start = 0x0006c000, len = 16384
.Erasing 16 Kibyte @ 50000 -- 1nand_erase: start = 0x00070000, len = 16384
5 % complete.Erasing 16 Kibyte nand_erase: start = 0x00074000, len = 16384
@ 54000 -- 16 % complete.Erasinnand_erase: start = 0x00078000, len = 16384
g 16 Kibyte @ 58000 -- 17 % compnand_erase: start = 0x0007c000, len = 16384
lete.Erasing 16 Kibyte @ 5c000 nand_erase: start = 0x00080000, len = 16384
-- 17 % complete.Erasing 16 Kibnand_erase: start = 0x00084000, len = 16384
yte @ 60000 -- 18 % complete.Ernand_erase: start = 0x00088000, len = 16384
asing 16 Kibyte @ 64000 -- 19 % nand_erase: start = 0x0008c000, len = 16384
complete.Erasing 16 Kibyte @ 68nand_erase: start = 0x00090000, len = 16384
000 -- 20 % complete.Erasing 16nand_erase: start = 0x00094000, len = 16384
 Kibyte @ 6c000 -- 21 % completenand_erase: start = 0x00098000, len = 16384
.Erasing 16 Kibyte @ 70000 -- 2nand_erase: start = 0x0009c000, len = 16384
1 % complete.Erasing 16 Kibyte nand_erase: start = 0x000a0000, len = 16384
@ 74000 -- 22 % complete.Erasinnand_erase: start = 0x000a4000, len = 16384
g 16 Kibyte @ 78000 -- 23 % compnand_erase: start = 0x000a8000, len = 16384
lete.Erasing 16 Kibyte @ 7c000 nand_erase: start = 0x000ac000, len = 16384
-- 24 % complete.Erasing 16 Kibnand_erase: start = 0x000b0000, len = 16384
yte @ 80000 -- 25 % complete.Ernand_erase: start = 0x000b4000, len = 16384
asing 16 Kibyte @ 84000 -- 25 % nand_erase: start = 0x000b8000, len = 16384
complete.Erasing 16 Kibyte @ 88nand_erase: start = 0x000bc000, len = 16384
000 -- 26 % complete.Erasing 16nand_erase: start = 0x000c0000, len = 16384
 Kibyte @ 8c000 -- 27 % completenand_erase: start = 0x000c4000, len = 16384
.Erasing 16 Kibyte @ 90000 -- 2nand_erase: start = 0x000c8000, len = 16384
8 % complete.Erasing 16 Kibyte nand_erase: start = 0x000cc000, len = 16384
@ 94000 -- 28 % complete.Erasinnand_erase: start = 0x000d0000, len = 16384
g 16 Kibyte @ 98000 -- 29 % compnand_erase: start = 0x000d4000, len = 16384
lete.Erasing 16 Kibyte @ 9c000 nand_erase: start = 0x000d8000, len = 16384
-- 30 % complete.Erasing 16 Kibnand_erase: start = 0x000dc000, len = 16384
yte @ a0000 -- 31 % complete.Ernand_erase: start = 0x000e0000, len = 16384
asing 16 Kibyte @ a4000 -- 32 % nand_erase: start = 0x000e4000, len = 16384
complete.Erasing 16 Kibyte @ a8nand_erase: start = 0x000e8000, len = 16384
000 -- 32 % complete.Erasing 16nand_erase: start = 0x000ec000, len = 16384
 Kibyte @ ac000 -- 33 % completenand_erase: start = 0x000f0000, len = 16384
.Erasing 16 Kibyte @ b0000 -- 3nand_erase: start = 0x000f4000, len = 16384
4 % complete.Erasing 16 Kibyte nand_erase: start = 0x000f8000, len = 16384
@ b4000 -- 35 % complete.Erasinnand_erase: start = 0x000fc000, len = 16384
g 16 Kibyte @ b8000 -- 35 % compnand_erase: start = 0x00100000, len = 16384
lete.Erasing 16 Kibyte @ bc000 nand_erase: start = 0x00104000, len = 16384
-- 36 % complete.Erasing 16 Kibnand_erase: start = 0x00108000, len = 16384
yte @ c0000 -- 37 % complete.Ernand_erase: start = 0x0010c000, len = 16384
asing 16 Kibyte @ c4000 -- 38 % nand_erase: start = 0x00110000, len = 16384
complete.Erasing 16 Kibyte @ c8nand_erase: start = 0x00114000, len = 16384
000 -- 39 % complete.Erasing 16nand_erase: start = 0x00118000, len = 16384
 Kibyte @ cc000 -- 39 % completenand_erase: start = 0x0011c000, len = 16384
.Erasing 16 Kibyte @ d0000 -- 4nand_erase: start = 0x00120000, len = 16384
0 % complete.Erasing 16 Kibyte nand_erase: start = 0x00124000, len = 16384
@ d4000 -- 41 % complete.Erasinnand_erase: start = 0x00128000, len = 16384
g 16 Kibyte @ d8000 -- 42 % compnand_erase: start = 0x0012c000, len = 16384
lete.Erasing 16 Kibyte @ dc000 nand_erase: start = 0x00130000, len = 16384
-- 42 % complete.Erasing 16 Kibnand_erase: start = 0x00134000, len = 16384
yte @ e0000 -- 43 % complete.Ernand_erase: start = 0x00138000, len = 16384
asing 16 Kibyte @ e4000 -- 44 % nand_erase: start = 0x0013c000, len = 16384
complete.Erasing 16 Kibyte @ e8nand_erase: start = 0x00140000, len = 16384
000 -- 45 % complete.Erasing 16nand_erase: start = 0x00144000, len = 16384
 Kibyte @ ec000 -- 46 % completenand_erase: start = 0x00148000, len = 16384
.Erasing 16 Kibyte @ f0000 -- 4nand_erase: start = 0x0014c000, len = 16384
6 % complete.Erasing 16 Kibyte nand_erase: start = 0x00150000, len = 16384
@ f4000 -- 47 % complete.Erasinnand_erase: start = 0x00154000, len = 16384
g 16 Kibyte @ f8000 -- 48 % compnand_erase: start = 0x00158000, len = 16384
lete.Erasing 16 Kibyte @ fc000 nand_erase: start = 0x0015c000, len = 16384
-- 49 % complete.Erasing 16 Kibnand_erase: start = 0x00160000, len = 16384
yte @ 100000 -- 50 % complete.Enand_erase: start = 0x00164000, len = 16384
rasing 16 Kibyte @ 104000 -- 50 nand_erase: start = 0x00168000, len = 16384
% complete.Erasing 16 Kibyte @ nand_erase: start = 0x0016c000, len = 16384
108000 -- 51 % complete.Erasingnand_erase: start = 0x00170000, len = 16384
 16 Kibyte @ 10c000 -- 52 % compnand_erase: start = 0x00174000, len = 16384
lete.Erasing 16 Kibyte @ 110000nand_erase: start = 0x00178000, len = 16384
 -- 53 % complete.Erasing 16 Kinand_erase: start = 0x0017c000, len = 16384
byte @ 114000 -- 53 % complete.nand_erase: start = 0x00180000, len = 16384
Erasing 16 Kibyte @ 118000 -- 54nand_erase: start = 0x00184000, len = 16384
 % complete.Erasing 16 Kibyte @nand_erase: start = 0x00188000, len = 16384
 11c000 -- 55 % complete.Erasinnand_erase: start = 0x0018c000, len = 16384
g 16 Kibyte @ 120000 -- 56 % comnand_erase: start = 0x00190000, len = 16384
plete.Erasing 16 Kibyte @ 12400nand_erase: start = 0x00194000, len = 16384
0 -- 57 % complete.Erasing 16 Knand_erase: start = 0x00198000, len = 16384
ibyte @ 128000 -- 57 % complete.nand_erase: start = 0x0019c000, len = 16384
Erasing 16 Kibyte @ 12c000 -- 5nand_erase: start = 0x001a0000, len = 16384
8 % complete.Erasing 16 Kibyte nand_erase: start = 0x001a4000, len = 16384
@ 130000 -- 59 % complete.Erasinand_erase: start = 0x001a8000, len = 16384
ng 16 Kibyte @ 134000 -- 60 % conand_erase: start = 0x001ac000, len = 16384
mplete.Erasing 16 Kibyte @ 1380nand_erase: start = 0x001b0000, len = 16384
00 -- 60 % complete.Erasing 16 nand_erase: start = 0x001b4000, len = 16384
Kibyte @ 13c000 -- 61 % completenand_erase: start = 0x001b8000, len = 16384
.Erasing 16 Kibyte @ 140000 -- nand_erase: start = 0x001bc000, len = 16384
62 % complete.Erasing 16 Kibytenand_erase: start = 0x001c0000, len = 16384
 @ 144000 -- 63 % complete.Erasnand_erase: start = 0x001c4000, len = 16384
ing 16 Kibyte @ 148000 -- 64 % cnand_erase: start = 0x001c8000, len = 16384
omplete.Erasing 16 Kibyte @ 14cnand_erase: start = 0x001cc000, len = 16384
000 -- 64 % complete.Erasing 16nand_erase: start = 0x001d0000, len = 16384
 Kibyte @ 150000 -- 65 % completnand_erase: start = 0x001d4000, len = 16384
e.Erasing 16 Kibyte @ 154000 --nand_erase: start = 0x001d8000, len = 16384
 66 % complete.Erasing 16 Kibytnand_erase: start = 0x001dc000, len = 16384
e @ 158000 -- 67 % complete.Eranand_erase: start = 0x001e0000, len = 16384
sing 16 Kibyte @ 15c000 -- 67 % nand_erase: start = 0x001e4000, len = 16384
complete.Erasing 16 Kibyte @ 16nand_erase: start = 0x001e8000, len = 16384
0000 -- 68 % complete.Erasing 1nand_erase: start = 0x001ec000, len = 16384
6 Kibyte @ 164000 -- 69 % complenand_erase: start = 0x001f0000, len = 16384
te.Erasing 16 Kibyte @ 168000 -nand_erase: start = 0x001f4000, len = 16384
- 70 % complete.Erasing 16 Kibynand_erase: start = 0x001f8000, len = 16384
te @ 16c000 -- 71 % complete.Ernand_erase: start = 0x001fc000, len = 16384
asing 16 Kibyte @ 170000 -- 71 %nand_sync: called
 complete.Erasing 16 Kibyte @ 174000 -- 72 % complete.
 Erasing 16 Kibyte @ 178000 -- 73 % complete.
 Erasing 16 Kibyte @ 17c000 -- 74 % complete.
 Erasing 16 Kibyte @ 180000 -- 75 % complete.
 Erasing 16 Kibyte @ 184000 -- 75 % complete.
 Erasing 16 Kibyte @ 188000 -- 76 % complete.
 Erasing 16 Kibyte @ 18c000 -- 77 % complete.
 Erasing 16 Kibyte @ 190000 -- 78 % complete.
 Erasing 16 Kibyte @ 194000 -- 78 % complete.
 Erasing 16 Kibyte @ 198000 -- 79 % complete.
 Erasing 16 Kibyte @ 19c000 -- 80 % complete.
 Erasing 16 Kibyte @ 1a0000 -- 81 % complete.
 Erasing 16 Kibyte @ 1a4000 -- 82 % complete.
 Erasing 16 Kibyte @ 1a8000 -- 82 % complete.
 Erasing 16 Kibyte @ 1ac000 -- 83 % complete.
 Erasing 16 Kibyte @ 1b0000 -- 84 % complete.
 Erasing 16 Kibyte @ 1b4000 -- 85 % complete.
 Erasing 16 Kibyte @ 1b8000 -- 85 % complete.
 Erasing 16 Kibyte @ 1bc000 -- 86 % complete.
 Erasing 16 Kibyte @ 1c0000 -- 87 % complete.
 Erasing 16 Kibyte @ 1c4000 -- 88 % complete.
 Erasing 16 Kibyte @ 1c8000 -- 89 % complete.
 Erasing 16 Kibyte @ 1cc000 -- 89 % complete.
 Erasing 16 Kibyte @ 1d0000 -- 90 % complete.
 Erasing 16 Kibyte @ 1d4000 -- 91 % complete.
 Erasing 16 Kibyte @ 1d8000 -- 92 % complete.
 Erasing 16 Kibyte @ 1dc000 -- 92 % complete.
 Erasing 16 Kibyte @ 1e0000 -- 93 % complete.
 Erasing 16 Kibyte @ 1e4000 -- 94 % complete.
 Erasing 16 Kibyte @ 1e8000 -- 95 % complete.
 Erasing 16 Kibyte @ 1ec000 -- 96 % complete.
 Erasing 16 Kibyte @ 1f0000 -- 96 % complete.
 Erasing 16 Kibyte @ 1f4000 -- 97 % complete.
 Erasing 16 Kibyte @ 1f8000 -- 98 % complete.
 Erasing 16 Kibyte @ 1fc000 -- 99 % complete.
 Erased 2048 Kibyte @ 0 -- 100% complete.

debian:/home# mount -t jffs2 /dev/mtdblock0 /mnt/nand/

nand_read_ecc: from = 0x00000000, len = 1024
nand_read_ecc: from = 0x00004000, len = 1024
nand_read_ecc: from = 0x00008000, len = 1024
nand_read_ecc: from = 0x0000c000, len = 1024
nand_read_ecc: from = 0x00010000, len = 1024
nand_read_ecc: from = 0x00014000, len = 1024
nand_read_ecc: from = 0x00018000, len = 1024
nand_read_ecc: from = 0x0001c000, len = 1024
nand_read_ecc: from = 0x00020000, len = 1024
nand_read_ecc: from = 0x00024000, len = 1024
nand_read_ecc: from = 0x00028000, len = 1024
nand_read_ecc: from = 0x0002c000, len = 1024
nand_read_ecc: from = 0x00030000, len = 1024
nand_read_ecc: from = 0x00034000, len = 1024
nand_read_ecc: from = 0x00038000, len = 1024
nand_read_ecc: from = 0x0003c000, len = 1024
nand_read_ecc: from = 0x00040000, len = 1024
nand_read_ecc: from = 0x00044000, len = 1024
nand_read_ecc: from = 0x00048000, len = 1024
nand_read_ecc: from = 0x0004c000, len = 1024
nand_read_ecc: from = 0x00050000, len = 1024
nand_read_ecc: from = 0x00054000, len = 1024
nand_read_ecc: from = 0x00058000, len = 1024
nand_read_ecc: from = 0x0005c000, len = 1024
nand_read_ecc: from = 0x00060000, len = 1024
nand_read_ecc: from = 0x00064000, len = 1024
nand_read_ecc: from = 0x00068000, len = 1024
nand_read_ecc: from = 0x0006c000, len = 1024
nand_read_ecc: from = 0x00070000, len = 1024
nand_read_ecc: from = 0x00074000, len = 1024
nand_read_ecc: from = 0x00078000, len = 1024
nand_read_ecc: from = 0x0007c000, len = 1024
nand_read_ecc: from = 0x00080000, len = 1024
nand_read_ecc: from = 0x00084000, len = 1024
nand_read_ecc: from = 0x00088000, len = 1024
nand_read_ecc: from = 0x0008c000, len = 1024
nand_read_ecc: from = 0x00090000, len = 1024
nand_read_ecc: from = 0x00094000, len = 1024
nand_read_ecc: from = 0x00098000, len = 1024
nand_read_ecc: from = 0x0009c000, len = 1024
nand_read_ecc: from = 0x000a0000, len = 1024
nand_read_ecc: from = 0x000a4000, len = 1024
nand_read_ecc: from = 0x000a8000, len = 1024
nand_read_ecc: from = 0x000ac000, len = 1024
nand_read_ecc: from = 0x000b0000, len = 1024
nand_read_ecc: from = 0x000b4000, len = 1024
nand_read_ecc: from = 0x000b8000, len = 1024
nand_read_ecc: from = 0x000bc000, len = 1024
nand_read_ecc: from = 0x000c0000, len = 1024
nand_read_ecc: from = 0x000c4000, len = 1024
nand_read_ecc: from = 0x000c8000, len = 1024
nand_read_ecc: from = 0x000cc000, len = 1024
nand_read_ecc: from = 0x000d0000, len = 1024
nand_read_ecc: from = 0x000d4000, len = 1024
nand_read_ecc: from = 0x000d8000, len = 1024
nand_read_ecc: from = 0x000dc000, len = 1024
nand_read_ecc: from = 0x000e0000, len = 1024
nand_read_ecc: from = 0x000e4000, len = 1024
nand_read_ecc: from = 0x000e8000, len = 1024
nand_read_ecc: from = 0x000ec000, len = 1024
nand_read_ecc: from = 0x000f0000, len = 1024
nand_read_ecc: from = 0x000f4000, len = 1024
nand_read_ecc: from = 0x000f8000, len = 1024
nand_read_ecc: from = 0x000fc000, len = 1024
nand_read_ecc: from = 0x00100000, len = 1024
nand_read_ecc: from = 0x00104000, len = 1024
nand_read_ecc: from = 0x00108000, len = 1024
nand_read_ecc: from = 0x0010c000, len = 1024
nand_read_ecc: from = 0x00110000, len = 1024
nand_read_ecc: from = 0x00114000, len = 1024
nand_read_ecc: from = 0x00118000, len = 1024
nand_read_ecc: from = 0x0011c000, len = 1024
nand_read_ecc: from = 0x00120000, len = 1024
nand_read_ecc: from = 0x00124000, len = 1024
nand_read_ecc: from = 0x00128000, len = 1024
nand_read_ecc: from = 0x0012c000, len = 1024
nand_read_ecc: from = 0x00130000, len = 1024
nand_read_ecc: from = 0x00134000, len = 1024
nand_read_ecc: from = 0x00138000, len = 1024
nand_read_ecc: from = 0x0013c000, len = 1024
nand_read_ecc: from = 0x00140000, len = 1024
nand_read_ecc: from = 0x00144000, len = 1024
nand_read_ecc: from = 0x00148000, len = 1024
nand_read_ecc: from = 0x0014c000, len = 1024
nand_read_ecc: from = 0x00150000, len = 1024
nand_read_ecc: from = 0x00154000, len = 1024
nand_read_ecc: from = 0x00158000, len = 1024
nand_read_ecc: from = 0x0015c000, len = 1024
nand_read_ecc: from = 0x00160000, len = 1024
nand_read_ecc: from = 0x00164000, len = 1024
nand_read_ecc: from = 0x00168000, len = 1024
nand_read_ecc: from = 0x0016c000, len = 1024
nand_read_ecc: from = 0x00170000, len = 1024
nand_read_ecc: from = 0x00174000, len = 1024
nand_read_ecc: from = 0x00178000, len = 1024
nand_read_ecc: from = 0x0017c000, len = 1024
nand_read_ecc: from = 0x00180000, len = 1024
nand_read_ecc: from = 0x00184000, len = 1024
nand_read_ecc: from = 0x00188000, len = 1024
nand_read_ecc: from = 0x0018c000, len = 1024
nand_read_ecc: from = 0x00190000, len = 1024
nand_read_ecc: from = 0x00194000, len = 1024
nand_read_ecc: from = 0x00198000, len = 1024
nand_read_ecc: from = 0x0019c000, len = 1024
nand_read_ecc: from = 0x001a0000, len = 1024
nand_read_ecc: from = 0x001a4000, len = 1024
nand_read_ecc: from = 0x001a8000, len = 1024
nand_read_ecc: from = 0x001ac000, len = 1024
nand_read_ecc: from = 0x001b0000, len = 1024
nand_read_ecc: from = 0x001b4000, len = 1024
nand_read_ecc: from = 0x001b8000, len = 1024
nand_read_ecc: from = 0x001bc000, len = 1024
nand_read_ecc: from = 0x001c0000, len = 1024
nand_read_ecc: from = 0x001c4000, len = 1024
nand_read_ecc: from = 0x001c8000, len = 1024
nand_read_ecc: from = 0x001cc000, len = 1024
nand_read_ecc: from = 0x001d0000, len = 1024
nand_read_ecc: from = 0x001d4000, len = 1024
nand_read_ecc: from = 0x001d8000, len = 1024
nand_read_ecc: from = 0x001dc000, len = 1024
nand_read_ecc: from = 0x001e0000, len = 1024
nand_read_ecc: from = 0x001e4000, len = 1024
nand_read_ecc: from = 0x001e8000, len = 1024
nand_read_ecc: from = 0x001ec000, len = 1024
nand_read_ecc: from = 0x001f0000, len = 1024
nand_read_ecc: from = 0x001f4000, len = 1024
nand_read_ecc: from = 0x001f8000, len = 1024
nand_read_ecc: from = 0x001fc000, len = 1024
nand_erase: start = 0x001f8000, len = 16384
nand_read_ecc: from = 0x001f8000, len = 4096
nand_read_ecc: from = 0x001f9000, len = 4096
nand_read_ecc: from = 0x001fa000, len = 4096
nand_read_ecc: from = 0x001fb000, len = 4096
nand_write_ecc: to = 0x001f8000, len = 12
debian:/home# nand_erase: start = 0x001f4000, len = 16384
nand_read_ecc: from = 0x001f4000, len = 4096
nand_read_ecc: from = 0x001f5000, len = 4096
nand_read_ecc: from = 0x001f6000, len = 4096
nand_read_ecc: from = 0x001f7000, len = 4096
nand_write_ecc: to = 0x001f4000, len = 12
nand_erase: start = 0x001f0000, len = 16384
nand_read_ecc: from = 0x001f0000, len = 4096
nand_read_ecc: from = 0x001f1000, len = 4096
nand_read_ecc: from = 0x001f2000, len = 4096
nand_read_ecc: from = 0x001f3000, len = 4096
nand_write_ecc: to = 0x001f0000, len = 12
nand_erase: start = 0x001ec000, len = 16384
nand_read_ecc: from = 0x001ec000, len = 4096
nand_read_ecc: from = 0x001ed000, len = 4096
nand_read_ecc: from = 0x001ee000, len = 4096
nand_read_ecc: from = 0x001ef000, len = 4096
nand_write_ecc: to = 0x001ec000, len = 12
nand_erase: start = 0x001e8000, len = 16384
nand_read_ecc: from = 0x001e8000, len = 4096
nand_read_ecc: from = 0x001e9000, len = 4096
nand_read_ecc: from = 0x001ea000, len = 4096
nand_read_ecc: from = 0x001eb000, len = 4096
nand_write_ecc: to = 0x001e8000, len = 12
nand_erase: start = 0x001e4000, len = 16384
nand_read_ecc: from = 0x001e4000, len = 4096
nand_read_ecc: from = 0x001e5000, len = 4096
nand_read_ecc: from = 0x001e6000, len = 4096
nand_read_ecc: from = 0x001e7000, len = 4096
nand_write_ecc: to = 0x001e4000, len = 12
nand_erase: start = 0x001e0000, len = 16384
nand_read_ecc: from = 0x001e0000, len = 4096
nand_read_ecc: from = 0x001e1000, len = 4096
nand_read_ecc: from = 0x001e2000, len = 4096
nand_read_ecc: from = 0x001e3000, len = 4096
nand_write_ecc: to = 0x001e0000, len = 12
nand_erase: start = 0x001dc000, len = 16384
nand_read_ecc: from = 0x001dc000, len = 4096
nand_read_ecc: from = 0x001dd000, len = 4096
nand_read_ecc: from = 0x001de000, len = 4096
nand_read_ecc: from = 0x001df000, len = 4096
nand_write_ecc: to = 0x001dc000, len = 12
nand_erase: start = 0x001d8000, len = 16384
nand_read_ecc: from = 0x001d8000, len = 4096
nand_read_ecc: from = 0x001d9000, len = 4096
nand_read_ecc: from = 0x001da000, len = 4096
nand_read_ecc: from = 0x001db000, len = 4096
nand_write_ecc: to = 0x001d8000, len = 12
nand_erase: start = 0x001d4000, len = 16384
nand_read_ecc: from = 0x001d4000, len = 4096
nand_read_ecc: from = 0x001d5000, len = 4096
nand_read_ecc: from = 0x001d6000, len = 4096
nand_read_ecc: from = 0x001d7000, len = 4096
nand_write_ecc: to = 0x001d4000, len = 12
nand_erase: start = 0x001d0000, len = 16384
nand_read_ecc: from = 0x001d0000, len = 4096
nand_read_ecc: from = 0x001d1000, len = 4096
nand_read_ecc: from = 0x001d2000, len = 4096
nand_read_ecc: from = 0x001d3000, len = 4096
nand_write_ecc: to = 0x001d0000, len = 12
nand_erase: start = 0x001cc000, len = 16384
nand_read_ecc: from = 0x001cc000, len = 4096
nand_read_ecc: from = 0x001cd000, len = 4096
nand_read_ecc: from = 0x001ce000, len = 4096
nand_read_ecc: from = 0x001cf000, len = 4096
nand_write_ecc: to = 0x001cc000, len = 12
nand_erase: start = 0x001c8000, len = 16384
nand_read_ecc: from = 0x001c8000, len = 4096
nand_read_ecc: from = 0x001c9000, len = 4096
nand_read_ecc: from = 0x001ca000, len = 4096
nand_read_ecc: from = 0x001cb000, len = 4096
nand_write_ecc: to = 0x001c8000, len = 12
nand_erase: start = 0x001c4000, len = 16384
nand_read_ecc: from = 0x001c4000, len = 4096
nand_read_ecc: from = 0x001c5000, len = 4096
nand_read_ecc: from = 0x001c6000, len = 4096
nand_read_ecc: from = 0x001c7000, len = 4096
nand_write_ecc: to = 0x001c4000, len = 12
nand_erase: start = 0x001c0000, len = 16384
nand_read_ecc: from = 0x001c0000, len = 4096
nand_read_ecc: from = 0x001c1000, len = 4096
nand_read_ecc: from = 0x001c2000, len = 4096
nand_read_ecc: from = 0x001c3000, len = 4096
nand_write_ecc: to = 0x001c0000, len = 12
nand_erase: start = 0x001bc000, len = 16384
nand_read_ecc: from = 0x001bc000, len = 4096
nand_read_ecc: from = 0x001bd000, len = 4096
nand_read_ecc: from = 0x001be000, len = 4096
nand_read_ecc: from = 0x001bf000, len = 4096
nand_write_ecc: to = 0x001bc000, len = 12
nand_erase: start = 0x001b8000, len = 16384
nand_read_ecc: from = 0x001b8000, len = 4096
nand_read_ecc: from = 0x001b9000, len = 4096
nand_read_ecc: from = 0x001ba000, len = 4096
nand_read_ecc: from = 0x001bb000, len = 4096
nand_write_ecc: to = 0x001b8000, len = 12
nand_erase: start = 0x001b4000, len = 16384
nand_read_ecc: from = 0x001b4000, len = 4096
nand_read_ecc: from = 0x001b5000, len = 4096
nand_read_ecc: from = 0x001b6000, len = 4096
nand_read_ecc: from = 0x001b7000, len = 4096
nand_write_ecc: to = 0x001b4000, len = 12
nand_erase: start = 0x001b0000, len = 16384
nand_read_ecc: from = 0x001b0000, len = 4096
nand_read_ecc: from = 0x001b1000, len = 4096
nand_read_ecc: from = 0x001b2000, len = 4096
nand_read_ecc: from = 0x001b3000, len = 4096
nand_write_ecc: to = 0x001b0000, len = 12
nand_erase: start = 0x001ac000, len = 16384
nand_read_ecc: from = 0x001ac000, len = 4096
nand_read_ecc: from = 0x001ad000, len = 4096
nand_read_ecc: from = 0x001ae000, len = 4096
nand_read_ecc: from = 0x001af000, len = 4096
nand_write_ecc: to = 0x001ac000, len = 12
nand_erase: start = 0x001a8000, len = 16384
nand_read_ecc: from = 0x001a8000, len = 4096
nand_read_ecc: from = 0x001a9000, len = 4096
nand_read_ecc: from = 0x001aa000, len = 4096
nand_read_ecc: from = 0x001ab000, len = 4096
nand_write_ecc: to = 0x001a8000, len = 12
nand_erase: start = 0x001a4000, len = 16384
nand_read_ecc: from = 0x001a4000, len = 4096
nand_read_ecc: from = 0x001a5000, len = 4096
nand_read_ecc: from = 0x001a6000, len = 4096
nand_read_ecc: from = 0x001a7000, len = 4096
nand_write_ecc: to = 0x001a4000, len = 12
nand_erase: start = 0x001a0000, len = 16384
nand_read_ecc: from = 0x001a0000, len = 4096
nand_read_ecc: from = 0x001a1000, len = 4096
nand_read_ecc: from = 0x001a2000, len = 4096
nand_read_ecc: from = 0x001a3000, len = 4096
nand_write_ecc: to = 0x001a0000, len = 12
nand_erase: start = 0x0019c000, len = 16384
nand_read_ecc: from = 0x0019c000, len = 4096
nand_read_ecc: from = 0x0019d000, len = 4096
nand_read_ecc: from = 0x0019e000, len = 4096
nand_read_ecc: from = 0x0019f000, len = 4096
nand_write_ecc: to = 0x0019c000, len = 12
nand_erase: start = 0x00198000, len = 16384
nand_read_ecc: from = 0x00198000, len = 4096
nand_read_ecc: from = 0x00199000, len = 4096
nand_read_ecc: from = 0x0019a000, len = 4096
nand_read_ecc: from = 0x0019b000, len = 4096
nand_write_ecc: to = 0x00198000, len = 12
nand_erase: start = 0x00194000, len = 16384
nand_read_ecc: from = 0x00194000, len = 4096
nand_read_ecc: from = 0x00195000, len = 4096
nand_read_ecc: from = 0x00196000, len = 4096
nand_read_ecc: from = 0x00197000, len = 4096
nand_write_ecc: to = 0x00194000, len = 12
nand_erase: start = 0x00190000, len = 16384
nand_read_ecc: from = 0x00190000, len = 4096
nand_read_ecc: from = 0x00191000, len = 4096
nand_read_ecc: from = 0x00192000, len = 4096
nand_read_ecc: from = 0x00193000, len = 4096
nand_write_ecc: to = 0x00190000, len = 12
nand_erase: start = 0x0018c000, len = 16384
nand_read_ecc: from = 0x0018c000, len = 4096
nand_read_ecc: from = 0x0018d000, len = 4096
nand_read_ecc: from = 0x0018e000, len = 4096
nand_read_ecc: from = 0x0018f000, len = 4096
nand_write_ecc: to = 0x0018c000, len = 12
nand_erase: start = 0x00188000, len = 16384
nand_read_ecc: from = 0x00188000, len = 4096
nand_read_ecc: from = 0x00189000, len = 4096
nand_read_ecc: from = 0x0018a000, len = 4096
nand_read_ecc: from = 0x0018b000, len = 4096
nand_write_ecc: to = 0x00188000, len = 12
nand_erase: start = 0x00184000, len = 16384
nand_read_ecc: from = 0x00184000, len = 4096
nand_read_ecc: from = 0x00185000, len = 4096
nand_read_ecc: from = 0x00186000, len = 4096
nand_read_ecc: from = 0x00187000, len = 4096
nand_write_ecc: to = 0x00184000, len = 12
nand_erase: start = 0x00180000, len = 16384
nand_read_ecc: from = 0x00180000, len = 4096
nand_read_ecc: from = 0x00181000, len = 4096
nand_read_ecc: from = 0x00182000, len = 4096
nand_read_ecc: from = 0x00183000, len = 4096
nand_write_ecc: to = 0x00180000, len = 12
nand_erase: start = 0x0017c000, len = 16384
nand_read_ecc: from = 0x0017c000, len = 4096
nand_read_ecc: from = 0x0017d000, len = 4096
nand_read_ecc: from = 0x0017e000, len = 4096
nand_read_ecc: from = 0x0017f000, len = 4096
nand_write_ecc: to = 0x0017c000, len = 12
nand_erase: start = 0x00178000, len = 16384
nand_read_ecc: from = 0x00178000, len = 4096
nand_read_ecc: from = 0x00179000, len = 4096
nand_read_ecc: from = 0x0017a000, len = 4096
nand_read_ecc: from = 0x0017b000, len = 4096
nand_write_ecc: to = 0x00178000, len = 12
nand_erase: start = 0x00174000, len = 16384
nand_read_ecc: from = 0x00174000, len = 4096
nand_read_ecc: from = 0x00175000, len = 4096
nand_read_ecc: from = 0x00176000, len = 4096
nand_read_ecc: from = 0x00177000, len = 4096
nand_write_ecc: to = 0x00174000, len = 12
nand_erase: start = 0x00170000, len = 16384
nand_read_ecc: from = 0x00170000, len = 4096
nand_read_ecc: from = 0x00171000, len = 4096
nand_read_ecc: from = 0x00172000, len = 4096
nand_read_ecc: from = 0x00173000, len = 4096
nand_write_ecc: to = 0x00170000, len = 12
nand_erase: start = 0x0016c000, len = 16384
nand_read_ecc: from = 0x0016c000, len = 4096
nand_read_ecc: from = 0x0016d000, len = 4096
nand_read_ecc: from = 0x0016e000, len = 4096
nand_read_ecc: from = 0x0016f000, len = 4096
nand_write_ecc: to = 0x0016c000, len = 12
nand_erase: start = 0x00168000, len = 16384
nand_read_ecc: from = 0x00168000, len = 4096
nand_read_ecc: from = 0x00169000, len = 4096
nand_read_ecc: from = 0x0016a000, len = 4096
nand_read_ecc: from = 0x0016b000, len = 4096
nand_write_ecc: to = 0x00168000, len = 12
nand_erase: start = 0x00164000, len = 16384
nand_read_ecc: from = 0x00164000, len = 4096
nand_read_ecc: from = 0x00165000, len = 4096
nand_read_ecc: from = 0x00166000, len = 4096
nand_read_ecc: from = 0x00167000, len = 4096
nand_write_ecc: to = 0x00164000, len = 12
nand_erase: start = 0x00160000, len = 16384
nand_read_ecc: from = 0x00160000, len = 4096
nand_read_ecc: from = 0x00161000, len = 4096
nand_read_ecc: from = 0x00162000, len = 4096
nand_read_ecc: from = 0x00163000, len = 4096
nand_write_ecc: to = 0x00160000, len = 12
nand_erase: start = 0x0015c000, len = 16384
nand_read_ecc: from = 0x0015c000, len = 4096
nand_read_ecc: from = 0x0015d000, len = 4096
nand_read_ecc: from = 0x0015e000, len = 4096
nand_read_ecc: from = 0x0015f000, len = 4096
nand_write_ecc: to = 0x0015c000, len = 12
nand_erase: start = 0x00158000, len = 16384
nand_read_ecc: from = 0x00158000, len = 4096
nand_read_ecc: from = 0x00159000, len = 4096
nand_read_ecc: from = 0x0015a000, len = 4096
nand_read_ecc: from = 0x0015b000, len = 4096
nand_write_ecc: to = 0x00158000, len = 12
nand_erase: start = 0x00154000, len = 16384
nand_read_ecc: from = 0x00154000, len = 4096
nand_read_ecc: from = 0x00155000, len = 4096
nand_read_ecc: from = 0x00156000, len = 4096
nand_read_ecc: from = 0x00157000, len = 4096
nand_write_ecc: to = 0x00154000, len = 12
nand_erase: start = 0x00150000, len = 16384
nand_read_ecc: from = 0x00150000, len = 4096
nand_read_ecc: from = 0x00151000, len = 4096
nand_read_ecc: from = 0x00152000, len = 4096
nand_read_ecc: from = 0x00153000, len = 4096
nand_write_ecc: to = 0x00150000, len = 12
nand_erase: start = 0x0014c000, len = 16384
nand_read_ecc: from = 0x0014c000, len = 4096
nand_read_ecc: from = 0x0014d000, len = 4096
nand_read_ecc: from = 0x0014e000, len = 4096
nand_read_ecc: from = 0x0014f000, len = 4096
nand_write_ecc: to = 0x0014c000, len = 12
nand_erase: start = 0x00148000, len = 16384
nand_read_ecc: from = 0x00148000, len = 4096
nand_read_ecc: from = 0x00149000, len = 4096
nand_read_ecc: from = 0x0014a000, len = 4096
nand_read_ecc: from = 0x0014b000, len = 4096
nand_write_ecc: to = 0x00148000, len = 12
nand_erase: start = 0x00144000, len = 16384
nand_read_ecc: from = 0x00144000, len = 4096
nand_read_ecc: from = 0x00145000, len = 4096
nand_read_ecc: from = 0x00146000, len = 4096
nand_read_ecc: from = 0x00147000, len = 4096
nand_write_ecc: to = 0x00144000, len = 12
nand_erase: start = 0x00140000, len = 16384
nand_read_ecc: from = 0x00140000, len = 4096
nand_read_ecc: from = 0x00141000, len = 4096
nand_read_ecc: from = 0x00142000, len = 4096
nand_read_ecc: from = 0x00143000, len = 4096
nand_write_ecc: to = 0x00140000, len = 12
nand_erase: start = 0x0013c000, len = 16384
nand_read_ecc: from = 0x0013c000, len = 4096
nand_read_ecc: from = 0x0013d000, len = 4096
nand_read_ecc: from = 0x0013e000, len = 4096
nand_read_ecc: from = 0x0013f000, len = 4096
nand_write_ecc: to = 0x0013c000, len = 12
nand_erase: start = 0x00138000, len = 16384
nand_read_ecc: from = 0x00138000, len = 4096
nand_read_ecc: from = 0x00139000, len = 4096
nand_read_ecc: from = 0x0013a000, len = 4096
nand_read_ecc: from = 0x0013b000, len = 4096
nand_write_ecc: to = 0x00138000, len = 12
nand_erase: start = 0x00134000, len = 16384
nand_read_ecc: from = 0x00134000, len = 4096
nand_read_ecc: from = 0x00135000, len = 4096
nand_read_ecc: from = 0x00136000, len = 4096
nand_read_ecc: from = 0x00137000, len = 4096
nand_write_ecc: to = 0x00134000, len = 12
nand_erase: start = 0x00130000, len = 16384
nand_read_ecc: from = 0x00130000, len = 4096
nand_read_ecc: from = 0x00131000, len = 4096
nand_read_ecc: from = 0x00132000, len = 4096
nand_read_ecc: from = 0x00133000, len = 4096
nand_write_ecc: to = 0x00130000, len = 12
nand_erase: start = 0x0012c000, len = 16384
nand_read_ecc: from = 0x0012c000, len = 4096
nand_read_ecc: from = 0x0012d000, len = 4096
nand_read_ecc: from = 0x0012e000, len = 4096
nand_read_ecc: from = 0x0012f000, len = 4096
nand_write_ecc: to = 0x0012c000, len = 12
nand_erase: start = 0x00128000, len = 16384
nand_read_ecc: from = 0x00128000, len = 4096
nand_read_ecc: from = 0x00129000, len = 4096
nand_read_ecc: from = 0x0012a000, len = 4096
nand_read_ecc: from = 0x0012b000, len = 4096
nand_write_ecc: to = 0x00128000, len = 12
nand_erase: start = 0x00124000, len = 16384
nand_read_ecc: from = 0x00124000, len = 4096
nand_read_ecc: from = 0x00125000, len = 4096
nand_read_ecc: from = 0x00126000, len = 4096
nand_read_ecc: from = 0x00127000, len = 4096
nand_write_ecc: to = 0x00124000, len = 12
nand_erase: start = 0x00120000, len = 16384
nand_read_ecc: from = 0x00120000, len = 4096
nand_read_ecc: from = 0x00121000, len = 4096
nand_read_ecc: from = 0x00122000, len = 4096
nand_read_ecc: from = 0x00123000, len = 4096
nand_write_ecc: to = 0x00120000, len = 12
nand_erase: start = 0x0011c000, len = 16384
nand_read_ecc: from = 0x0011c000, len = 4096
nand_read_ecc: from = 0x0011d000, len = 4096
nand_read_ecc: from = 0x0011e000, len = 4096
nand_read_ecc: from = 0x0011f000, len = 4096
nand_write_ecc: to = 0x0011c000, len = 12
nand_erase: start = 0x00118000, len = 16384
nand_read_ecc: from = 0x00118000, len = 4096
nand_read_ecc: from = 0x00119000, len = 4096
nand_read_ecc: from = 0x0011a000, len = 4096
nand_read_ecc: from = 0x0011b000, len = 4096
nand_write_ecc: to = 0x00118000, len = 12
nand_erase: start = 0x00114000, len = 16384
nand_read_ecc: from = 0x00114000, len = 4096
nand_read_ecc: from = 0x00115000, len = 4096
nand_read_ecc: from = 0x00116000, len = 4096
nand_read_ecc: from = 0x00117000, len = 4096
nand_write_ecc: to = 0x00114000, len = 12
nand_erase: start = 0x00110000, len = 16384
nand_read_ecc: from = 0x00110000, len = 4096
nand_read_ecc: from = 0x00111000, len = 4096
nand_read_ecc: from = 0x00112000, len = 4096
nand_read_ecc: from = 0x00113000, len = 4096
nand_write_ecc: to = 0x00110000, len = 12
nand_erase: start = 0x0010c000, len = 16384
nand_read_ecc: from = 0x0010c000, len = 4096
nand_read_ecc: from = 0x0010d000, len = 4096
nand_read_ecc: from = 0x0010e000, len = 4096
nand_read_ecc: from = 0x0010f000, len = 4096
nand_write_ecc: to = 0x0010c000, len = 12
nand_erase: start = 0x00108000, len = 16384
nand_read_ecc: from = 0x00108000, len = 4096
nand_read_ecc: from = 0x00109000, len = 4096
nand_read_ecc: from = 0x0010a000, len = 4096
nand_read_ecc: from = 0x0010b000, len = 4096
nand_write_ecc: to = 0x00108000, len = 12
nand_erase: start = 0x00104000, len = 16384
nand_read_ecc: from = 0x00104000, len = 4096
nand_read_ecc: from = 0x00105000, len = 4096
nand_read_ecc: from = 0x00106000, len = 4096
nand_read_ecc: from = 0x00107000, len = 4096
nand_write_ecc: to = 0x00104000, len = 12
nand_erase: start = 0x00100000, len = 16384
nand_read_ecc: from = 0x00100000, len = 4096
nand_read_ecc: from = 0x00101000, len = 4096
nand_read_ecc: from = 0x00102000, len = 4096
nand_read_ecc: from = 0x00103000, len = 4096
nand_write_ecc: to = 0x00100000, len = 12
nand_erase: start = 0x000fc000, len = 16384
nand_read_ecc: from = 0x000fc000, len = 4096
nand_read_ecc: from = 0x000fd000, len = 4096
nand_read_ecc: from = 0x000fe000, len = 4096
nand_read_ecc: from = 0x000ff000, len = 4096
nand_write_ecc: to = 0x000fc000, len = 12
nand_erase: start = 0x000f8000, len = 16384
nand_read_ecc: from = 0x000f8000, len = 4096
nand_read_ecc: from = 0x000f9000, len = 4096
nand_read_ecc: from = 0x000fa000, len = 4096
nand_read_ecc: from = 0x000fb000, len = 4096
nand_write_ecc: to = 0x000f8000, len = 12
nand_erase: start = 0x000f4000, len = 16384
nand_read_ecc: from = 0x000f4000, len = 4096
nand_read_ecc: from = 0x000f5000, len = 4096
nand_read_ecc: from = 0x000f6000, len = 4096
nand_read_ecc: from = 0x000f7000, len = 4096
nand_write_ecc: to = 0x000f4000, len = 12
nand_erase: start = 0x000f0000, len = 16384
nand_read_ecc: from = 0x000f0000, len = 4096
nand_read_ecc: from = 0x000f1000, len = 4096
nand_read_ecc: from = 0x000f2000, len = 4096
nand_read_ecc: from = 0x000f3000, len = 4096
nand_write_ecc: to = 0x000f0000, len = 12
nand_erase: start = 0x000ec000, len = 16384
nand_read_ecc: from = 0x000ec000, len = 4096
nand_read_ecc: from = 0x000ed000, len = 4096
nand_read_ecc: from = 0x000ee000, len = 4096
nand_read_ecc: from = 0x000ef000, len = 4096
nand_write_ecc: to = 0x000ec000, len = 12
nand_erase: start = 0x000e8000, len = 16384
nand_read_ecc: from = 0x000e8000, len = 4096
nand_read_ecc: from = 0x000e9000, len = 4096
nand_read_ecc: from = 0x000ea000, len = 4096
nand_read_ecc: from = 0x000eb000, len = 4096
nand_write_ecc: to = 0x000e8000, len = 12
nand_erase: start = 0x000e4000, len = 16384
nand_read_ecc: from = 0x000e4000, len = 4096
nand_read_ecc: from = 0x000e5000, len = 4096
nand_read_ecc: from = 0x000e6000, len = 4096
nand_read_ecc: from = 0x000e7000, len = 4096
nand_write_ecc: to = 0x000e4000, len = 12
nand_erase: start = 0x000e0000, len = 16384
nand_read_ecc: from = 0x000e0000, len = 4096
nand_read_ecc: from = 0x000e1000, len = 4096
nand_read_ecc: from = 0x000e2000, len = 4096
nand_read_ecc: from = 0x000e3000, len = 4096
nand_write_ecc: to = 0x000e0000, len = 12
nand_erase: start = 0x000dc000, len = 16384
nand_read_ecc: from = 0x000dc000, len = 4096
nand_read_ecc: from = 0x000dd000, len = 4096
nand_read_ecc: from = 0x000de000, len = 4096
nand_read_ecc: from = 0x000df000, len = 4096
nand_write_ecc: to = 0x000dc000, len = 12
nand_erase: start = 0x000d8000, len = 16384
nand_read_ecc: from = 0x000d8000, len = 4096
nand_read_ecc: from = 0x000d9000, len = 4096
nand_read_ecc: from = 0x000da000, len = 4096
nand_read_ecc: from = 0x000db000, len = 4096
nand_write_ecc: to = 0x000d8000, len = 12
nand_erase: start = 0x000d4000, len = 16384
nand_read_ecc: from = 0x000d4000, len = 4096
nand_read_ecc: from = 0x000d5000, len = 4096
nand_read_ecc: from = 0x000d6000, len = 4096
nand_read_ecc: from = 0x000d7000, len = 4096
nand_write_ecc: to = 0x000d4000, len = 12
nand_erase: start = 0x000d0000, len = 16384
nand_read_ecc: from = 0x000d0000, len = 4096
nand_read_ecc: from = 0x000d1000, len = 4096
nand_read_ecc: from = 0x000d2000, len = 4096
nand_read_ecc: from = 0x000d3000, len = 4096
nand_write_ecc: to = 0x000d0000, len = 12
nand_erase: start = 0x000cc000, len = 16384
nand_read_ecc: from = 0x000cc000, len = 4096
nand_read_ecc: from = 0x000cd000, len = 4096
nand_read_ecc: from = 0x000ce000, len = 4096
nand_read_ecc: from = 0x000cf000, len = 4096
nand_write_ecc: to = 0x000cc000, len = 12
nand_erase: start = 0x000c8000, len = 16384
nand_read_ecc: from = 0x000c8000, len = 4096
nand_read_ecc: from = 0x000c9000, len = 4096
nand_read_ecc: from = 0x000ca000, len = 4096
nand_read_ecc: from = 0x000cb000, len = 4096
nand_write_ecc: to = 0x000c8000, len = 12
nand_erase: start = 0x000c4000, len = 16384
nand_read_ecc: from = 0x000c4000, len = 4096
nand_read_ecc: from = 0x000c5000, len = 4096
nand_read_ecc: from = 0x000c6000, len = 4096
nand_read_ecc: from = 0x000c7000, len = 4096
nand_write_ecc: to = 0x000c4000, len = 12
nand_erase: start = 0x000c0000, len = 16384
nand_read_ecc: from = 0x000c0000, len = 4096
nand_read_ecc: from = 0x000c1000, len = 4096
nand_read_ecc: from = 0x000c2000, len = 4096
nand_read_ecc: from = 0x000c3000, len = 4096
nand_write_ecc: to = 0x000c0000, len = 12
nand_erase: start = 0x000bc000, len = 16384
nand_read_ecc: from = 0x000bc000, len = 4096
nand_read_ecc: from = 0x000bd000, len = 4096
nand_read_ecc: from = 0x000be000, len = 4096
nand_read_ecc: from = 0x000bf000, len = 4096
nand_write_ecc: to = 0x000bc000, len = 12
nand_erase: start = 0x000b8000, len = 16384
nand_read_ecc: from = 0x000b8000, len = 4096
nand_read_ecc: from = 0x000b9000, len = 4096
nand_read_ecc: from = 0x000ba000, len = 4096
nand_read_ecc: from = 0x000bb000, len = 4096
nand_write_ecc: to = 0x000b8000, len = 12
nand_erase: start = 0x000b4000, len = 16384
nand_read_ecc: from = 0x000b4000, len = 4096
nand_read_ecc: from = 0x000b5000, len = 4096
nand_read_ecc: from = 0x000b6000, len = 4096
nand_read_ecc: from = 0x000b7000, len = 4096
nand_write_ecc: to = 0x000b4000, len = 12
nand_erase: start = 0x000b0000, len = 16384
nand_read_ecc: from = 0x000b0000, len = 4096
nand_read_ecc: from = 0x000b1000, len = 4096
nand_read_ecc: from = 0x000b2000, len = 4096
nand_read_ecc: from = 0x000b3000, len = 4096
nand_write_ecc: to = 0x000b0000, len = 12
nand_erase: start = 0x000ac000, len = 16384
nand_read_ecc: from = 0x000ac000, len = 4096
nand_read_ecc: from = 0x000ad000, len = 4096
nand_read_ecc: from = 0x000ae000, len = 4096
nand_read_ecc: from = 0x000af000, len = 4096
nand_write_ecc: to = 0x000ac000, len = 12
nand_erase: start = 0x000a8000, len = 16384
nand_read_ecc: from = 0x000a8000, len = 4096
nand_read_ecc: from = 0x000a9000, len = 4096
nand_read_ecc: from = 0x000aa000, len = 4096
nand_read_ecc: from = 0x000ab000, len = 4096
nand_write_ecc: to = 0x000a8000, len = 12
nand_erase: start = 0x000a4000, len = 16384
nand_read_ecc: from = 0x000a4000, len = 4096
nand_read_ecc: from = 0x000a5000, len = 4096
nand_read_ecc: from = 0x000a6000, len = 4096
nand_read_ecc: from = 0x000a7000, len = 4096
nand_write_ecc: to = 0x000a4000, len = 12
nand_erase: start = 0x000a0000, len = 16384
nand_read_ecc: from = 0x000a0000, len = 4096
nand_read_ecc: from = 0x000a1000, len = 4096
nand_read_ecc: from = 0x000a2000, len = 4096
nand_read_ecc: from = 0x000a3000, len = 4096
nand_write_ecc: to = 0x000a0000, len = 12
nand_erase: start = 0x0009c000, len = 16384
nand_read_ecc: from = 0x0009c000, len = 4096
nand_read_ecc: from = 0x0009d000, len = 4096
nand_read_ecc: from = 0x0009e000, len = 4096
nand_read_ecc: from = 0x0009f000, len = 4096
nand_write_ecc: to = 0x0009c000, len = 12
nand_erase: start = 0x00098000, len = 16384
nand_read_ecc: from = 0x00098000, len = 4096
nand_read_ecc: from = 0x00099000, len = 4096
nand_read_ecc: from = 0x0009a000, len = 4096
nand_read_ecc: from = 0x0009b000, len = 4096
nand_write_ecc: to = 0x00098000, len = 12
nand_erase: start = 0x00094000, len = 16384
nand_read_ecc: from = 0x00094000, len = 4096
nand_read_ecc: from = 0x00095000, len = 4096
nand_read_ecc: from = 0x00096000, len = 4096
nand_read_ecc: from = 0x00097000, len = 4096
nand_write_ecc: to = 0x00094000, len = 12
nand_erase: start = 0x00090000, len = 16384
nand_read_ecc: from = 0x00090000, len = 4096
nand_read_ecc: from = 0x00091000, len = 4096
nand_read_ecc: from = 0x00092000, len = 4096
nand_read_ecc: from = 0x00093000, len = 4096
nand_write_ecc: to = 0x00090000, len = 12
nand_erase: start = 0x0008c000, len = 16384
nand_read_ecc: from = 0x0008c000, len = 4096
nand_read_ecc: from = 0x0008d000, len = 4096
nand_read_ecc: from = 0x0008e000, len = 4096
nand_read_ecc: from = 0x0008f000, len = 4096
nand_write_ecc: to = 0x0008c000, len = 12
nand_erase: start = 0x00088000, len = 16384
nand_read_ecc: from = 0x00088000, len = 4096
nand_read_ecc: from = 0x00089000, len = 4096
nand_read_ecc: from = 0x0008a000, len = 4096
nand_read_ecc: from = 0x0008b000, len = 4096
nand_write_ecc: to = 0x00088000, len = 12
nand_erase: start = 0x00084000, len = 16384
nand_read_ecc: from = 0x00084000, len = 4096
nand_read_ecc: from = 0x00085000, len = 4096
nand_read_ecc: from = 0x00086000, len = 4096
nand_read_ecc: from = 0x00087000, len = 4096
nand_write_ecc: to = 0x00084000, len = 12
nand_erase: start = 0x00080000, len = 16384
nand_read_ecc: from = 0x00080000, len = 4096
nand_read_ecc: from = 0x00081000, len = 4096
nand_read_ecc: from = 0x00082000, len = 4096
nand_read_ecc: from = 0x00083000, len = 4096
nand_write_ecc: to = 0x00080000, len = 12
nand_erase: start = 0x0007c000, len = 16384
nand_read_ecc: from = 0x0007c000, len = 4096
nand_read_ecc: from = 0x0007d000, len = 4096
nand_read_ecc: from = 0x0007e000, len = 4096
nand_read_ecc: from = 0x0007f000, len = 4096
nand_write_ecc: to = 0x0007c000, len = 12
nand_erase: start = 0x00078000, len = 16384
nand_read_ecc: from = 0x00078000, len = 4096
nand_read_ecc: from = 0x00079000, len = 4096
nand_read_ecc: from = 0x0007a000, len = 4096
nand_read_ecc: from = 0x0007b000, len = 4096
nand_write_ecc: to = 0x00078000, len = 12
nand_erase: start = 0x00074000, len = 16384
nand_read_ecc: from = 0x00074000, len = 4096
nand_read_ecc: from = 0x00075000, len = 4096
nand_read_ecc: from = 0x00076000, len = 4096
nand_read_ecc: from = 0x00077000, len = 4096
nand_write_ecc: to = 0x00074000, len = 12
nand_erase: start = 0x00070000, len = 16384
nand_read_ecc: from = 0x00070000, len = 4096
nand_read_ecc: from = 0x00071000, len = 4096
nand_read_ecc: from = 0x00072000, len = 4096
nand_read_ecc: from = 0x00073000, len = 4096
nand_write_ecc: to = 0x00070000, len = 12
nand_erase: start = 0x0006c000, len = 16384
nand_read_ecc: from = 0x0006c000, len = 4096
nand_read_ecc: from = 0x0006d000, len = 4096
nand_read_ecc: from = 0x0006e000, len = 4096
nand_read_ecc: from = 0x0006f000, len = 4096
nand_write_ecc: to = 0x0006c000, len = 12
nand_erase: start = 0x00068000, len = 16384
nand_read_ecc: from = 0x00068000, len = 4096
nand_read_ecc: from = 0x00069000, len = 4096
nand_read_ecc: from = 0x0006a000, len = 4096
nand_read_ecc: from = 0x0006b000, len = 4096
nand_write_ecc: to = 0x00068000, len = 12
nand_erase: start = 0x00064000, len = 16384
nand_read_ecc: from = 0x00064000, len = 4096
nand_read_ecc: from = 0x00065000, len = 4096
nand_read_ecc: from = 0x00066000, len = 4096
nand_read_ecc: from = 0x00067000, len = 4096
nand_write_ecc: to = 0x00064000, len = 12
nand_erase: start = 0x00060000, len = 16384
nand_read_ecc: from = 0x00060000, len = 4096
nand_read_ecc: from = 0x00061000, len = 4096
nand_read_ecc: from = 0x00062000, len = 4096
nand_read_ecc: from = 0x00063000, len = 4096
nand_write_ecc: to = 0x00060000, len = 12
nand_erase: start = 0x0005c000, len = 16384
nand_read_ecc: from = 0x0005c000, len = 4096
nand_read_ecc: from = 0x0005d000, len = 4096
nand_read_ecc: from = 0x0005e000, len = 4096
nand_read_ecc: from = 0x0005f000, len = 4096
nand_write_ecc: to = 0x0005c000, len = 12
nand_erase: start = 0x00058000, len = 16384
nand_read_ecc: from = 0x00058000, len = 4096
nand_read_ecc: from = 0x00059000, len = 4096
nand_read_ecc: from = 0x0005a000, len = 4096
nand_read_ecc: from = 0x0005b000, len = 4096
nand_write_ecc: to = 0x00058000, len = 12
nand_erase: start = 0x00054000, len = 16384
nand_read_ecc: from = 0x00054000, len = 4096
nand_read_ecc: from = 0x00055000, len = 4096
nand_read_ecc: from = 0x00056000, len = 4096
nand_read_ecc: from = 0x00057000, len = 4096
nand_write_ecc: to = 0x00054000, len = 12
nand_erase: start = 0x00050000, len = 16384
nand_read_ecc: from = 0x00050000, len = 4096
nand_read_ecc: from = 0x00051000, len = 4096
nand_read_ecc: from = 0x00052000, len = 4096
nand_read_ecc: from = 0x00053000, len = 4096
nand_write_ecc: to = 0x00050000, len = 12
nand_erase: start = 0x0004c000, len = 16384
nand_read_ecc: from = 0x0004c000, len = 4096
nand_read_ecc: from = 0x0004d000, len = 4096
nand_read_ecc: from = 0x0004e000, len = 4096
nand_read_ecc: from = 0x0004f000, len = 4096
nand_write_ecc: to = 0x0004c000, len = 12
nand_erase: start = 0x00048000, len = 16384
nand_read_ecc: from = 0x00048000, len = 4096
nand_read_ecc: from = 0x00049000, len = 4096
nand_read_ecc: from = 0x0004a000, len = 4096
nand_read_ecc: from = 0x0004b000, len = 4096
nand_write_ecc: to = 0x00048000, len = 12
nand_erase: start = 0x00044000, len = 16384
nand_read_ecc: from = 0x00044000, len = 4096
nand_read_ecc: from = 0x00045000, len = 4096
nand_read_ecc: from = 0x00046000, len = 4096
nand_read_ecc: from = 0x00047000, len = 4096
nand_write_ecc: to = 0x00044000, len = 12
nand_erase: start = 0x00040000, len = 16384
nand_read_ecc: from = 0x00040000, len = 4096
nand_read_ecc: from = 0x00041000, len = 4096
nand_read_ecc: from = 0x00042000, len = 4096
nand_read_ecc: from = 0x00043000, len = 4096
nand_write_ecc: to = 0x00040000, len = 12
nand_erase: start = 0x0003c000, len = 16384
nand_read_ecc: from = 0x0003c000, len = 4096
nand_read_ecc: from = 0x0003d000, len = 4096
nand_read_ecc: from = 0x0003e000, len = 4096
nand_read_ecc: from = 0x0003f000, len = 4096
nand_write_ecc: to = 0x0003c000, len = 12
nand_erase: start = 0x00038000, len = 16384
nand_read_ecc: from = 0x00038000, len = 4096
nand_read_ecc: from = 0x00039000, len = 4096
nand_read_ecc: from = 0x0003a000, len = 4096
nand_read_ecc: from = 0x0003b000, len = 4096
nand_write_ecc: to = 0x00038000, len = 12
nand_erase: start = 0x00034000, len = 16384
nand_read_ecc: from = 0x00034000, len = 4096
nand_read_ecc: from = 0x00035000, len = 4096
nand_read_ecc: from = 0x00036000, len = 4096
nand_read_ecc: from = 0x00037000, len = 4096
nand_write_ecc: to = 0x00034000, len = 12
nand_erase: start = 0x00030000, len = 16384
nand_read_ecc: from = 0x00030000, len = 4096
nand_read_ecc: from = 0x00031000, len = 4096
nand_read_ecc: from = 0x00032000, len = 4096
nand_read_ecc: from = 0x00033000, len = 4096
nand_write_ecc: to = 0x00030000, len = 12
nand_erase: start = 0x0002c000, len = 16384
nand_read_ecc: from = 0x0002c000, len = 4096
nand_read_ecc: from = 0x0002d000, len = 4096
nand_read_ecc: from = 0x0002e000, len = 4096
nand_read_ecc: from = 0x0002f000, len = 4096
nand_write_ecc: to = 0x0002c000, len = 12
nand_erase: start = 0x00028000, len = 16384
nand_read_ecc: from = 0x00028000, len = 4096
nand_read_ecc: from = 0x00029000, len = 4096
nand_read_ecc: from = 0x0002a000, len = 4096
nand_read_ecc: from = 0x0002b000, len = 4096
nand_write_ecc: to = 0x00028000, len = 12
nand_erase: start = 0x00024000, len = 16384
nand_read_ecc: from = 0x00024000, len = 4096
nand_read_ecc: from = 0x00025000, len = 4096
nand_read_ecc: from = 0x00026000, len = 4096
nand_read_ecc: from = 0x00027000, len = 4096
nand_write_ecc: to = 0x00024000, len = 12
nand_erase: start = 0x00020000, len = 16384
nand_read_ecc: from = 0x00020000, len = 4096
nand_read_ecc: from = 0x00021000, len = 4096
nand_read_ecc: from = 0x00022000, len = 4096
nand_read_ecc: from = 0x00023000, len = 4096
nand_write_ecc: to = 0x00020000, len = 12
nand_erase: start = 0x0001c000, len = 16384
nand_read_ecc: from = 0x0001c000, len = 4096
nand_read_ecc: from = 0x0001d000, len = 4096
nand_read_ecc: from = 0x0001e000, len = 4096
nand_read_ecc: from = 0x0001f000, len = 4096
nand_write_ecc: to = 0x0001c000, len = 12
nand_erase: start = 0x00018000, len = 16384
nand_read_ecc: from = 0x00018000, len = 4096
nand_read_ecc: from = 0x00019000, len = 4096
nand_read_ecc: from = 0x0001a000, len = 4096
nand_read_ecc: from = 0x0001b000, len = 4096
nand_write_ecc: to = 0x00018000, len = 12
nand_erase: start = 0x00014000, len = 16384
nand_read_ecc: from = 0x00014000, len = 4096
nand_read_ecc: from = 0x00015000, len = 4096
nand_read_ecc: from = 0x00016000, len = 4096
nand_read_ecc: from = 0x00017000, len = 4096
nand_write_ecc: to = 0x00014000, len = 12
nand_erase: start = 0x00010000, len = 16384
nand_read_ecc: from = 0x00010000, len = 4096
nand_read_ecc: from = 0x00011000, len = 4096
nand_read_ecc: from = 0x00012000, len = 4096
nand_read_ecc: from = 0x00013000, len = 4096
nand_write_ecc: to = 0x00010000, len = 12
nand_erase: start = 0x0000c000, len = 16384
nand_read_ecc: from = 0x0000c000, len = 4096
nand_read_ecc: from = 0x0000d000, len = 4096
nand_read_ecc: from = 0x0000e000, len = 4096
nand_read_ecc: from = 0x0000f000, len = 4096
nand_write_ecc: to = 0x0000c000, len = 12
nand_erase: start = 0x00008000, len = 16384
nand_read_ecc: from = 0x00008000, len = 4096
nand_read_ecc: from = 0x00009000, len = 4096
nand_read_ecc: from = 0x0000a000, len = 4096
nand_read_ecc: from = 0x0000b000, len = 4096
nand_write_ecc: to = 0x00008000, len = 12
nand_erase: start = 0x00004000, len = 16384
nand_read_ecc: from = 0x00004000, len = 4096
nand_read_ecc: from = 0x00005000, len = 4096
nand_read_ecc: from = 0x00006000, len = 4096
nand_read_ecc: from = 0x00007000, len = 4096
nand_write_ecc: to = 0x00004000, len = 12
nand_erase: start = 0x00000000, len = 16384
nand_read_ecc: from = 0x00000000, len = 4096
nand_read_ecc: from = 0x00001000, len = 4096
nand_read_ecc: from = 0x00002000, len = 4096
nand_read_ecc: from = 0x00003000, len = 4096
nand_write_ecc: to = 0x00000000, len = 12
nand_erase: start = 0x001fc000, len = 16384
nand_read_ecc: from = 0x001fc000, len = 4096
nand_read_ecc: from = 0x001fd000, len = 4096
nand_read_ecc: from = 0x001fe000, len = 4096
nand_read_ecc: from = 0x001ff000, len = 4096
nand_write_ecc: to = 0x001fc000, len = 12

debian:/home# cd /mnt/nand/
debian:/mnt/nand# ls -l >f1

nand_read_ecc: from = 0x001f8000, len = 12
nand_write_ecc: to = 0x001f8000, len = 12
nand_read_ecc: from = 0x001f800c, len = 16
nand_writev: to = 0x001f800c, len = 68, count = 1
nand_read_ecc: from = 0x001f8050, len = 16
nand_writev: to = 0x001f8050, len = 42, count = 2
nand_read_ecc: from = 0x001f807c, len = 16
nand_writev: to = 0x001f807c, len = 130, count = 2
nand_read_ecc: from = 0x001f800c, len = 12
nand_write_ecc: to = 0x001f800c, len = 12

debian:/mnt/nand# ls -l >f2

nand_read_ecc: from = 0x001f8100, len = 16
nand_writev: to = 0x001f8100, len = 68, count = 1
nand_write_page: Failed write verify, page 0x00000fc0 <5>Write of 68 bytes
at 0x001f8100 failed. returned -5, retlen 0
Not marking the space at 0x001f8100 as dirty because the flash driver
returned retlen zero
bash: f2: Input/output error

debian:/mnt/nand# ls -l >f3

nand_read_ecc: from = 0x001f8100, len = 16
ARGH. About to write node to 0x001f8100 on flash, but there are data already
there:
0x001f8100: 19 85 e0 02 00 00 00 44 a4 ef 22 3e 00 00 00 03
nand_writev: to = 0x001f8100, len = 68, count = 1
nand_write_page: Failed write verify, page 0x00000fc0 <5>Write of 68 bytes
at 0x001f8100 failed. returned -5, retlen 0
Not marking the space at 0x001f8100 as dirty because the flash driver
returned retlen zero
bash: f3: Input/output error

debian:/mnt/nand#
