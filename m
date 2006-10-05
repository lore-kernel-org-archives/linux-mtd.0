Received: from web205.biz.mail.re2.yahoo.com ([68.142.224.167])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVY3i-0007Qb-5j
	for linux-mtd@lists.infradead.org; Thu, 05 Oct 2006 14:35:07 -0400
Message-ID: <20061005183500.69337.qmail@web205.biz.mail.re2.yahoo.com>
Date: Thu, 5 Oct 2006 11:35:00 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Problem with developing Samsung K9F1G08U0A MTD driver
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have ARM (Cirrus Logic EP93XX) based systems
running Linux 2.6.8.1.  We are trying to add NAND
driver for Samsung K9F1G08U0A chip on the board.  We
are able to have the driver read the MTD and register
the device.  However writing to the chip using
nandwrite seem to write some bytes in the OOB area and
mark the block bad.  Checking with mtd_debug program,
the information returned as following,

mtd.type = NAND FLASH
mtd.flags = MTD_CLEAR_BITS | MTD_ERASEABLE | MTD_OOB |
MTD_ECC
mtd.size = 134217728 (128M)
mtd.erasesize = 131072 (128K)
mtd.oobblock = 2048 (2K)
mtd.oobsize = 64 
mtd.ecctype = MTD_ECC_NONE
regions = 0

The mtd.flags shows the MTD_ECC is set but the
mtd.ecctype is set to MTD_ECC_NONE.  We have the
following line in the driver code,

this->eccmode = NAND_ECC_SOFT;

Does this set the mtd.flags or set the mtd.ecctype?

What should be the right setting for the Samsung chip?

Thanks in advance.

ZL
