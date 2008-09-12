Received: from web38908.mail.mud.yahoo.com ([209.191.125.114])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeEO3-0003Md-Pv
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 19:33:00 +0000
Date: Fri, 12 Sep 2008 12:32:57 -0700 (PDT)
From: Brian Kuschak <bkuschak@yahoo.com>
Subject: async page mode flash support?
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <674997.8945.qm@web38908.mail.mud.yahoo.com>
Reply-To: bkuschak@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do the current CFI physmap flash drivers (2.6.18+) support NOR flash configured to operate in async page mode?  

When I enable async page mode access in the memory controller, the CFI probe fails.  I can verify on a logic analyzer and BDI-2000 that the CPU is doing an 8-word (16 byte) burst read from the flash.  My bootrom and BDI-2K verify that the data is in fact transferred properly (csums match in regular and page-mode reads).  However, linux fails the cfi probe.  It looks like the CFI query commands are in fact sent as single-word cycles, not burst mode.  (This is as it should be).

Anyone else successful using page-mode flash?

Thx,
Brian



      
