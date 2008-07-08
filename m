Received: from sm4.cyberspaceindia.com ([64.34.180.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGCm4-0003gi-F4
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 12:58:29 +0000
Subject: NAND Flash bad blocks
From: Prakash N <prakash@celestialsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 08 Jul 2008 18:27:52 +0530
Message-Id: <1215521872.3127.87.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

I am using 256MB NAND Flash. I have created 4 partitions of 64 MB each.
I have a program to mark a particular block as a bad block. 

I notice when I create a bad block within 22 blocks from the start of a
partition, though I am able to erase all the blocks properly skipping
all the bad blocks created, it is unable to copy the file system to the
partition, it gives I/O error as below. For example my partitions starts
from 0x0, 0x4000000,0x8000000 and 0xc000000 with block numbers at
0,512,1024 & 1536. The block size is 128 KB (0x20000). I get this error
if I create bad blocks any where from 2 to 22, 512 to 533, 1024 to 1045
& 1536 to 1557.

======
flash_eraseall /dev/mtd1
Erasing 128 Kibyte @ 0 --  0 % complete.
Skipping bad block at 0x00020000
Erasing 128 Kibyte @ 3a00000 -- 90 % complete.
Skipping bad block at 0x03a20000
Erasing 128 Kibyte @ 3fe0000 -- 99 % complete.
sh-3.00# flashcp /home/jffs2.img /dev/mtd1
nand_erase: attempt to erase a bad block at page 0x00008040
While erasing blocks from 0x00000000-0x002c0000 on /dev/mtd1:
Input/output error
======

If I create bad blocks in the range of 22 to 511, 534 to 1023, 1046 to
1535 and 1558 to 2047 I do not face any issue. It skips the bad blocks
properly and it can copy the file system to the partition.

I appreciate if any one give an explanation for the same. Is it not
possible to have bad blocks in the start of a partition? How the magic
number 22 blocks can be explained in this situation. I really appreciate
your help. 

Prakash
