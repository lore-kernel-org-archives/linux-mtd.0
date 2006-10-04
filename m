Received: from web204.biz.mail.re2.yahoo.com ([68.142.224.166])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVGeM-0002CP-Hp
	for linux-mtd@lists.infradead.org; Wed, 04 Oct 2006 19:59:45 -0400
Message-ID: <20061004235941.17235.qmail@web204.biz.mail.re2.yahoo.com>
Date: Wed, 4 Oct 2006 16:59:41 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Problem with Samsung NAND K9F1G08 on ARM board
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

We have a Cirrus Logic EP93xx ARM processor based
board that we want to put NAND chip on.  So far we can
get the MTD driver to recognize the chip and read with
the MTD utility nanddump using Linux 2.6.8.1 ARM port.
 When writing to the chip using nandwrite, it some how
puts some data bytes in the OOB that would make the
MTD driver think the block is bad on next scan.  We
can use our own testing program to write to the chip
and erase it using direct I/O control (on some of the
blocks, the test program may not have right logic to
translate address to write to all blocks).  That seems
to prove the hardware would not be the problem.  The
question is which program puts data in OOB, the MTD
driver or the nandwrite? The chip has 128K erase
block, 2K page size.  The MTD driver is set to have
software ECC.  Is this the correct setting for the
chip?

Thanks in advance,

ZL
