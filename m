Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTp-0001St-N0
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:38:03 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852593wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:38:01 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 43/44] mtd: onenand/omap2.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:42 +0400
Message-Id: <1307453803-31950-44-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/onenand/omap2.c |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 5ca2053..eb9cbd9 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -57,7 +57,6 @@ struct omap2_onenand {
 	unsigned long phys_base;
 	int gpio_irq;
 	struct mtd_info mtd;
-	struct mtd_partition *parts;
 	struct onenand_chip onenand;
 	struct completion irq_done;
 	struct completion dma_done;
@@ -752,13 +751,9 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-	r = parse_mtd_partitions(&c->mtd, NULL, &c->parts, 0);
-	if (r > 0)
-		r = mtd_device_register(&c->mtd, c->parts, r);
-	else if (pdata->parts != NULL)
-		r = mtd_device_register(&c->mtd, pdata->parts, pdata->nr_parts);
-	else
-		r = mtd_device_register(&c->mtd, NULL, 0);
+	r = mtd_device_parse_register(&info->mtd, NULL, 0,
+			pdata ? pdata->parts : NULL,
+			pdata ? pdata->nr_parts : 0);
 	if (r)
 		goto err_release_onenand;
 
@@ -785,7 +780,6 @@ err_release_mem_region:
 err_free_cs:
 	gpmc_cs_free(c->gpmc_cs);
 err_kfree:
-	kfree(c->parts);
 	kfree(c);
 
 	return r;
@@ -808,7 +802,6 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 	iounmap(c->onenand.base);
 	release_mem_region(c->phys_base, ONENAND_IO_SIZE);
 	gpmc_cs_free(c->gpmc_cs);
-	kfree(c->parts);
 	kfree(c);
 
 	return 0;
-- 
1.7.4.4
