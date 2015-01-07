Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8nv0-0003cC-Vq
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 10:32:52 +0000
Received: by mail-vc0-f180.google.com with SMTP id im6so344525vcb.25
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 02:32:29 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Date: Wed,  7 Jan 2015 08:32:07 -0200
Message-Id: <1420626727-6929-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1420626727-6929-1-git-send-email-festevam@gmail.com>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

When removing the fsl-quadspi module and running 'cat /proc/mtd' afterwards,
we see garbage data like:

$ rmmod  fsl-quadspi
$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
mtd0: 00000000 00000000 "(null)"
...
mtd0: a22296c6c756e28 00000000 "(null)"
mtd0: a22296c6c756e28 3064746d "(null)"

The reason for this is due to the wrong mtd index used in
mtd_device_unregister() in the remove function. This index mismatch is caused
by the usage of the 'qspi-has-second-chip' property in the probe function.

Such property is not really necessary and we can simplify the index logic
calculation by avoiding some 'holes' in the mtd indexing.

Thanks to Brian Norris for his suggestion.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v2:
- Do not change FSL_QSPI_MAX_CHIP
- Fix fsl_qspi_set_base_addr() calculation

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |  9 ---------
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 22 +++++++---------------
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 823d134..b8e96ec 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -9,15 +9,6 @@ Required properties:
   - clocks : The clocks needed by the QuadSPI controller
   - clock-names : the name of the clocks
 
-Optional properties:
-  - fsl,qspi-has-second-chip: The controller has two buses, bus A and bus B.
-                              Each bus can be connected with two NOR flashes.
-			      Most of the time, each bus only has one NOR flash
-			      connected, this is the default case.
-			      But if there are two NOR flashes connected to the
-			      bus, you should enable this property.
-			      (Please check the board's schematic.)
-
 Example:
 
 qspi0: quadspi@40044000 {
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 20cffd2..ddb955a 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -661,7 +661,7 @@ MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
 
 static void fsl_qspi_set_base_addr(struct fsl_qspi *q, struct spi_nor *nor)
 {
-	q->chip_base_addr = q->nor_size * (nor - q->nor);
+	q->chip_base_addr = q->nor_size * q->nor_num;
 }
 
 static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
@@ -782,8 +782,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
-	int ret, i = 0;
-	bool has_second_chip = false;
+	int ret, i;
 	const struct of_device_id *of_id =
 			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
 
@@ -791,8 +790,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q)
 		return -ENOMEM;
 
-	q->nor_num = of_get_child_count(dev->of_node);
-	if (!q->nor_num || q->nor_num > FSL_QSPI_MAX_CHIP)
+	ret = of_get_child_count(dev->of_node);
+	if (!ret || ret > FSL_QSPI_MAX_CHIP)
 		return -ENODEV;
 
 	/* find the resources */
@@ -859,19 +858,12 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto irq_failed;
 
-	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
-		has_second_chip = true;
-
 	/* iterate the subnodes. */
 	for_each_available_child_of_node(dev->of_node, np) {
 		char modalias[40];
 
-		/* skip the holes */
-		if (!has_second_chip)
-			i *= 2;
-
-		nor = &q->nor[i];
-		mtd = &q->mtd[i];
+		nor = &q->nor[q->nor_num];
+		mtd = &q->mtd[q->nor_num];
 
 		nor->mtd = mtd;
 		nor->dev = dev;
@@ -929,7 +921,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		if (nor->page_size > q->devtype_data->txfifo)
 			nor->page_size = q->devtype_data->txfifo;
 
-		i++;
+		q->nor_num++;
 	}
 
 	/* finish the rest init. */
-- 
1.9.1
