Received: from [203.88.139.151] (helo=qmailserver)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AcdtL-0000hg-Qx
	for linux-mtd@lists.infradead.org; Sat, 03 Jan 2004 05:00:04 +0000
Message-ID: <001a01c3d1b6$0dd6a650$db09a8c0@local.einfochips.co.in>
From: "Amit Mistry" <amit@einfochips.com>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 3 Jan 2004 10:27:13 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: mtd char and block both on same nand flash
Reply-To: Amit Mistry <amit@einfochips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have to write the MTD NAND driver for K9x1208 FLASH chip. Now, the
requirement is some of the blocks of FLASH need to be accessed like raw
block access as they contains bootloader and rest of the blocks will be
accessed through YAFFS file system. How can I access the some of the blocks
with raw FLASH access method and rest with some file system? May be the
correct question is: How can I distribute the whole NAND flash in a char
device for few blocks and block device for rest of the blocks?  In MTD
directory of linux kernel source, there are mtdchar.c and mtdblock.c they
provide the functionality of char and block driver. Can I use the mtdchar.c
and mtdblock.c of MTD layer or they are samples?  I would appreciate if you
can help me out. Thanks in advance.

Thanks & Regards,
Amit Mistry


Thanks & Regards,
Amit Mistry
Embedded Software Engineer
eInfochips Ltd.
email: amit@einfochips.com
phone: +91 - 79 - 6563705 x 535
---------------------------------------------------
