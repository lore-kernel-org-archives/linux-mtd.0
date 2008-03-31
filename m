Received: from el-out-1112.google.com ([209.85.162.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgP2b-00010Y-3K
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 18:47:33 +0000
Received: by el-out-1112.google.com with SMTP id o28so544899ele.3
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Mar 2008 11:47:32 -0700 (PDT)
Message-ID: <94a0ccbc0803311141y2801a2cbs45cafdccf9487d93@mail.gmail.com>
Date: Mon, 31 Mar 2008 22:41:12 +0400
From: "Oleg Strikov" <oleg.strikov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: NAND partition problem (ATMEL at91sam9260-ek)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good day!
I've built my own 2.6.24 kernel for `subj` evaluation kit, all is OK
but i don't know how to create my own NAND partitions.
I think that at91sam NAND driver do it somewhere, but i can't find it
myself in kernel.
During boot i get a lot of confusing info, itll be GREAT if you can
explain me some points!

Starting kernel ...

Uncompressing Linux.............................................................................................
done, booting the kernel.
Linux version 2.6.24 (root@oleg.strikov) (gcc version 4.1.2) #16 Mon
Mar 31 19:22:04 MSD 2008
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
Machine: Atmel AT91SAM9260-EK
Memory policy: ECC disabled, Data cache writeback
...
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit)
AT91 NAND: 8-bit, [SET-1] Hardware Syndrome ECC
Scanning device for bad blocks
Creating 2 MTD partitions on "at91_nand":
0x00000000-0x00040000 : "Partition 1"
0x00040000-0x10000000 : "Partition 2"
/* WHERE CAN I CHANGE OFFSETS AND LENGTH OF MY PARTITIONS?
CAN I DO IT WITHOUT PASSINGKERNEL ARGUMENTS? */
...
List of all partitions:
1f00        256 mtdblock0 (driver?)
1f01     261888 mtdblock1 (driver?)
/* WHAT `(driver?)` MEANS? ALL IS OK? :)  */

No filesystem could mount root, tried:  ext2 cramfs msdos vfat
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(1,0)

-----------
One additional question, please...
Is it correct way:
1) I place my jffs image on NAND (e.g. 0x10 - 0x20)
2) I create mtdblock partition 0x10-0x20
3) I pass this part like rootfs
?

THANKS!!!
