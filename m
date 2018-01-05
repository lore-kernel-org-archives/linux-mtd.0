Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXXx5-0002Yz-Gq
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 19:46:53 +0000
Received: by mail-qk0-x241.google.com with SMTP id a8so7284580qkb.8
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 11:46:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: han.xu@nxp.com
Cc: cyrille.pitchen@wedev4u.fr, david.wolfe@nxp.com, frank.li@nxp.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] mtd: fsl-quadspi: Distinguish the mtd device names
Date: Fri,  5 Jan 2018 17:46:00 -0200
Message-Id: <1515181560-1410-1-git-send-email-festevam@gmail.com>
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
mtd0: 01000000 00010000 "fsl-quadspi.0"
mtd1: 01000000 00010000 "fsl-quadspi.1"

Reported-by: David Wolfe <david.wolfe@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index f17d224..7712c63 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -967,7 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
-	int ret, i = 0;
+	int ret, i = 0, mtd_index = 0;
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1047,6 +1047,13 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		nor = &q->nor[i];
 		mtd = &nor->mtd;
 
+		mtd->name = devm_kasprintf(dev, GFP_KERNEL, "fsl-quadspi.%d",
+					   mtd_index);
+		if (!mtd->name) {
+			ret = -ENOMEM;
+			goto mutex_failed;
+		}
+
 		nor->dev = dev;
 		spi_nor_set_flash_node(nor, np);
 		nor->priv = q;
@@ -1098,6 +1105,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 			nor->page_size = q->devtype_data->txfifo;
 
 		i++;
+		mtd_index++;
 	}
 
 	/* finish the rest init. */
-- 
2.7.4
