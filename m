Received: from ns.pmeerw.net ([87.118.82.44] helo=pmeerw.net)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrooD-0002cf-In
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2012 11:22:18 +0000
From: Peter Meerwald <pmeerw@pmeerw.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand omap2: fix some typos in comments
Date: Thu, 19 Jul 2012 13:21:04 +0200
Message-Id: <1342696864-26236-1-git-send-email-pmeerw@pmeerw.net>
Cc: jzhang@ti.com, David.Woodhouse@intel.com,
 Peter Meerwald <p.meerwald@bct-electronic.com>,
 Artem.Bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Meerwald <p.meerwald@bct-electronic.com>

Signed-off-by: Peter Meerwald <p.meerwald@bct-electronic.com>
---
 drivers/mtd/nand/omap2.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index d7f681d..dd87a34 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -347,7 +347,7 @@ static void omap_nand_dma_cb(int lch, u16 ch_status, void *data)
 }
 
 /*
- * omap_nand_dma_transfer: configer and start dma transfer
+ * omap_nand_dma_transfer: configure and start dma transfer
  * @mtd: MTD device structure
  * @addr: virtual address in RAM of source/destination
  * @len: number of data bytes to be transferred
@@ -365,7 +365,7 @@ static inline int omap_nand_dma_transfer(struct mtd_info *mtd, void *addr,
 	unsigned long tim, limit;
 
 	/* The fifo depth is 64 bytes max.
-	 * But configure the FIFO-threahold to 32 to get a sync at each frame
+	 * But configure the FIFO-threshold to 32 to get a sync at each frame
 	 * and frame length is 32 bytes.
 	 */
 	int buf_len = len >> 6;
@@ -474,7 +474,7 @@ static void omap_write_buf_dma_pref(struct mtd_info *mtd,
 }
 
 /*
- * omap_nand_irq - GMPC irq handler
+ * omap_nand_irq - GPMC irq handler
  * @this_irq: gpmc irq number
  * @dev: omap_nand_info structure pointer is passed here
  */
@@ -1214,8 +1214,8 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 
 	/*
 	 * If RDY/BSY line is connected to OMAP then use the omap ready
-	 * funcrtion and the generic nand_wait function which reads the status
-	 * register after monitoring the RDY/BSY line.Otherwise use a standard
+	 * function and the generic nand_wait function which reads the status
+	 * register after monitoring the RDY/BSY line. Otherwise use a standard
 	 * chip delay which is slightly more than tR (AC Timing) of the NAND
 	 * device and read status register until you get a failure or success
 	 */
@@ -1284,7 +1284,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 
 	info->nand.verify_buf = omap_verify_buf;
 
-	/* selsect the ecc type */
+	/* select the ecc type */
 	if (pdata->ecc_opt == OMAP_ECC_HAMMING_CODE_DEFAULT)
 		info->nand.ecc.mode = NAND_ECC_SOFT;
 	else if ((pdata->ecc_opt == OMAP_ECC_HAMMING_CODE_HW) ||
-- 
1.7.5.4
