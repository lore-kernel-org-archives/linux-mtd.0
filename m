Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72uD-0006l8-EV
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:31:58 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 01/14] mtd: nand: pxa3xx: Introduce 'marvell,
 armada370-nand' compatible string
Date: Wed,  7 Aug 2013 09:31:06 -0300
Message-Id: <1375878679-18098-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver supports NFCv1 (as found in PXA SoC) and NFCv2 (as found in
Armada 370/XP SoC). As both controller has a few differences, a way of
distinguishing between the two is needed.

This commit introduces a new compatible string 'marvell,armada370-nand'
and assigns a compatible data of type enum pxa3xx_nand_variant to allow
such distinction.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 501e380..2582e1f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -123,6 +123,11 @@ enum {
 	STATE_READY,
 };
 
+enum pxa3xx_nand_variant {
+	PXA3XX_NAND_VARIANT_PXA,
+	PXA3XX_NAND_VARIANT_ARMADA370,
+};
+
 struct pxa3xx_nand_host {
 	struct nand_chip	chip;
 	struct pxa3xx_nand_cmdset *cmdset;
@@ -171,6 +176,12 @@ struct pxa3xx_nand_info {
 	struct pxa3xx_nand_host *host[NUM_CHIP_SELECT];
 	unsigned int		state;
 
+	/*
+	 * This driver supports NFCv1 (as found in PXA SoC)
+	 * and NFCv2 (as found in Armada 370/XP SoC).
+	 */
+	enum pxa3xx_nand_variant variant;
+
 	int			cs;
 	int			use_ecc;	/* use HW ECC ? */
 	int			use_dma;	/* use DMA ? */
@@ -1192,7 +1203,14 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static struct of_device_id pxa3xx_nand_dt_ids[] = {
-	{ .compatible = "marvell,pxa3xx-nand" },
+	{
+		.compatible = "marvell,pxa3xx-nand",
+		.data       = (void *) PXA3XX_NAND_VARIANT_PXA,
+	},
+	{
+		.compatible = "marvell,armada370-nand",
+		.data       = (void *) PXA3XX_NAND_VARIANT_ARMADA370,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, pxa3xx_nand_dt_ids);
@@ -1221,11 +1239,28 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 
 	return 0;
 }
+
+static enum pxa3xx_nand_variant
+pxa3xx_nand_get_variant(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+			of_match_device(pxa3xx_nand_dt_ids, &pdev->dev);
+	if (!of_id)
+		return PXA3XX_NAND_VARIANT_PXA;
+	return (enum pxa3xx_nand_variant) of_id->data;
+}
 #else
 static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 {
 	return 0;
 }
+
+static enum pxa3xx_nand_variant
+pxa3xx_nand_get_variant(struct platform_device *pdev)
+{
+	/* Default lefacy (non-DT) variant */
+	return PXA3XX_NAND_VARIANT_PXA;
+}
 #endif
 
 static int pxa3xx_nand_probe(struct platform_device *pdev)
@@ -1252,6 +1287,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	}
 
 	info = platform_get_drvdata(pdev);
+	info->variant = pxa3xx_nand_get_variant(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		info->cs = cs;
-- 
1.8.1.5
