Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTY-0001Qj-Fm
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:45 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898888wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:44 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 33/44] mtd: omap2.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:32 +0400
Message-Id: <1307453803-31950-34-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/omap2.c |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 8783c08..c5e33fd 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -112,7 +112,6 @@ struct omap_nand_info {
 	struct nand_hw_control		controller;
 	struct omap_nand_platform_data	*pdata;
 	struct mtd_info			mtd;
-	struct mtd_partition		*parts;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -1101,13 +1100,8 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		goto out_release_mem_region;
 	}
 
-	err = parse_mtd_partitions(&info->mtd, NULL, &info->parts, 0);
-	if (err > 0)
-		mtd_device_register(&info->mtd, info->parts, err);
-	else if (pdata->parts)
-		mtd_device_register(&info->mtd, pdata->parts, pdata->nr_parts);
-	else
-		mtd_device_register(&info->mtd, NULL, 0);
+	mtd_device_parse_register(&info->mtd, NULL, 0,
+			pdata->parts, pdata->nr_parts);
 
 	platform_set_drvdata(pdev, &info->mtd);
 
-- 
1.7.4.4
