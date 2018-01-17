Received: from mail-cys01nam02on0629.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::629]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebs5q-0004Vc-2p
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 18:05:47 +0000
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, <han.xu@nxp.com>, <david.wolfe@nxp.com>,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v5 1/2] mtd: fsl-quadspi: Distinguish the mtd device names
Date: Wed, 17 Jan 2018 15:50:47 -0200
Message-ID: <1516211448-27594-1-git-send-email-fabio.estevam@nxp.com>
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

In order to keep mtdparts compatibility keep the mtd->name
unchanged when a single SPI NOR is present.

Reported-by: David Wolfe <david.wolfe@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v4:
- Only use the new name scheme when more than one SPI NOR is present (Boris)

 drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2901c7b..1038842 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		spi_nor_set_flash_node(nor, np);
 		nor->priv = q;
 
+		if (q->nor_num > 1) {
+			int spiflash_idx;
+
+			ret = of_property_read_u32(np, "reg", &spiflash_idx);
+			if (!ret) {
+				mtd->name = devm_kasprintf(dev, GFP_KERNEL,
+							   "%s-%d",
+							   dev_name(dev),
+							   spiflash_idx);
+				if (!mtd->name) {
+					ret = -ENOMEM;
+					goto mutex_failed;
+				}
+			} else {
+				dev_warn(dev, "reg property is missing\n");
+			}
+		}
+
 		/* fill the hooks */
 		nor->read_reg = fsl_qspi_read_reg;
 		nor->write_reg = fsl_qspi_write_reg;
-- 
2.7.4
