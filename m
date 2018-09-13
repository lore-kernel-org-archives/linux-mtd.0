Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0KfJ-0007aM-6N
 for linux-mtd@lists.infradead.org; Thu, 13 Sep 2018 05:59:47 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: rawnand: denali: fix a race condition when DMA is kicked
Date: Thu, 13 Sep 2018 14:58:49 +0900
Message-Id: <1536818329-11068-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I thought the read-back of the DMA_ENABLE register was unnecessary
(at least it is working on my boards), then deleted it in commit
586a2c52909d ("mtd: nand: denali: squash denali_enable_dma() helper
into caller").  Sorry, I was wrong - it caused a timing issue on
Cyclone5 SoCFPGAs.

Revive the register read-back, commenting why this is necessary.

Fixes: 586a2c52909d ("mtd: nand: denali: squash denali_enable_dma() helper into caller")
Reported-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 67b2065..b864b93 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -596,6 +596,12 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
 	}
 
 	iowrite32(DMA_ENABLE__FLAG, denali->reg + DMA_ENABLE);
+	/*
+	 * The ->setup_dma() hook kicks DMA by using the data/command
+	 * interface, which belongs to a different AXI port from the
+	 * register interface.  Read back the register to avoid a race.
+	 */
+	ioread32(denali->reg + DMA_ENABLE);
 
 	denali_reset_irq(denali);
 	denali->setup_dma(denali, dma_addr, page, write);
-- 
2.7.4
