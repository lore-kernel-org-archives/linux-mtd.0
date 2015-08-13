Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ1KI-0003gd-Km
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 22:50:23 +0000
Received: by pacgr6 with SMTP id gr6so46272835pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 15:50:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFT PATCH 2/4] mtd: spi-nor: assign mtd->priv in spi_nor_scan()
Date: Thu, 13 Aug 2015 15:46:03 -0700
Message-Id: <1439505965-134748-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Layering suggests that the SPI NOR layer (not the hardware driver)
should be initializing the MTD layer.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c      | 1 -
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 -
 drivers/mtd/spi-nor/nxp-spifi.c   | 1 -
 drivers/mtd/spi-nor/spi-nor.c     | 1 +
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cd3631170ef..24965ae9f7aa 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -205,7 +205,6 @@ static int m25p_probe(struct spi_device *spi)
 	nor->priv = flash;
 
 	spi_set_drvdata(spi, flash);
-	flash->mtd.priv = nor;
 	flash->spi = spi;
 
 	if (spi->mode & SPI_RX_QUAD)
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2a17ec6269ff..cefc9636e551 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1016,7 +1016,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		nor->mtd = mtd;
 		nor->dev = dev;
 		nor->priv = q;
-		mtd->priv = nor;
 
 		/* fill the hooks */
 		nor->read_reg = fsl_qspi_read_reg;
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index 9ad1dd0896c0..ce6a478a02a5 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -331,7 +331,6 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 
 	writel(ctrl, spifi->io_base + SPIFI_CTRL);
 
-	spifi->mtd.priv  = &spifi->nor;
 	spifi->nor.mtd   = &spifi->mtd;
 	spifi->nor.dev   = spifi->dev;
 	spifi->nor.priv  = spifi;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 47516d3af015..cba513373d5e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1066,6 +1066,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
+	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
 	mtd->writesize = 1;
 	mtd->flags = MTD_CAP_NORFLASH;
-- 
2.5.0.276.gf5e568e
