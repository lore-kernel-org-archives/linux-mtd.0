Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXK-0002jH-7Y
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:15 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 01/13] nand/fsmc: Pass partition information through
 platform data
Date: Wed, 14 Mar 2012 11:47:07 +0530
Message-ID: <cde13f8b2efacc7588963d4ca978f42514e2759c.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Vipin Kumar <vipin.kumar@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch reimplements the passing of partition information through platform
data. This was unintentionally deleted in commit
0d04eda1430e9a796214bee644b7e05d99cfe613
"mtd: fsmc_nand.c: use mtd_device_parse_register"

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 588e373..2d7683b 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -333,6 +333,8 @@ static struct mtd_partition partition_info_128KB_blk[] = {
  * @pid:		Part ID on the AMBA PrimeCell format
  * @mtd:		MTD info for a NAND flash.
  * @nand:		Chip related info for a NAND flash.
+ * @partitions:		Partition info for a NAND Flash.
+ * @nr_partitions:	Total number of partition of a NAND flash.
  *
  * @ecc_place:		ECC placing locations in oobfree type format.
  * @bank:		Bank number for probed device.
@@ -347,6 +349,8 @@ struct fsmc_nand_data {
 	u32			pid;
 	struct mtd_info		mtd;
 	struct nand_chip	nand;
+	struct mtd_partition	*partitions;
+	unsigned int		nr_partitions;
 
 	struct fsmc_eccplace	*ecc_place;
 	unsigned int		bank;
@@ -833,6 +837,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	host->bank = pdata->bank;
 	host->select_chip = pdata->select_bank;
+	host->partitions = pdata->partitions;
+	host->nr_partitions = pdata->nr_partitions;
 	regs = host->regs_va;
 
 	/* Link all private pointers */
@@ -942,13 +948,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	 * Check for partition info passed
 	 */
 	host->mtd.name = "nand";
-	ret = mtd_device_parse_register(&host->mtd, NULL, NULL,
-					host->mtd.size <= 0x04000000 ?
-					partition_info_16KB_blk :
-					partition_info_128KB_blk,
-					host->mtd.size <= 0x04000000 ?
-					ARRAY_SIZE(partition_info_16KB_blk) :
-					ARRAY_SIZE(partition_info_128KB_blk));
+	ret = mtd_device_parse_register(&host->mtd, NULL, 0, host->partitions,
+			host->nr_partitions);
 	if (ret)
 		goto err_probe;
 
-- 
1.7.0.4
