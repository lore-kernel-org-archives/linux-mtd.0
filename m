Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyOjp-0001hB-7L
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 18:42:54 +0000
Received: by pacej9 with SMTP id ej9so76240462pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 10:42:28 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Han Xu <han.xu@freescale.com>
Subject: [PATCH] mtd: fsl-quadspi: possible NULL reference
Date: Mon, 16 Nov 2015 10:42:19 -0800
Message-Id: <1447699339-43027-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is theoretically possible to probe this driver without a matching
device tree, so let's guard against this.

Also, use the of_device_get_match_data() helper to make this a bit
simpler.

Coverity complained about this one.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Han Xu <han.xu@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index cc3a70b9b020..68fe7a2ecd5c 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -933,8 +933,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	int ret, i = 0;
-	const struct of_device_id *of_id =
-			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -945,7 +943,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	q->dev = dev;
-	q->devtype_data = (struct fsl_qspi_devtype_data *)of_id->data;
+	q->devtype_data = of_device_get_match_data(dev);
+	if (!q->devtype_data)
+		return -ENODEV;
 	platform_set_drvdata(pdev, q);
 
 	/* find the resources */
-- 
2.6.0.rc2.230.g3dd15c0
