Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2lK5-0008GQ-Kq
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 22:51:56 +0000
Received: by mail-lj1-x244.google.com with SMTP id x16-v6so140323ljd.12
 for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2018 15:51:46 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] mtd: rawnand: ams-delta: Use private structure
Date: Thu, 20 Sep 2018 00:52:54 +0200
Message-Id: <20180919225255.31175-3-jmkrzyszt@gmail.com>
In-Reply-To: <20180919225255.31175-1-jmkrzyszt@gmail.com>
References: <20180820213904.13475-1-jmkrzyszt@gmail.com>
 <20180919225255.31175-1-jmkrzyszt@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce a driver private structure and allocate it on device probe.
Use it for storing nand_chip structure, GPIO descriptors prevoiusly
stored in static variables as well as io_base pointer previously passed
as nand controller data or platform driver data.  Subsequent patches
may populate the structure with more members as needed.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 122 +++++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index efe12066dfbc..eb2aeadc3b65 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -34,14 +34,18 @@
 /*
  * MTD structure for E3 (Delta)
  */
-static struct mtd_info *ams_delta_mtd = NULL;
-static struct gpio_desc *gpiod_rdy;
-static struct gpio_desc *gpiod_nce;
-static struct gpio_desc *gpiod_nre;
-static struct gpio_desc *gpiod_nwp;
-static struct gpio_desc *gpiod_nwe;
-static struct gpio_desc *gpiod_ale;
-static struct gpio_desc *gpiod_cle;
+
+struct ams_delta_nand {
+	struct nand_chip	nand_chip;
+	struct gpio_desc	*gpiod_rdy;
+	struct gpio_desc	*gpiod_nce;
+	struct gpio_desc	*gpiod_nre;
+	struct gpio_desc	*gpiod_nwp;
+	struct gpio_desc	*gpiod_nwe;
+	struct gpio_desc	*gpiod_ale;
+	struct gpio_desc	*gpiod_cle;
+	void __iomem		*io_base;
+};
 
 /*
  * Define partitions for flash devices
@@ -70,25 +74,27 @@ static const struct mtd_partition partition_info[] = {
 
 static void ams_delta_write_byte(struct nand_chip *this, u_char byte)
 {
-	void __iomem *io_base = (void __iomem *)nand_get_controller_data(this);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	void __iomem *io_base = priv->io_base;
 
 	writew(0, io_base + OMAP_MPUIO_IO_CNTL);
 	writew(byte, this->legacy.IO_ADDR_W);
-	gpiod_set_value(gpiod_nwe, 0);
+	gpiod_set_value(priv->gpiod_nwe, 0);
 	ndelay(40);
-	gpiod_set_value(gpiod_nwe, 1);
+	gpiod_set_value(priv->gpiod_nwe, 1);
 }
 
 static u_char ams_delta_read_byte(struct nand_chip *this)
 {
 	u_char res;
-	void __iomem *io_base = (void __iomem *)nand_get_controller_data(this);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	void __iomem *io_base = priv->io_base;
 
-	gpiod_set_value(gpiod_nre, 0);
+	gpiod_set_value(priv->gpiod_nre, 0);
 	ndelay(40);
 	writew(~0, io_base + OMAP_MPUIO_IO_CNTL);
 	res = readw(this->legacy.IO_ADDR_R);
-	gpiod_set_value(gpiod_nre, 1);
+	gpiod_set_value(priv->gpiod_nre, 1);
 
 	return res;
 }
@@ -121,11 +127,12 @@ static void ams_delta_read_buf(struct nand_chip *this, u_char *buf, int len)
 static void ams_delta_hwcontrol(struct nand_chip *this, int cmd,
 				unsigned int ctrl)
 {
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		gpiod_set_value(gpiod_nce, !(ctrl & NAND_NCE));
-		gpiod_set_value(gpiod_cle, !!(ctrl & NAND_CLE));
-		gpiod_set_value(gpiod_ale, !!(ctrl & NAND_ALE));
+		gpiod_set_value(priv->gpiod_nce, !(ctrl & NAND_NCE));
+		gpiod_set_value(priv->gpiod_cle, !!(ctrl & NAND_CLE));
+		gpiod_set_value(priv->gpiod_ale, !!(ctrl & NAND_ALE));
 	}
 
 	if (cmd != NAND_CMD_NONE)
@@ -134,7 +141,9 @@ static void ams_delta_hwcontrol(struct nand_chip *this, int cmd,
 
 static int ams_delta_nand_ready(struct nand_chip *this)
 {
-	return gpiod_get_value(gpiod_rdy);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
+
+	return gpiod_get_value(priv->gpiod_rdy);
 }
 
 
@@ -143,7 +152,9 @@ static int ams_delta_nand_ready(struct nand_chip *this)
  */
 static int ams_delta_init(struct platform_device *pdev)
 {
+	struct ams_delta_nand *priv;
 	struct nand_chip *this;
+	struct mtd_info *mtd;
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *io_base;
 	int err = 0;
@@ -152,15 +163,16 @@ static int ams_delta_init(struct platform_device *pdev)
 		return -ENXIO;
 
 	/* Allocate memory for MTD device structure and private data */
-	this = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
-	if (!this) {
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct ams_delta_nand),
+			    GFP_KERNEL);
+	if (!priv) {
 		pr_warn("Unable to allocate E3 NAND MTD device structure.\n");
-		err = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
+	this = &priv->nand_chip;
 
-	ams_delta_mtd = nand_to_mtd(this);
-	ams_delta_mtd->dev.parent = &pdev->dev;
+	mtd = nand_to_mtd(this);
+	mtd->dev.parent = &pdev->dev;
 
 	/*
 	 * Don't try to request the memory region from here,
@@ -175,7 +187,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out_free;
 	}
 
-	nand_set_controller_data(this, (void *)io_base);
+	priv->io_base = io_base;
+	nand_set_controller_data(this, priv);
 
 	/* Set address of NAND IO lines */
 	this->legacy.IO_ADDR_R = io_base + OMAP_MPUIO_INPUT_LATCH;
@@ -185,14 +198,14 @@ static int ams_delta_init(struct platform_device *pdev)
 	this->legacy.read_buf = ams_delta_read_buf;
 	this->legacy.cmd_ctrl = ams_delta_hwcontrol;
 
-	gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
-	if (IS_ERR(gpiod_rdy)) {
-		err = PTR_ERR(gpiod_rdy);
+	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
+	if (IS_ERR(priv->gpiod_rdy)) {
+		err = PTR_ERR(priv->gpiod_rdy);
 		dev_warn(&pdev->dev, "RDY GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
 
-	if (gpiod_rdy)
+	if (priv->gpiod_rdy)
 		this->legacy.dev_ready = ams_delta_nand_ready;
 
 	/* 25 us command delay time */
@@ -200,47 +213,47 @@ static int ams_delta_init(struct platform_device *pdev)
 	this->ecc.mode = NAND_ECC_SOFT;
 	this->ecc.algo = NAND_ECC_HAMMING;
 
-	platform_set_drvdata(pdev, io_base);
+	platform_set_drvdata(pdev, priv);
 
 	/* Set chip enabled, but  */
-	gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpiod_nwp)) {
-		err = PTR_ERR(gpiod_nwp);
+	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_nwp)) {
+		err = PTR_ERR(priv->gpiod_nwp);
 		dev_err(&pdev->dev, "NWP GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
 
-	gpiod_nce = devm_gpiod_get(&pdev->dev, "nce", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpiod_nce)) {
-		err = PTR_ERR(gpiod_nce);
+	priv->gpiod_nce = devm_gpiod_get(&pdev->dev, "nce", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_nce)) {
+		err = PTR_ERR(priv->gpiod_nce);
 		dev_err(&pdev->dev, "NCE GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
 
-	gpiod_nre = devm_gpiod_get(&pdev->dev, "nre", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpiod_nre)) {
-		err = PTR_ERR(gpiod_nre);
+	priv->gpiod_nre = devm_gpiod_get(&pdev->dev, "nre", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_nre)) {
+		err = PTR_ERR(priv->gpiod_nre);
 		dev_err(&pdev->dev, "NRE GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
 
-	gpiod_nwe = devm_gpiod_get(&pdev->dev, "nwe", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpiod_nwe)) {
-		err = PTR_ERR(gpiod_nwe);
+	priv->gpiod_nwe = devm_gpiod_get(&pdev->dev, "nwe", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_nwe)) {
+		err = PTR_ERR(priv->gpiod_nwe);
 		dev_err(&pdev->dev, "NWE GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
 
-	gpiod_ale = devm_gpiod_get(&pdev->dev, "ale", GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod_ale)) {
-		err = PTR_ERR(gpiod_ale);
+	priv->gpiod_ale = devm_gpiod_get(&pdev->dev, "ale", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpiod_ale)) {
+		err = PTR_ERR(priv->gpiod_ale);
 		dev_err(&pdev->dev, "ALE GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
 
-	gpiod_cle = devm_gpiod_get(&pdev->dev, "cle", GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod_cle)) {
-		err = PTR_ERR(gpiod_cle);
+	priv->gpiod_cle = devm_gpiod_get(&pdev->dev, "cle", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpiod_cle)) {
+		err = PTR_ERR(priv->gpiod_cle);
 		dev_err(&pdev->dev, "CLE GPIO request failed (%d)\n", err);
 		goto out_mtd;
 	}
@@ -251,15 +264,13 @@ static int ams_delta_init(struct platform_device *pdev)
 		goto out_mtd;
 
 	/* Register the partitions */
-	mtd_device_register(ams_delta_mtd, partition_info,
-			    ARRAY_SIZE(partition_info));
+	mtd_device_register(mtd, partition_info, ARRAY_SIZE(partition_info));
 
 	goto out;
 
  out_mtd:
 	iounmap(io_base);
 out_free:
-	kfree(this);
  out:
 	return err;
 }
@@ -269,16 +280,15 @@ static int ams_delta_init(struct platform_device *pdev)
  */
 static int ams_delta_cleanup(struct platform_device *pdev)
 {
-	void __iomem *io_base = platform_get_drvdata(pdev);
+	struct ams_delta_nand *priv = platform_get_drvdata(pdev);
+	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
+	void __iomem *io_base = priv->io_base;
 
 	/* Release resources, unregister device */
-	nand_release(mtd_to_nand(ams_delta_mtd));
+	nand_release(mtd_to_nand(mtd));
 
 	iounmap(io_base);
 
-	/* Free the MTD device structure */
-	kfree(mtd_to_nand(ams_delta_mtd));
-
 	return 0;
 }
 
-- 
2.16.4
