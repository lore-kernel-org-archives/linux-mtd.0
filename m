Received: from [203.196.158.48] (helo=procsys.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMg9b-0006GC-Cs
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 04:10:52 +0000
Message-ID: <3FBC3FBB.AEDF510C@procsys.com>
Date: Thu, 20 Nov 2003 09:44:52 +0530
From: Shreekanth Hiremath <hiremath@procsys.com>
MIME-Version: 1.0
To: 'Infradead Org' <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: MTD Flash low voltage error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi  ,

We are facing some problem with JFFS2 filesystem and MTD driver as
explained below.

Two 16MB flash are connected to  CS0 EMIFS  interface of OMAP.
And the VPP for both the flash is controlled by the OMAP.
There are total 7 partitions 6 partitions on flash0 and 1 partition on
flash1.

When we mount the partition 5 (which is on flash0) and partition 6
(which is on flash1) as follows.

mount -t jffs2  /dev/mtdblock/5 /prim_jffs2
mount -t jffs2 /dev/mtdblock/6 /mirror_jffs2

And if I issue copy & delete continuously on these partitions
I am getting "Chip reports voltage low on erase: status 0xa8" error
message.

But if I issue copy &  delete on only one partition,its working fine.

By this it seems that when erase operation is done on both the flash
the "low voltage" error occurs.
The status register value is 0xa8, i.e. bit 3 (low voltage error)  & 5
(error in block erase) are set.


Regards
Shreekanth Hiremath
