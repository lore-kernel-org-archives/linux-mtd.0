Received: from smtp08.smtpout.orange.fr ([80.12.242.130]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZW82f-00073c-F6
 for linux-mtd@lists.infradead.org; Sun, 30 Aug 2015 19:13:26 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on removal
Date: Sun, 30 Aug 2015 21:08:30 +0200
Message-Id: <1440961710-17347-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After the conversion of pxa architecture to common clock framework, the
NAND clock can be disabled on driver exit.

In this case, it happens that if the driver used the NAND and set the
DFI arbitration bit, the next access to a static memory controller area,
such as an ethernet card, will stall the system bus, and the core will
be stalled forever.

This is especially true on pxa31x SoCs, where the NDCR was augmented
with a new bit to prevent this lockups by giving full ownership of the
DFI arbiter to the SMC, in change SCr#6.

Fix this by clearing the DFI arbritration bit in driver exit. This
effectively prevents a lockup on zylonite when removing pxa3xx-nand
module, and using ethernet afterwards.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

---
Since v1: add comment, switch to NFCV1/NCFV2 registers naming
---
 drivers/mtd/nand/pxa3xx_nand.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 718097414b9c..2f39bfe34584 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -75,7 +75,8 @@
 #define NDCR_ND_MODE		(0x3 << 21)
 #define NDCR_NAND_MODE   	(0x0)
 #define NDCR_CLR_PG_CNT		(0x1 << 20)
-#define NDCR_STOP_ON_UNCOR	(0x1 << 19)
+#define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
+#define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)
 #define NDCR_RD_ID_CNT_MASK	(0x7 << 16)
 #define NDCR_RD_ID_CNT(x)	(((x) << 16) & NDCR_RD_ID_CNT_MASK)
 
@@ -1305,7 +1306,8 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	}
 
 	/* Set an initial chunk size */
-	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
+	info->reg_ndcr = ndcr &
+		~(NDCR_INT_MASK | NDCR_ND_ARB_EN | NFCV1_NDCR_ARB_CNTL);
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
 	return 0;
@@ -1542,6 +1544,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	pxa3xx_flash_ids[1].name = NULL;
 	def = pxa3xx_flash_ids;
 KEEP_CONFIG:
+	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
 	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
@@ -1768,6 +1771,16 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 		free_irq(irq, info);
 	pxa3xx_nand_free_buff(info);
 
+	/*
+	 * In the pxa3xx case, the DFI bus is shared between the SMC and NFC.
+	 * In order to prevent a lockup of the system bus, the DFI bus
+	 * arbitration is granted to SMC upon driver removal. This is done by
+	 * setting the x_ARB_CNTL bit, which also prevents the NAND to have
+	 * access to the bus anymore.
+	 */
+	nand_writel(info, NDCR,
+		    (nand_readl(info, NDCR) & ~NDCR_ND_ARB_EN) |
+		    NFCV1_NDCR_ARB_CNTL);
 	clk_disable_unprepare(info->clk);
 
 	for (cs = 0; cs < pdata->num_cs; cs++)
-- 
2.1.4
