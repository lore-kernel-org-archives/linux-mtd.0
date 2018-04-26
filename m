Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj2J-0005id-S5
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:22 +0000
Received: by mail-wm0-x242.google.com with SMTP id b21so14198961wme.4
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:42:09 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>
Subject: [PATCH 09/13] mtd: rawnand: gpmi: poll the BCH interrupt bit in
 start_dma_with_bch_irq()
Date: Thu, 26 Apr 2018 17:41:30 +0200
Message-Id: <20180426154134.8270-10-sam.lefebvre@essensium.com>
In-Reply-To: <20180426154134.8270-1-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To improve nand performance, the BCH interrupt bit must be polled
before waiting for occurence. This avoids an unnecessary context switch.

Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 60bc1bac7741..28a2cf106ddc 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -503,18 +503,31 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
  * Actually, we must wait for two interrupts :
  *	[1] firstly the DMA interrupt and
  *	[2] secondly the BCH interrupt.
+ *	To improve performance, we first poll for the BCH
+ *	interrupt.
  */
 int start_dma_with_bch_irq(struct gpmi_nand_data *this,
 			struct dma_async_tx_descriptor *desc)
 {
 	struct completion *bch_c = &this->bch_done;
+	struct resources *r = &this->resources;
 	unsigned long timeout;
 
-	/* Prepare to receive an interrupt from the BCH block. */
-	init_completion(bch_c);
+	/* Disable interrupt */
+	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN, r->bch_regs + HW_BCH_CTRL_CLR);
 
 	/* start the DMA */
 	start_dma_without_bch_irq(this, desc);
+	if (readl(r->bch_regs + HW_BCH_CTRL) & BM_BCH_CTRL_COMPLETE_IRQ) {
+		writel(BM_BCH_CTRL_COMPLETE_IRQ, r->bch_regs + HW_BCH_CTRL_CLR);
+		return 0;
+	}
+
+	/* Prepare to receive an interrupt from the BCH block. */
+	init_completion(bch_c);
+
+	/* Re-enable interrupt */
+	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN, r->bch_regs + HW_BCH_CTRL_SET);
 
 	/* Wait for the interrupt from the BCH block. */
 	timeout = wait_for_completion_timeout(bch_c, msecs_to_jiffies(1000));
-- 
2.14.1
