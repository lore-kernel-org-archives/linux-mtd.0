Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMvg-0005Dy-Jo
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:10 +0000
Received: by pasz6 with SMTP id z6so91125042pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:48 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 05/11] mtd: spi-nor: convert to spi_nor_{get,
 set}_flash_node()
Date: Fri, 30 Oct 2015 20:33:24 -0700
Message-Id: <1446262410-45754-6-git-send-email-computersforpeace@gmail.com>
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

Used semantic patch with 'make coccicheck MODE=patch COCCI=script.cocci':

---8<----
virtual patch

@@
struct spi_nor b;
struct spi_nor *c;
expression d;
@@
(
-(b).flash_node = (d)
+spi_nor_set_flash_node(&b, d)
|
-(c)->flash_node = (d)
+spi_nor_set_flash_node(c, d)
)
---8<----

And a manual conversion for the one use of spi_nor_get_flash_node().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: new

 drivers/mtd/devices/m25p80.c      | 2 +-
 drivers/mtd/spi-nor/fsl-quadspi.c | 2 +-
 drivers/mtd/spi-nor/nxp-spifi.c   | 2 +-
 drivers/mtd/spi-nor/spi-nor.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4b5d7a4655fd..556b4554007f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -199,7 +199,7 @@ static int m25p_probe(struct spi_device *spi)
 	nor->read_reg = m25p80_read_reg;
 
 	nor->dev = &spi->dev;
-	nor->flash_node = spi->dev.of_node;
+	spi_nor_set_flash_node(nor, spi->dev.of_node);
 	nor->priv = flash;
 
 	spi_set_drvdata(spi, flash);
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 7b10ed413983..8f4d9204d2b2 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1013,7 +1013,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		mtd = &nor->mtd;
 
 		nor->dev = dev;
-		nor->flash_node = np;
+		spi_nor_set_flash_node(nor, np);
 		nor->priv = q;
 
 		/* fill the hooks */
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index 9e82098ae644..4524b2886946 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -330,7 +330,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 	writel(ctrl, spifi->io_base + SPIFI_CTRL);
 
 	spifi->nor.dev   = spifi->dev;
-	spifi->nor.flash_node = np;
+	spi_nor_set_flash_node(&spifi->nor, np);
 	spifi->nor.priv  = spifi;
 	spifi->nor.read  = nxp_spifi_read;
 	spifi->nor.write = nxp_spifi_write;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1d3107ccee61..924d455dadb5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1151,7 +1151,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	const struct flash_info *info = NULL;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
-	struct device_node *np = nor->flash_node;
+	struct device_node *np = spi_nor_get_flash_node(nor);
 	int ret;
 	int i;
 
-- 
2.6.0.rc2.230.g3dd15c0
