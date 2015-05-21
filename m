Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvDzb-00075h-MA
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 00:05:44 +0000
Received: by pdea3 with SMTP id a3so86949888pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 17:05:22 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/3] mtd: brcmnand: refactor iProc SoC layering
Date: Wed, 20 May 2015 17:05:05 -0700
Message-Id: <1432166706-4320-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
References: <1432166706-4320-1-git-send-email-computersforpeace@gmail.com>
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
 drivers/mtd/nand/brcmnand/iproc_nand.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/iproc_nand.c b/drivers/mtd/nand/brcmnand/iproc_nand.c
index 683495c74620..585596c549b2 100644
--- a/drivers/mtd/nand/brcmnand/iproc_nand.c
+++ b/drivers/mtd/nand/brcmnand/iproc_nand.c
@@ -22,7 +22,9 @@
 
 #include "brcmnand.h"
 
-struct iproc_nand_soc_priv {
+struct iproc_nand_soc {
+	struct brcmnand_soc soc;
+
 	void __iomem *idm_base;
 	void __iomem *ext_base;
 	spinlock_t idm_lock;
@@ -37,7 +39,8 @@ struct iproc_nand_soc_priv {
 
 static bool iproc_nand_intc_ack(struct brcmnand_soc *soc)
 {
-	struct iproc_nand_soc_priv *priv = soc->priv;
+	struct iproc_nand_soc *priv =
+			container_of(soc, struct iproc_nand_soc, soc);
 	void __iomem *mmio = priv->ext_base + IPROC_NAND_CTLR_READY_OFFSET;
 	u32 val = brcmnand_readl(mmio);
 
@@ -51,7 +54,8 @@ static bool iproc_nand_intc_ack(struct brcmnand_soc *soc)
 
 static void iproc_nand_intc_set(struct brcmnand_soc *soc, bool en)
 {
-	struct iproc_nand_soc_priv *priv = soc->priv;
+	struct iproc_nand_soc *priv =
+			container_of(soc, struct iproc_nand_soc, soc);
 	void __iomem *mmio = priv->idm_base + IPROC_NAND_IO_CTRL_OFFSET;
 	u32 val;
 	unsigned long flags;
@@ -72,7 +76,8 @@ static void iproc_nand_intc_set(struct brcmnand_soc *soc, bool en)
 
 static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
 {
-	struct iproc_nand_soc_priv *priv = soc->priv;
+	struct iproc_nand_soc *priv =
+			container_of(soc, struct iproc_nand_soc, soc);
 	void __iomem *mmio = priv->idm_base + IPROC_NAND_IO_CTRL_OFFSET;
 	u32 val;
 	unsigned long flags;
@@ -94,17 +99,14 @@ static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
 static int iproc_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct iproc_nand_soc_priv *priv;
+	struct iproc_nand_soc *priv;
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
 
 	spin_lock_init(&priv->idm_lock);
 
@@ -118,8 +120,6 @@ static int iproc_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->ext_base))
 		return PTR_ERR(priv->ext_base);
 
-	soc->pdev = pdev;
-	soc->priv = priv;
 	soc->ctlrdy_ack = iproc_nand_intc_ack;
 	soc->ctlrdy_set_enabled = iproc_nand_intc_set;
 	soc->prepare_data_bus = iproc_nand_apb_access;
-- 
1.9.1
