Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=ocean.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmqRV-0007ud-Tu
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 04:57:47 -0400
Received: from [203.26.222.199] (unknown [203.26.222.199])
	by ocean.magtech.com.au (Postfix) with ESMTP id E39A4405CA2F
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jul 2004 18:56:58 +1000 (EST)
Message-ID: <40FCDE5A.6080504@magellan-technology.com>
Date: Tue, 20 Jul 2004 18:56:58 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: problems mounting >3.3MB JFFS2 partitions on Dataflash on
	AT91RM9200DK
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I can't seem to mount a partition greater than about 3.3MB. All 
partitions below this size *seem* to work fine.

a partition of this size will mount:
hex: 0x34c980, decimal: 3459456, erase blocks: 3276

a partition greater than or equal to this size will NOT mount:
hex: 0x34cda0, decimal: 3460512, erase blocks: 3277

I am running Linux-2.4.6-VRS-1 on the AT91RM9200DK development board. I 
have tried using command line partitions and setting at91_dataflash.c, 
it makes no difference.

My kernel command line is:

root=/dev/ram=rx initrd=0x21100000,6000000 ramdisk_size=15360 
console=ttyS0,115200,mem=32M
mtdparts=dataflash0:1047552(kernel_image)ro,0x400080(4MB_part),0x3000
60(3MB_part),-(the_rest)

This gives:
dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"
mtd1: 000ffc00 00000420 "kernel_image"
mtd2: 00400080 00000420 "4MB_part"
mtd3: 00300060 00000420 "3MB_part"
mtd4: 00040320 00000420 "the_rest"

mtd3 and mtd4 will mount, mtd2 will not mount. e.g.

$mount -t jffs2 /dev/mtdblock/2 /mnt
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock/2,
        or too many mounted file systems
[root@AT91RM9200DK /root]$

I did notice one other strange thing. I turned on a DEBUG option in 
at91_dataflash.c that showed all access to the dataflash device. When I 
mounted the mtd3 or mtd4, it showed reading activity going on with the 
dataflash. But when I mounted mtd2, the dataflash was not even accessed. 
It is like the software isn't even getting that far.

e.g. mounting mtd4, note the debug output

[root@AT91RM9200DK /root]$mount -t jffs2 /dev/mtdblock/4 /mnt/4
dataflash_read: 8387808 .. 8388864, 1056, 0x0420 bytes
READ: (e8) f8 38 0
   data: 85, 19, 03, 20, 0c, 00, 00, 00, b1, b0, 1e, e4, ff, ff, ff, ff,
dataflash_read: 8387808 .. 8387820, 12, 0x000c bytes

... SNIP ...

dataflash_read: 8648720 .. 8648764, 44, 0x002c bytes
READ: (e8) ff f0 50
   data: 85, 19, 01, e0, 2c, 00, 00, 00, 5f, 56, f1, e0, 01, 00, 00, 00,

[root@AT91RM9200DK /root]$mount
/dev/rd/0 on / type ext2 (ro)
/proc on /proc type proc (rw)
/dev/mtdblock/4 on /mnt/4 type jffs2 (rw)


e.g. mounting mtd2, note the lack of debug output

[root@AT91RM9200DK /root]$mount -t jffs2 /dev/mtdblock/2 /mnt/2
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock/2,
        or too many mounted file systems

It doesn't even access the dataflash. So I suspect that something in a 
higher layer is saying that this partition isn't valid.

Any help or hints would be appreciated.

Aras
