Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvDza-00075W-Bx
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 00:05:43 +0000
Received: by pdea3 with SMTP id a3so86949258pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 17:05:21 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/3] mtd: brcmnand: refactor bcm63138 SoC layering
Date: Wed, 20 May 2015 17:05:04 -0700
Message-Id: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes an unnecessary allocation and saves a little bit of pointer
chasing.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand/bcm63138_nand.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/bcm63138_nand.c b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
index 3f4c44c24e14..59444b3a697d 100644
--- a/drivers/mtd/nand/brcmnand/bcm63138_nand.c
+++ b/drivers/mtd/nand/brcmnand/bcm63138_nand.c
@@ -22,7 +22,8 @@
 
 #include "brcmnand.h"
 
-struct bcm63138_nand_soc_priv {
+struct bcm63138_nand_soc {
+	struct brcmnand_soc soc;
 	void __iomem *base;
 };
 
@@ -35,7 +36,8 @@ enum {
 
 static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
 {
-	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	struct bcm63138_nand_soc *priv =
+			container_of(soc, struct bcm63138_nand_soc, soc);
 	void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
 	u32 val = brcmnand_readl(mmio);
 
@@ -49,7 +51,8 @@ static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
 
 static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
 {
-	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	struct bcm63138_nand_soc *priv =
+			container_of(soc, struct bcm63138_nand_soc, soc);
 	void __iomem *mmio = priv->base + BCM63138_NAND_INT_EN;
 	u32 val = brcmnand_readl(mmio);
 
@@ -64,25 +67,20 @@ static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
 static int bcm63138_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct bcm63138_nand_soc_priv *priv;
+	struct bcm63138_nand_soc *priv;
 	struct brcmnand_soc *soc;
 	struct resource *res;
 
-	soc = devm_kzalloc(dev, sizeof(*soc), GFP_KERNEL);
-	if (!soc)
-		return -ENOMEM;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+	soc = &priv->soc;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-int-base");
 	priv->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	soc->pdev = pdev;
-	soc->priv = priv;
 	soc->ctlrdy_ack = bcm63138_nand_intc_ack;
 	soc->ctlrdy_set_enabled = bcm63138_nand_intc_set;
 
-- 
1.9.1
