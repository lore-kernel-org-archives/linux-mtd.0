Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvQ-00071T-Rm
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:45 +0000
Received: by mail-ww0-f41.google.com with SMTP id 18so1223527wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:44 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/32] mtd: fsmc_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:04 +0400
Message-Id: <1307351782-7456-14-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
this in every driver, instead pass NULL to force parse_mtd_partitions
to use default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e9b275a..80abbb2 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -177,9 +177,6 @@ static struct mtd_partition partition_info_128KB_blk[] = {
 	},
 };
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 /**
  * struct fsmc_nand_data - structure for FSMC NAND device state
@@ -716,15 +713,13 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * platform data,
 	 * default partition information present in driver.
 	 */
-#ifdef CONFIG_MTD_CMDLINE_PARTS
 	/*
-	 * Check if partition info passed via command line
+	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	host->nr_partitions = parse_mtd_partitions(&host->mtd, part_probes,
+	host->nr_partitions = parse_mtd_partitions(&host->mtd, NULL,
 			&host->partitions, 0);
 	if (host->nr_partitions <= 0) {
-#endif
 		/*
 		 * Check if partition info passed via command line
 		 */
@@ -769,9 +764,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 				}
 			}
 		}
-#ifdef CONFIG_MTD_CMDLINE_PARTS
 	}
-#endif
 
 	ret = mtd_device_register(&host->mtd, host->partitions,
 				  host->nr_partitions);
-- 
1.7.4.4
