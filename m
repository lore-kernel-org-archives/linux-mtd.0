Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFjvH-0005NS-Jw
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2015 14:14:04 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Han Xu <han.xu@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: fsl-quadspi: Add mutex for accessing different
 SPI-NOR devices
Date: Thu, 16 Jul 2015 16:13:34 +0200
Message-Id: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Access is only serialized for each NOR device in spi_nor_lock_and_prep(),
but not for the QSPI device.
We must ensure only one NOR device is accessed as each call to
fsl_qspi_set_base_addr (in fsl_qspi_prep) will affect the effective flash
address.
This can simply be achieved by using a mutex in prepare/unprepare
callbacks.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
This problem can simply be trigged by doing a hexdump on /dev/mtdblock0
(256 kiB) and /dev/mtdblock3 (64MiB), in my case.

$ hexdump -C /dev/mtdblock3 # doing a long taking access.
$ hexdump -C /dev/mtdblock0 # in the meanwhile will show data from mtdblock3

 drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 5d2df50..a48495a 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -226,6 +226,7 @@ struct fsl_qspi {
 	u32 memmap_phy;
 	struct clk *clk, *clk_en;
 	struct device *dev;
+	struct mutex lock; /* to serialize access to different mtd partitions */
 	struct completion c;
 	struct fsl_qspi_devtype_data *devtype_data;
 	u32 nor_size;
@@ -771,6 +772,8 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 		return ret;
 	}
 
+	mutex_lock(&q->lock);
+
 	fsl_qspi_set_base_addr(q, nor);
 	return 0;
 }
@@ -779,6 +782,8 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 {
 	struct fsl_qspi *q = nor->priv;
 
+	mutex_unlock(&q->lock);
+
 	clk_disable(q->clk);
 	clk_disable(q->clk_en);
 }
@@ -856,6 +861,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	q->dev = dev;
 	q->devtype_data = (struct fsl_qspi_devtype_data *)of_id->data;
 	platform_set_drvdata(pdev, q);
+	mutex_init(&q->lock);
 
 	ret = fsl_qspi_nor_setup(q);
 	if (ret)
-- 
2.3.6
