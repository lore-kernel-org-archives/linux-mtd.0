Received: from web413.biz.mail.mud.yahoo.com ([68.142.200.60])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5OSB-0008QH-Qz
	for linux-mtd@lists.infradead.org; Mon, 02 Jul 2007 12:08:46 -0400
Date: Mon, 2 Jul 2007 09:08:38 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Strange NAND scan problem
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <3675.92965.qm@web413.biz.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have a custom board using Cirrus Logic EP93XX
processor.  The NAND flash data bus is connected to
the SRAM bus and using GPIO line for device control. 
If compiled with ARM native gcc-3.4 compiler,
everything works great.  But if compiled with ARM
native gcc-4.1 compiler, it works fine when there IS a
NAND flash chip.  But the nand_scan will report bogus
NAND chip when there IS NO NAND chip in the system and
proceed to scan the bad blocks which it finds plenty. 
First thought is that maybe the SRAM bus was in high Z
and it will read back what ever it was written to the
previous instruction.  But would versions of compiler
make a difference as what would be read back?
