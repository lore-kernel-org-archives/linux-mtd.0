Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTc-0001Tv-3Z
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:49 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852637wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 35/44] mtd: plat_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:34 +0400
Message-Id: <1307453803-31950-36-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/plat_nand.c |   22 +++-------------------
 1 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 1339fa8..e62468b 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -21,8 +21,6 @@ struct plat_nand_data {
 	struct nand_chip	chip;
 	struct mtd_info		mtd;
 	void __iomem		*io_base;
-	int			nr_parts;
-	struct mtd_partition	*parts;
 };
 
 /*
@@ -99,21 +97,9 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	if (pdata->chip.part_probe_types) {
-		err = parse_mtd_partitions(&data->mtd,
-					pdata->chip.part_probe_types,
-					&data->parts, 0);
-		if (err > 0) {
-			mtd_device_register(&data->mtd, data->parts, err);
-			return 0;
-		}
-	}
-	if (pdata->chip.partitions) {
-		data->parts = pdata->chip.partitions;
-		err = mtd_device_register(&data->mtd, data->parts,
-			pdata->chip.nr_partitions);
-	} else
-		err = mtd_device_register(&data->mtd, NULL, 0);
+	err = mtd_device_parse_register(&data->mtd,
+			pdata->chip.part_probe_types, 0,
+			pdata->chip.partitions, pdata->chip.nr_partitions);
 
 	if (!err)
 		return err;
@@ -143,8 +129,6 @@ static int __devexit plat_nand_remove(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	nand_release(&data->mtd);
-	if (data->parts && data->parts != pdata->chip.partitions)
-		kfree(data->parts);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
 	iounmap(data->io_base);
-- 
1.7.4.4
