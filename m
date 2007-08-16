Received: from mx1.myoutlookonline.com ([69.25.74.51])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ILbqA-0005WJ-Sl
	for linux-mtd@lists.infradead.org; Thu, 16 Aug 2007 05:40:33 -0400
From: "Raj Kumar Yadav" <ryadav@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Subject: Handling badblock in MTD
Date: Thu, 16 Aug 2007 15:10:28 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <SMTP012FlmmlQ080Gxw00004743@Mx1.myOutLookonline.com>
Reply-To: ryadav@neomagic.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,


I am using ARM9 based board with 512MB large page(2K page, 256K

Block) nand flash. The linux kernel version is 2.6.14 with yaffs source on
date July 12, 2007 from http://www.aleph1.co.uk/cgi-bin/viewcvs.cgi/yaffs2/.

I am using the NAND controller present in the SoC, it broadly provide a
interface over the NAND SMI interface. Instead of reading/writing through
the SMI lines, we read/write to/from the FIFO buffer(length 512byte) of NAND
Controller. 

All the command/data transfer/status can be initiated/read from the NAND
controller registers.

Using NAND MTD Software ECC for data correction.

MTD configuration

#

# NAND Flash Device Drivers

#

CONFIG_MTD_NAND=y

CONFIG_MTD_NAND_VERIFY_WRITE=y

CONFIG_MTD_NAND_MM6PLUS=y

CONFIG_MTD_NAND_IDS=y

# CONFIG_MTD_NAND_DISKONCHIP is not set

# CONFIG_MTD_NAND_NANDSIM is not set

In the nand flash, there are 5 partition with last partition as ~450MB. The
kernel boots up from 2nd partition which have readonly yaffs2 image as
rootfs. After bootup, we are mounting this ~450MB partition as yaffs2 and do
read/write operation as needed.

To ensure the successful completion of a page write, I am using MTD write
verify.


Until now, all read/write/mount/unmount were working fine.

Now on unmount the ~450MB partition, on one particular block the NAND verify
failed, and It is found that the block is actually bad, as I am unable to
erase/write on that _block_ using nand-utils or the custom bootloader
commands.


NAND Controller shows the status as success after each erase/write.


But after the erase, all bytes on the 1st, 3rd, 5th, ... pages Are 0xFF. and
all bytes on the 2nd, 4th, 6th,... page are 0x00.

Similarily, writing whatsoever data pattern on any of the pages in that
block have no effect on the page data.

It seems, the block is bad to an extent that the erase also have no effect.
This means that, I cannot mark the block bad, as the first page is all 0xff
and write on the page has no effect on page data.

So, ending up to a situation, where the block will never be marked bad, and
the write will always fail (due to MTD NAND verify) on the block pages.

Currently, we are using the first byte of the first page in the Block to
detect/mark the block as bad.

What is the standard solution for this, Should the second page also be used
for detecting the bad block in MTD nand layer. But then how far we can go
about adding the pages to detect/mark bad block. 

Is there any better method/policy to deal with it?

All suggestions are aesthetically welcome.

Thanks,

Raj Kumar Yadav
