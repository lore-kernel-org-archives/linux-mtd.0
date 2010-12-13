Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PS7H2-0001ID-Jr
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2010 12:13:02 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 13 Dec 2010 14:12:00 +0200
Message-Id: <20101213121200.20650.72634.sendpatchset@ahunter-work.research.nokia.com>
In-Reply-To: <20101213121144.20650.27903.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213121144.20650.27903.sendpatchset@ahunter-work.research.nokia.com>
Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line
	partitioning
Cc: Tony Lindgren <tony@atomide.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Artem.Bityutskiy.dedekind1@gmail.com,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From d27a88c5f9f18a7c38784c085889c3e1053340cf Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Wed, 30 Dec 2009 07:40:16 +0100
Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line partitioning

Add the ability to parse MTD partition information from the
kernel command line.

Note that a pointless BUG_ON is removed, as are redundant
calls to 'del_mtd_partitions()' and 'del_mtd_device()'
because they are also done by 'onenand_release()'.

Finally note that 'add_mtd_device()' returns 1 on failure
so the error condition was incorrect.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/omap2.c |   27 ++++++++++++---------------
 1 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index da25a90..324402f 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -65,6 +65,10 @@ struct omap2_onenand {
 	int (*setup)(void __iomem *base, int freq);
 };
 
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probes[] = { "cmdlinepart", NULL,  };
+#endif
+
 static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
 {
 	struct omap2_onenand *c = data;
@@ -730,13 +734,15 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_MTD_PARTITIONS
-	if (pdata->parts != NULL)
-		r = add_mtd_partitions(&c->mtd, pdata->parts,
-				       pdata->nr_parts);
+	r = parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0);
+	if (r > 0)
+		r = add_mtd_partitions(&c->mtd, c->parts, r);
+	else if (pdata->parts != NULL)
+		r = add_mtd_partitions(&c->mtd, pdata->parts, pdata->nr_parts);
 	else
 #endif
 		r = add_mtd_device(&c->mtd);
-	if (r < 0)
+	if (r)
 		goto err_release_onenand;
 
 	platform_set_drvdata(pdev, c);
@@ -760,6 +766,7 @@ err_release_mem_region:
 err_free_cs:
 	gpmc_cs_free(c->gpmc_cs);
 err_kfree:
+	kfree(c->parts);
 	kfree(c);
 
 	return r;
@@ -769,17 +776,6 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 {
 	struct omap2_onenand *c = dev_get_drvdata(&pdev->dev);
 
-	BUG_ON(c == NULL);
-
-#ifdef CONFIG_MTD_PARTITIONS
-	if (c->parts)
-		del_mtd_partitions(&c->mtd);
-	else
-		del_mtd_device(&c->mtd);
-#else
-	del_mtd_device(&c->mtd);
-#endif
-
 	onenand_release(&c->mtd);
 	if (c->dma_channel != -1)
 		omap_free_dma(c->dma_channel);
@@ -792,6 +788,7 @@ static int __devexit omap2_onenand_remove(struct platform_device *pdev)
 	iounmap(c->onenand.base);
 	release_mem_region(c->phys_base, ONENAND_IO_SIZE);
 	gpmc_cs_free(c->gpmc_cs);
+	kfree(c->parts);
 	kfree(c);
 
 	return 0;
-- 
1.7.0.4
