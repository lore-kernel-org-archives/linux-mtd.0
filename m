Received: from mail-cys01nam02on0061.outbound.protection.outlook.com
 ([104.47.37.61] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZchc-0004ef-39
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 13:15:30 +0000
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <cyrille.pitchen@wedev4u.fr>
CC: <boris.brezillon@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 <david.wolfe@nxp.com>, <han.xu@nxp.com>, <frank.li@nxp.com>, Fabio Estevam
 <fabio.estevam@nxp.com>
Subject: [PATCH v2] mtd: fsl-quadspi: Distinguish the mtd device names
Date: Thu, 11 Jan 2018 11:15:04 -0200
Message-ID: <1515676504-11510-1-git-send-email-fabio.estevam@nxp.com>
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

Currently on a imx6sx-sdb board, which has two SPI NOR chips connected
to QSPI2 the following output from /proc/mtd is seen:

# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 01000000 00010000 "21e4000.qspi"
mtd1: 01000000 00010000 "21e4000.qspi"

Attempts to partition them on the kernel command line result in both
chips with identical (and identically named) partitions, which is
an inconvenient behavior.

Assign a different mtd->name for each mtd device to avoid this problem.

After this change the output from /proc/mtd becomes:

# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 01000000 00010000 "21e4000.qspi-0"
mtd1: 01000000 00010000 "21e4000.qspi-1"

Reported-by: David Wolfe <david.wolfe@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Use 'spiflash_idx' for the variable name
- Use the mtd->name in the format 21e4000.qspi-0
- Do not assing the mtd name relying on the dts ordering and use the reg
property instead
- Call devm_kasprintf() after spi_nor_set_flash_node().

 drivers/mtd/spi-nor/fsl-quadspi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2901c7b..b28ad8b 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -967,7 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
-	int ret, i = 0;
+	int ret, i = 0, spiflash_idx;
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1051,6 +1051,22 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		spi_nor_set_flash_node(nor, np);
 		nor->priv = q;
 
+		ret = of_property_read_u32(np, "reg", &spiflash_idx);
+		if (ret) {
+			dev_err(dev, "could not get reg property: %d\n", ret);
+			ret = -EINVAL;
+			goto mutex_failed;
+		}
+
+		if (!mtd->name) {
+			mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s-%d",
+						   dev_name(dev), spiflash_idx);
+			if (!mtd->name) {
+				ret = -ENOMEM;
+				goto mutex_failed;
+			}
+		}
+
 		/* fill the hooks */
 		nor->read_reg = fsl_qspi_read_reg;
 		nor->write_reg = fsl_qspi_write_reg;
-- 
2.7.4
