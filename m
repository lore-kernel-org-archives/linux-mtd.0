Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMvi-0005E0-DB
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:13 +0000
Received: by padhk11 with SMTP id hk11so91290612pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 07/11] mtd: spi-nor: drop unnecessary partition parser data
Date: Fri, 30 Oct 2015 20:33:26 -0700
Message-Id: <1446262410-45754-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the SPI-NOR/MTD framework pass the 'flash_node' through to the
partition parsing code, we don't have to do it ourselves.

Also convert to mtd_device_register(), since we don't need the 2nd and
3rd parameters anymore.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: no change

 drivers/mtd/devices/m25p80.c      | 8 ++------
 drivers/mtd/spi-nor/fsl-quadspi.c | 4 +---
 drivers/mtd/spi-nor/nxp-spifi.c   | 4 +---
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 556b4554007f..6dbf7832e77a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -175,7 +175,6 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
  */
 static int m25p_probe(struct spi_device *spi)
 {
-	struct mtd_part_parser_data	ppdata;
 	struct flash_platform_data	*data;
 	struct m25p *flash;
 	struct spi_nor *nor;
@@ -227,11 +226,8 @@ static int m25p_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ppdata.of_node = spi->dev.of_node;
-
-	return mtd_device_parse_register(&nor->mtd, NULL, &ppdata,
-			data ? data->parts : NULL,
-			data ? data->nr_parts : 0);
+	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
+				   data ? data->nr_parts : 0);
 }
 
 
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 8f4d9204d2b2..9e7f657af6a5 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -927,7 +927,6 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 static int fsl_qspi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct mtd_part_parser_data ppdata;
 	struct device *dev = &pdev->dev;
 	struct fsl_qspi *q;
 	struct resource *res;
@@ -1038,8 +1037,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		if (ret)
 			goto mutex_failed;
 
-		ppdata.of_node = np;
-		ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
+		ret = mtd_device_register(mtd, NULL, 0);
 		if (ret)
 			goto mutex_failed;
 
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index 4524b2886946..ae428cb0e04b 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -271,7 +271,6 @@ static void nxp_spifi_dummy_id_read(struct spi_nor *nor)
 static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 				 struct device_node *np)
 {
-	struct mtd_part_parser_data ppdata;
 	enum read_mode flash_read;
 	u32 ctrl, property;
 	u16 mode = 0;
@@ -361,8 +360,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 		return ret;
 	}
 
-	ppdata.of_node = np;
-	ret = mtd_device_parse_register(&spifi->nor.mtd, NULL, &ppdata, NULL, 0);
+	ret = mtd_device_register(&spifi->nor.mtd, NULL, 0);
 	if (ret) {
 		dev_err(spifi->dev, "mtd device parse failed\n");
 		return ret;
-- 
2.6.0.rc2.230.g3dd15c0
