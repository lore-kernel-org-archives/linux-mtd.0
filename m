Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1efBTP-0007dy-NL
 for linux-mtd@lists.infradead.org; Fri, 26 Jan 2018 21:23:49 +0000
Received: by mail-qt0-x243.google.com with SMTP id s39so4754923qth.7
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2018 13:23:34 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: cyrille.pitchen@wedev4u.fr
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 han.xu@nxp.com, david.wolfe@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH RESEND v6 1/2] mtd: fsl-quadspi: Distinguish the mtd device
 names
Date: Fri, 26 Jan 2018 19:23:24 -0200
Message-Id: <1517001805-7646-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

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
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Han Xu <han.xu@nxp.com>
---
Resending it as I missed to send it to Cyrille 

Changes since v5:
- Preserve the label value, if any. (Boris)

 drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2901c7b..1038842 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		spi_nor_set_flash_node(nor, np);
 		nor->priv = q;
 
+		if (q->nor_num > 1 && !mtd->name) {
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
