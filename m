Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgqjP-0007fq-Uo
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 06:48:48 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 5/8] mtd: gpmi: use devm_ioremap_resource
Date: Thu, 14 Nov 2013 14:25:48 +0800
Message-ID: <1384410351-2169-6-git-send-email-b32955@freescale.com>
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

Use the devm_ioremap_resource to simplify the code.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   26 +++-----------------------
 1 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 36ef60a..1f99038 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -486,16 +486,9 @@ static int acquire_register_block(struct gpmi_nand_data *this,
 	void __iomem *p;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res_name);
-	if (!r) {
-		pr_err("Can't get resource for %s\n", res_name);
-		return -ENODEV;
-	}
-
-	p = ioremap(r->start, resource_size(r));
-	if (!p) {
-		pr_err("Can't remap %s\n", res_name);
-		return -ENOMEM;
-	}
+	p = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(p))
+		return PTR_ERR(p);
 
 	if (!strcmp(res_name, GPMI_NAND_GPMI_REGS_ADDR_RES_NAME))
 		res->gpmi_regs = p;
@@ -507,17 +500,6 @@ static int acquire_register_block(struct gpmi_nand_data *this,
 	return 0;
 }
 
-static void release_register_block(struct gpmi_nand_data *this)
-{
-	struct resources *res = &this->resources;
-	if (res->gpmi_regs)
-		iounmap(res->gpmi_regs);
-	if (res->bch_regs)
-		iounmap(res->bch_regs);
-	res->gpmi_regs = NULL;
-	res->bch_regs = NULL;
-}
-
 static int acquire_bch_irq(struct gpmi_nand_data *this, irq_handler_t irq_h)
 {
 	struct platform_device *pdev = this->pdev;
@@ -665,13 +647,11 @@ exit_clock:
 exit_dma_channels:
 	release_bch_irq(this);
 exit_regs:
-	release_register_block(this);
 	return ret;
 }
 
 static void release_resources(struct gpmi_nand_data *this)
 {
-	release_register_block(this);
 	release_bch_irq(this);
 	release_dma_channels(this);
 }
-- 
1.7.2.rc3
