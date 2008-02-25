Received: from web36904.mail.mud.yahoo.com ([209.191.85.72])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTa34-00014F-9d
	for linux-mtd@lists.infradead.org; Mon, 25 Feb 2008 09:55:02 +0000
Date: Mon, 25 Feb 2008 09:54:58 +0000 (GMT)
From: Mark Underwood <basicmark@yahoo.com>
Subject: NAND driver
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <751269.90312.qm@web36904.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I’m writing a NAND driver for an ASIC. The NAND controller has been designed to handle page read &
writes with little SW intervention using interrupts or DMA, so I plan to implement the
write_page_raw & read_page_raw functions.
However, looking through nand_base.c it looks like not all NAND access go through these functions
so to start with I have implemented the cmd_ctrl function & supplied the IO_ADDR_R & IO_ADDR_W
address with the thinking that these would be a fall back when the access doesn't go through the
raw functions.
Unfortunately it seems the single write functionality of the controller is broken. The page  read
& write functionality only allow me to work in 512byte blocks so I can't write OOB that way. Can
you confirm that there are cases where OOB is written separately and if so do you have any
suggestions for getting around this problem?

Many thanks,

Mark



      ___________________________________________________________ 
Rise to the challenge for Sport Relief with Yahoo! For Good  

http://uk.promotions.yahoo.com/forgood/
