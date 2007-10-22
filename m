Received: from web405.biz.mail.mud.yahoo.com ([68.142.201.36])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ik4j0-0001za-7U
	for linux-mtd@lists.infradead.org; Mon, 22 Oct 2007 22:22:17 +0100
Date: Mon, 22 Oct 2007 14:21:06 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: MTD driver for MLC NAND chips
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <38608.90724.qm@web405.biz.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does current MTD support MLC NAND chips?  I tried the
Samsung K9LAG08U0M (2GiB) on our board with Linux
2.6.22.1 kernel but got a invalid pointer 0 reference
in the nand_scan function.  The same kernel works fine
without any problem when using Samsung K9F1G08U0M
(128MiB).  Is there any thing special that must be
done in the NAND driver for MLC chip?

Thanks in advance

zl
