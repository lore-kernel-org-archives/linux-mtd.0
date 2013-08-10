Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8Ex9-0002Ym-8l
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 19:35:57 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 02/15] mtd: nand: pxa3xx: Introduce 'marvell,
 armada370-nand' compatible string
Date: Sat, 10 Aug 2013 16:34:52 -0300
Message-Id: <1376163305-5591-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
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
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 02f214d..55eb153 100644
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
@@ -1191,11 +1202,28 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 }
 
 static struct of_device_id pxa3xx_nand_dt_ids[] = {
-	{ .compatible = "marvell,pxa3xx-nand" },
+	{
+		.compatible = "marvell,pxa3xx-nand",
+		.data       = (void *)PXA3XX_NAND_VARIANT_PXA,
+	},
+	{
+		.compatible = "marvell,armada370-nand",
+		.data       = (void *)PXA3XX_NAND_VARIANT_ARMADA370,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, pxa3xx_nand_dt_ids);
 
+static enum pxa3xx_nand_variant
+pxa3xx_nand_get_variant(struct platform_device *pdev)
+{
+	const struct of_device_id *of_id =
+			of_match_device(pxa3xx_nand_dt_ids, &pdev->dev);
+	if (!of_id)
+		return PXA3XX_NAND_VARIANT_PXA;
+	return (enum pxa3xx_nand_variant)of_id->data;
+}
+
 static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_platform_data *pdata;
@@ -1245,6 +1273,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	}
 
 	info = platform_get_drvdata(pdev);
+	info->variant = pxa3xx_nand_get_variant(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		info->cs = cs;
-- 
1.8.1.5
