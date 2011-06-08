Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHH-0007CU-HR
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:45 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:43 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 28/43] mtd: fsmc_nand.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:37 +0400
Message-Id: <1307549152-7085-29-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
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
 drivers/mtd/nand/fsmc_nand.c |   66 ++++++------------------------------------
 1 files changed, 9 insertions(+), 57 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index a39c224..8cc8065 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -146,7 +146,7 @@ static struct mtd_partition partition_info_16KB_blk[] = {
 	{
 		.name = "Root File System",
 		.offset = 0x460000,
-		.size = 0,
+		.size = MTDPART_SIZ_FULL,
 	},
 };
 
@@ -173,7 +173,7 @@ static struct mtd_partition partition_info_128KB_blk[] = {
 	{
 		.name = "Root File System",
 		.offset = 0x800000,
-		.size = 0,
+		.size = MTDPART_SIZ_FULL,
 	},
 };
 
@@ -184,8 +184,6 @@ static struct mtd_partition partition_info_128KB_blk[] = {
  * @pid:		Part ID on the AMBA PrimeCell format
  * @mtd:		MTD info for a NAND flash.
  * @nand:		Chip related info for a NAND flash.
- * @partitions:		Partition info for a NAND Flash.
- * @nr_partitions:	Total number of partition of a NAND flash.
  *
  * @ecc_place:		ECC placing locations in oobfree type format.
  * @bank:		Bank number for probed device.
@@ -200,8 +198,6 @@ struct fsmc_nand_data {
 	u32			pid;
 	struct mtd_info		mtd;
 	struct nand_chip	nand;
-	struct mtd_partition	*partitions;
-	unsigned int		nr_partitions;
 
 	struct fsmc_eccplace	*ecc_place;
 	unsigned int		bank;
@@ -717,57 +713,13 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	host->nr_partitions = parse_mtd_partitions(&host->mtd, NULL,
-			&host->partitions, 0);
-	if (host->nr_partitions <= 0) {
-		/*
-		 * Check if partition info passed via command line
-		 */
-		if (pdata->partitions) {
-			host->partitions = pdata->partitions;
-			host->nr_partitions = pdata->nr_partitions;
-		} else {
-			struct mtd_partition *partition;
-			int i;
-
-			/* Select the default partitions info */
-			switch (host->mtd.size) {
-			case 0x01000000:
-			case 0x02000000:
-			case 0x04000000:
-				host->partitions = partition_info_16KB_blk;
-				host->nr_partitions =
-					sizeof(partition_info_16KB_blk) /
-					sizeof(struct mtd_partition);
-				break;
-			case 0x08000000:
-			case 0x10000000:
-			case 0x20000000:
-			case 0x40000000:
-				host->partitions = partition_info_128KB_blk;
-				host->nr_partitions =
-					sizeof(partition_info_128KB_blk) /
-					sizeof(struct mtd_partition);
-				break;
-			default:
-				ret = -ENXIO;
-				pr_err("Unsupported NAND size\n");
-				goto err_probe;
-			}
-
-			partition = host->partitions;
-			for (i = 0; i < host->nr_partitions; i++, partition++) {
-				if (partition->size == 0) {
-					partition->size = host->mtd.size -
-						partition->offset;
-					break;
-				}
-			}
-		}
-	}
-
-	ret = mtd_device_register(&host->mtd, host->partitions,
-				  host->nr_partitions);
+	ret = mtd_device_parse_register(&host->mtd, NULL, 0,
+			host->mtd.size <= 0x04000000 ?
+				partition_info_16KB_blk :
+				partition_info_128KB_blk,
+			host->mtd.size <= 0x04000000 ?
+				ARRAY_SIZE(partition_info_16KB_blk) :
+				ARRAY_SIZE(partition_info_128KB_blk),
 	if (ret)
 		goto err_probe;
 
-- 
1.7.4.4
