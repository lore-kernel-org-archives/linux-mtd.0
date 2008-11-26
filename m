Received: from web38806.mail.mud.yahoo.com ([209.191.125.97])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L5Imp-0002gN-RL
	for linux-mtd@lists.infradead.org; Wed, 26 Nov 2008 11:42:28 +0000
Date: Wed, 26 Nov 2008 03:35:46 -0800 (PST)
From: Vijay Soni <vij_soni@yahoo.com>
Subject: 4K page size NF
To: linux-mtd@lists.infradead.org
In-Reply-To: <mailman.7662.1227544522.2802.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <638160.82732.qm@web38806.mail.mud.yahoo.com>
Reply-To: vij_soni@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are using MontaVista linux kernel 4.0.1 based on linux 2.6.10 meant for  TI DaVinci processor (DM355) evaluation board. This evaluation board uses one NandFlash (MT29F16G08FAA) which is (2048 + 64) bytes per page and 64 pages per blk.  We have modified the hardware to add another Nand Flash MT29F64G08TAA which is 4096 + 128 bytes per page and 128 pages per blk. These two Nand Flash are using sharing the IO lines and chip select logic such that only one can be selected at a time by the chip select decoding logic. The first NF (smaller) has the boot partition and root file system based on yaffs2. The large NandFlash is going to be added to record application specific data. Could anyone please guide us on what changes will be required in the code to achieve this.
 


      
