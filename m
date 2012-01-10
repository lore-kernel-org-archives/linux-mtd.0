Received: from mo-p05-ob6.rzone.de ([2a01:238:20a:202:53f5::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkcsT-00044W-4p
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 14:40:41 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fsmc_nand.c: Partition info from pdata overrides driver
 defaults
Date: Tue, 10 Jan 2012 15:29:08 +0100
Message-Id: <1326205748-9867-1-git-send-email-sr@denx.de>
Cc: dedekind@infradead.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enables the partition info from the platform data (if
provided) to override the default partition info included in the fsmc
NAND driver.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c |   22 +++++++++++++++-------
 1 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e53b760..d48dc79 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -533,6 +533,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	struct nand_chip *nand;
 	struct fsmc_regs *regs;
 	struct resource *res;
+	struct mtd_partition *parts;
+	int count;
 	int ret = 0;
 	u32 pid;
 	int i;
@@ -713,13 +715,19 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	ret = mtd_device_parse_register(&host->mtd, NULL, 0,
-			host->mtd.size <= 0x04000000 ?
-				partition_info_16KB_blk :
-				partition_info_128KB_blk,
-			host->mtd.size <= 0x04000000 ?
-				ARRAY_SIZE(partition_info_16KB_blk) :
-				ARRAY_SIZE(partition_info_128KB_blk));
+	if (pdata->partitions) {
+		parts = pdata->partitions;
+		count = pdata->nr_partitions;
+	} else {
+		if (host->mtd.size <= 0x04000000) {
+			parts = partition_info_16KB_blk;
+			count = ARRAY_SIZE(partition_info_16KB_blk);
+		} else {
+			parts = partition_info_128KB_blk;
+			count = ARRAY_SIZE(partition_info_128KB_blk);
+		}
+	}
+	ret = mtd_device_parse_register(&host->mtd, NULL, 0, parts, count);
 	if (ret)
 		goto err_probe;
 
-- 
1.7.8.3
