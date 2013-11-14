Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgqjT-0007hC-Bl
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:48:52 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 6/8] mtd: gpmi: use devm_request_irq
Date: Thu, 14 Nov 2013 14:25:49 +0800
Message-ID: <1384410351-2169-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1384410351-2169-1-git-send-email-b32955@freescale.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_request_irq to simplify the code.
Also remove the unused fields of structure resources{}.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   27 +++++----------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    2 --
 2 files changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 1f99038..5617876 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -503,7 +503,6 @@ static int acquire_register_block(struct gpmi_nand_data *this,
 static int acquire_bch_irq(struct gpmi_nand_data *this, irq_handler_t irq_h)
 {
 	struct platform_device *pdev = this->pdev;
-	struct resources *res = &this->resources;
 	const char *res_name = GPMI_NAND_BCH_INTERRUPT_RES_NAME;
 	struct resource *r;
 	int err;
@@ -514,24 +513,11 @@ static int acquire_bch_irq(struct gpmi_nand_data *this, irq_handler_t irq_h)
 		return -ENODEV;
 	}
 
-	err = request_irq(r->start, irq_h, 0, res_name, this);
-	if (err) {
-		pr_err("Can't own %s\n", res_name);
-		return err;
-	}
-
-	res->bch_low_interrupt = r->start;
-	res->bch_high_interrupt = r->end;
-	return 0;
-}
-
-static void release_bch_irq(struct gpmi_nand_data *this)
-{
-	struct resources *res = &this->resources;
-	int i = res->bch_low_interrupt;
+	err = devm_request_irq(this->dev, r->start, irq_h, 0, res_name, this);
+	if (err)
+		dev_err(this->dev, "error requesting BCH IRQ\n");
 
-	for (; i <= res->bch_high_interrupt; i++)
-		free_irq(i, this);
+	return err;
 }
 
 static void release_dma_channels(struct gpmi_nand_data *this)
@@ -635,7 +621,7 @@ static int acquire_resources(struct gpmi_nand_data *this)
 
 	ret = acquire_dma_channels(this);
 	if (ret)
-		goto exit_dma_channels;
+		goto exit_regs;
 
 	ret = gpmi_get_clks(this);
 	if (ret)
@@ -644,15 +630,12 @@ static int acquire_resources(struct gpmi_nand_data *this)
 
 exit_clock:
 	release_dma_channels(this);
-exit_dma_channels:
-	release_bch_irq(this);
 exit_regs:
 	return ret;
 }
 
 static void release_resources(struct gpmi_nand_data *this)
 {
-	release_bch_irq(this);
 	release_dma_channels(this);
 }
 
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index a7685e3..4c801fa 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -26,8 +26,6 @@
 struct resources {
 	void __iomem  *gpmi_regs;
 	void __iomem  *bch_regs;
-	unsigned int  bch_low_interrupt;
-	unsigned int  bch_high_interrupt;
 	unsigned int  dma_low_channel;
 	unsigned int  dma_high_channel;
 	struct clk    *clock[GPMI_CLK_MAX];
-- 
1.7.2.rc3
