Received: from [210.72.128.8] (helo=sict.ac.cn)
	by pentafluge.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CelPl-0008GD-SG
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 02:30:51 +0000
Received: from [10.32.4.45] ([10.32.4.45])
	by sict.ac.cn (Merak 7.2.0) with ASMTP id 42U08685
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 10:30:34 +0800
From: zhang jingxin <zhangjingxin@sict.ac.cn>
To: list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Message-Id: <1103164209.2460.9.camel@z21921>
Mime-Version: 1.0
Date: Thu, 16 Dec 2004 10:30:10 +0800
Content-Transfer-Encoding: 7bit
Subject: doc2000 flash_eraseall error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi

I'am having trouble eraseing the doc2000.

I use doc2000(NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 (Toshiba
NAND 32MiB 3,3V 8-bit)).This is a linux with kernel 2.4.27 and the
mtdsnapshot 20041128.

The dmesg show:
Dec 16 08:46:16 localhost kernel: mtd: Giving out device 0 to DiskOnChip
2000 (NFTL Model)
Dec 16 08:46:16 localhost kernel: Creating 1 MTD partitions on
"DiskOnChip 2000(NFTL Model)":
Dec 16 08:46:16 localhost kernel: 0x00014000-0x02000000 : " DiskOnChip
BDTL partition"

and the /proc/mtd show:
[root@localhost util]# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 02000000 00004000 "DiskOnChip 2000 (NFTL Model)"
mtd1: 01fec000 00004000 " DiskOnChip BDTL partition"

It seems to be ok.
Then I use utils/erase

[root@localhost util]# ./flash_eraseall -j /dev/mtd1
./flash_eraseall: /dev/mtd1: No such device

but I am sure the mtd* device exist.
I have use MAKEDEV.

[root@localhost util]# ls -l /dev/mtd*
crw-r--r--    1 root     root      90,   0 Dec 16 08:19 /dev/mtd0
crw-r--r--    1 root     root      90,   2 Dec 16 08:19 /dev/mtd1
crw-r--r--    1 root     root      90,  20 Dec 16 08:19 /dev/mtd10
crw-r--r--    1 root     root      90,  22 Dec 16 08:19 /dev/mtd11
crw-r--r--    1 root     root      90,  24 Dec 16 08:19 /dev/mtd12
crw-r--r--    1 root     root      90,  26 Dec 16 08:19 /dev/mtd13
crw-r--r--    1 root     root      90,  28 Dec 16 08:19 /dev/mtd14
crw-r--r--    1 root     root      90,  30 Dec 16 08:19 /dev/mtd15
crw-r--r--    1 root     root      90,  32 Dec 16 08:19 /dev/mtd16
crw-r--r--    1 root     root      90,   4 Dec 16 08:19 /dev/mtd2
crw-r--r--    1 root     root      90,   6 Dec 16 08:19 /dev/mtd3
crw-r--r--    1 root     root      90,   8 Dec 16 08:19 /dev/mtd4
crw-r--r--    1 root     root      90,  10 Dec 16 08:19 /dev/mtd5
crw-r--r--    1 root     root      90,  12 Dec 16 08:19 /dev/mtd6
crw-r--r--    1 root     root      90,  14 Dec 16 08:19 /dev/mtd7
..........

So what should I do?

Thanks.
			zhang jingxin
