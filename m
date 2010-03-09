Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Np1tE-0005UN-En
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 16:02:41 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: Blackfin NFC: localize MMR bit masks
Date: Tue,  9 Mar 2010 11:05:48 -0500
Message-Id: <1268150748-27499-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert all magic numbers into appropriate defines, and move the defines
out of the global namespace and into this one driver.  No other driver
needs to care about the MMR layout anyways.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
note: this can be merged for 2.6.34 or 2.6.35

 drivers/mtd/nand/bf5xx_nand.c |   29 +++++++++++++++++++++++++----
 1 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 8506e7e..2974995 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -68,6 +68,27 @@
 #define DRV_AUTHOR	"Bryan Wu <bryan.wu@analog.com>"
 #define DRV_DESC	"BF5xx on-chip NAND FLash Controller Driver"
 
+/* NFC_STAT Masks */
+#define NBUSY       0x01  /* Not Busy */
+#define WB_FULL     0x02  /* Write Buffer Full */
+#define PG_WR_STAT  0x04  /* Page Write Pending */
+#define PG_RD_STAT  0x08  /* Page Read Pending */
+#define WB_EMPTY    0x10  /* Write Buffer Empty */
+
+/* NFC_IRQSTAT Masks */
+#define NBUSYIRQ    0x01  /* Not Busy IRQ */
+#define WB_OVF      0x02  /* Write Buffer Overflow */
+#define WB_EDGE     0x04  /* Write Buffer Edge Detect */
+#define RD_RDY      0x08  /* Read Data Ready */
+#define WR_DONE     0x10  /* Page Write Done */
+
+/* NFC_RST Masks */
+#define ECC_RST     0x01  /* ECC (and NFC counters) Reset */
+
+/* NFC_PGCTL Masks */
+#define PG_RD_START 0x01  /* Page Read Start */
+#define PG_WR_START 0x02  /* Page Write Start */
+
 #ifdef CONFIG_MTD_NAND_BF5XX_HWECC
 static int hardware_ecc = 1;
 #else
@@ -487,7 +508,7 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 	 * transferred to generate the correct ECC register
 	 * values.
 	 */
-	bfin_write_NFC_RST(0x1);
+	bfin_write_NFC_RST(ECC_RST);
 	SSYNC();
 
 	disable_dma(CH_NFC);
@@ -497,7 +518,7 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 	set_dma_config(CH_NFC, 0x0);
 	set_dma_start_addr(CH_NFC, (unsigned long) buf);
 
-/* The DMAs have different size on BF52x and BF54x */
+	/* The DMAs have different size on BF52x and BF54x */
 #ifdef CONFIG_BF52x
 	set_dma_x_count(CH_NFC, (page_size >> 1));
 	set_dma_x_modify(CH_NFC, 2);
@@ -517,9 +538,9 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 
 	/* Start PAGE read/write operation */
 	if (is_read)
-		bfin_write_NFC_PGCTL(0x1);
+		bfin_write_NFC_PGCTL(PG_RD_START);
 	else
-		bfin_write_NFC_PGCTL(0x2);
+		bfin_write_NFC_PGCTL(PG_WR_START);
 	wait_for_completion(&info->dma_completion);
 }
 
-- 
1.7.0.2
