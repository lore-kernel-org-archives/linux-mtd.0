Date: Wed, 7 May 2008 11:54:10 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH][MTD] Fix cmdlineparse handling in mapping files
Message-ID: <20080507025410.GA11344@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now it returns the 0 if cmdlineparse not supplied.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/maps/omap_nor.c b/drivers/mtd/maps/omap_nor.c
index 240b0e2..c12d805 100644
--- a/drivers/mtd/maps/omap_nor.c
+++ b/drivers/mtd/maps/omap_nor.c
@@ -110,7 +110,7 @@ static int __init omapflash_probe(struct platform_device *pdev)
 	err = parse_mtd_partitions(info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
 		add_mtd_partitions(info->mtd, info->parts, err);
-	else if (err < 0 && pdata->parts)
+	else if (err <= 0 && pdata->parts)
 		add_mtd_partitions(info->mtd, pdata->parts, pdata->nr_parts);
 	else
 #endif
diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 3d44d04..ad81ab8 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -76,7 +76,7 @@ static int __devinit generic_onenand_probe(struct device *dev)
 	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
 	if (err > 0)
 		add_mtd_partitions(&info->mtd, info->parts, err);
-	else if (err < 0 && pdata->parts)
+	else if (err <= 0 && pdata->parts)
 		add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);
 	else
 #endif
