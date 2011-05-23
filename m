Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROE-0002U4-OJ
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:32 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:30 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 42/62] mtd/fsmc_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:23 +0100
Message-Id: <1306142623-24952-43-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/fsmc_nand.c |   25 ++++---------------------
 1 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 0d45ef3..e9b275a 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -120,8 +120,6 @@ static struct fsmc_eccplace fsmc_ecc4_sp_place = {
 	}
 };
 
-
-#ifdef CONFIG_MTD_PARTITIONS
 /*
  * Default partition tables to be used if the partition information not
  * provided through platform data.
@@ -182,7 +180,6 @@ static struct mtd_partition partition_info_128KB_blk[] = {
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 const char *part_probes[] = { "cmdlinepart", NULL };
 #endif
-#endif
 
 /**
  * struct fsmc_nand_data - structure for FSMC NAND device state
@@ -719,7 +716,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * platform data,
 	 * default partition information present in driver.
 	 */
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	/*
 	 * Check if partition info passed via command line
@@ -777,19 +773,10 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	}
 #endif
 
-	if (host->partitions) {
-		ret = add_mtd_partitions(&host->mtd, host->partitions,
-				host->nr_partitions);
-		if (ret)
-			goto err_probe;
-	}
-#else
-	dev_info(&pdev->dev, "Registering %s as whole device\n", mtd->name);
-	if (!add_mtd_device(mtd)) {
-		ret = -ENXIO;
+	ret = mtd_device_register(&host->mtd, host->partitions,
+				  host->nr_partitions);
+	if (ret)
 		goto err_probe;
-	}
-#endif
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -835,11 +822,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 
 	if (host) {
-#ifdef CONFIG_MTD_PARTITIONS
-		del_mtd_partitions(&host->mtd);
-#else
-		del_mtd_device(&host->mtd);
-#endif
+		mtd_device_unregister(&host->mtd);
 		clk_disable(host->clk);
 		clk_put(host->clk);
 
-- 
1.7.4.4
