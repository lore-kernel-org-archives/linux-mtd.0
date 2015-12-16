Received: from mail-by2on0138.outbound.protection.outlook.com
 ([207.46.100.138] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a99al-0004Fb-Gh
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2015 10:45:56 +0000
From: Raghav Dogra <raghav@freescale.com>
To: <linux-mtd@lists.infradead.org>
CC: <prabhakar@freescale.com>, <scottwood@freescale.com>, Raghav Dogra
 <raghav@freescale.com>
Subject: [PATCH 1/3] driver/memory: Removal of deprecated NO_IRQ
Date: Wed, 16 Dec 2015 16:11:31 +0530
Message-ID: <1450262491-5135-1-git-send-email-raghav@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replacing the NO_IRQ macro with 0. If there is no interrupt,
returned value will be 0 regardless of what NO_IRQ is defined.

Signed-off-by: Raghav Dogra <raghav@freescale.com>
---
 drivers/memory/fsl_ifc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index e87459f..8436c59 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -259,7 +259,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 
 	/* get the Controller level irq */
 	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
-	if (fsl_ifc_ctrl_dev->irq == NO_IRQ) {
+	if (fsl_ifc_ctrl_dev->irq == 0) {
 		dev_err(&dev->dev, "failed to get irq resource "
 							"for IFC\n");
 		ret = -ENODEV;
-- 
1.9.1
