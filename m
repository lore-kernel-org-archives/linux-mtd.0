Received: from mail-qk0-f177.google.com ([209.85.220.177])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAOWo-0003dy-DX
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 20:22:45 +0000
Received: by qkei195 with SMTP id i195so38123811qke.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2015 13:22:21 -0700 (PDT)
From: Cory Tusar <cory.tusar@pid1solutions.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: stefan@agner.ch, linux@arm.linux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, andrew@lunn.ch,
 Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [RFC PATCH 4/7] mtd: fsl-quadspi: Use per-device clk_rate.
Date: Wed,  1 Jul 2015 16:20:07 -0400
Message-Id: <1435782010-9809-6-git-send-email-cory.tusar@pid1solutions.com>
In-Reply-To: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
References: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current fsl-quadspi implementation re-parses the 'spi-max-frequency'
property for each device, potentially allowing for an earlier, lower
frequency to be overwritten with a greater value.  This commit modifies
the parsing logic to extract the clock frequency for each flash device
and then configures for that frequency as part of the prepare() method
prior to accessing a given device.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 41 +++++++++++++++------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 4b8038b..d0cf0b7 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -233,7 +233,7 @@ struct fsl_qspi {
 	struct fsl_qspi_devtype_data *devtype_data;
 	u32 nor_size;
 	u32 nor_num;
-	u32 clk_rate;
+	u32 clk_rate[FSL_QSPI_MAX_CHIP];
 	unsigned int chip_base_addr; /* We may support two chips. */
 	bool has_second_chip;
 };
@@ -645,25 +645,13 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	return 0;
 }
 
-static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
+static void fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 {
-	unsigned long rate = q->clk_rate;
-	int ret;
-
-	if (is_imx6sx_qspi(q))
-		rate *= 4;
-
-	ret = clk_set_rate(q->clk, rate);
-	if (ret)
-		return ret;
-
 	/* Init the LUT table again. */
 	fsl_qspi_init_lut(q);
 
 	/* Init for AHB read */
 	fsl_qspi_init_abh_read(q);
-
-	return 0;
 }
 
 static const struct of_device_id fsl_qspi_dt_ids[] = {
@@ -763,6 +751,8 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
 static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 {
 	struct fsl_qspi *q = nor->priv;
+	int nor_idx = nor - q->nor;
+	unsigned long rate = q->clk_rate[nor_idx];
 	int ret;
 
 	ret = clk_enable(q->clk_en);
@@ -775,6 +765,16 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 		return ret;
 	}
 
+	if (is_imx6sx_qspi(q))
+		rate *= 4;
+
+	ret = clk_set_rate(q->clk, rate);
+	if (ret) {
+		clk_disable(q->clk);
+		clk_disable(q->clk_en);
+		return ret;
+	}
+
 	fsl_qspi_set_base_addr(q, nor);
 	return 0;
 }
@@ -899,7 +899,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 			goto irq_failed;
 
 		ret = of_property_read_u32(np, "spi-max-frequency",
-				&q->clk_rate);
+				&q->clk_rate[i]);
 		if (ret < 0)
 			goto irq_failed;
 
@@ -939,21 +939,12 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	}
 
 	/* finish the rest init. */
-	ret = fsl_qspi_nor_setup_last(q);
-	if (ret)
-		goto last_init_failed;
+	fsl_qspi_nor_setup_last(q);
 
 	clk_disable(q->clk);
 	clk_disable(q->clk_en);
 	return 0;
 
-last_init_failed:
-	for (i = 0; i < q->nor_num; i++) {
-		/* skip the holes */
-		if (!q->has_second_chip)
-			i *= 2;
-		mtd_device_unregister(&q->mtd[i]);
-	}
 irq_failed:
 	clk_disable_unprepare(q->clk);
 clk_failed:
-- 
2.3.6
