Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6D-0006Yd-PM
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:07 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
Date: Wed, 7 Mar 2012 17:00:56 +0530
Message-ID: <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Armando Visconti <armando.visconti@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org, Vipin Kumar <vipin.kumar@st.com>,
 Vincenzo Frascino <vincenzo.frascino@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Armando Visconti <armando.visconti@st.com>

This patch adds support for default NAND partitions for all devices with erase
size of 256KB, 512KB, 1024KB and 2048KB.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@st.com>
Signed-off-by: Armando Visconti <armando.visconti@st.com>
Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |  170 ++++++++++++++++++++++++++++++++++++++---
 1 files changed, 157 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 4a018d0..e9b2265 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -284,17 +284,17 @@ static struct mtd_partition partition_info_16KB_blk[] = {
 	},
 	{
 		.name = "U-Boot",
-		.offset = 0x10000,
+		.offset = 4*0x4000,
 		.size = 20*0x4000,
 	},
 	{
 		.name = "Kernel",
-		.offset = 0x60000,
+		.offset = (4+20)*0x4000,
 		.size = 256*0x4000,
 	},
 	{
 		.name = "Root File System",
-		.offset = 0x460000,
+		.offset = (4+20+256)*0x4000,
 		.size = MTDPART_SIZ_FULL,
 	},
 };
@@ -303,6 +303,29 @@ static struct mtd_partition partition_info_16KB_blk[] = {
  * Default partition layout for large page(> 512 bytes) devices
  * Size for "Root file system" is updated in driver based on actual device size
  */
+static struct mtd_partition partition_info_64KB_blk[] = {
+	{
+		.name = "X-loader",
+		.offset = 0,
+		.size = 4*0x10000,
+	},
+	{
+		.name = "U-Boot",
+		.offset = 4*0x10000,
+		.size = 8*0x40000,
+	},
+	{
+		.name = "Kernel",
+		.offset = (4+8)*0x10000,
+		.size = 64*0x40000,
+	},
+	{
+		.name = "Root File System",
+		.offset = (4+8+64)*0x10000,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
 static struct mtd_partition partition_info_128KB_blk[] = {
 	{
 		.name = "X-loader",
@@ -311,21 +334,112 @@ static struct mtd_partition partition_info_128KB_blk[] = {
 	},
 	{
 		.name = "U-Boot",
-		.offset = 0x80000,
+		.offset = 4*0x20000,
 		.size = 12*0x20000,
 	},
 	{
 		.name = "Kernel",
-		.offset = 0x200000,
+		.offset = (4+12)*0x20000,
 		.size = 48*0x20000,
 	},
 	{
 		.name = "Root File System",
-		.offset = 0x800000,
+		.offset = (4+12+48)*0x20000,
 		.size = MTDPART_SIZ_FULL,
 	},
 };
 
+static struct mtd_partition partition_info_256KB_blk[] = {
+	{
+		.name = "X-loader",
+		.offset = 0,
+		.size = 4*0x40000,
+	},
+	{
+		.name = "U-Boot",
+		.offset = 4*0x40000,
+		.size = 6*0x40000,
+	},
+	{
+		.name = "Kernel",
+		.offset = (4+6)*0x40000,
+		.size = 24*0x40000,
+	},
+	{
+		.name = "Root File System",
+		.offset = (4+6+24)*0x40000,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static struct mtd_partition partition_info_512KB_blk[] = {
+	{
+		.name = "X-loader",
+		.offset = 0,
+		.size = 4*0x80000,
+	},
+	{
+		.name = "U-Boot",
+		.offset = 4*0x80000,
+		.size = 6*0x80000,
+	},
+	{
+		.name = "Kernel",
+		.offset = (4+6)*0x80000,
+		.size = 24*0x80000,
+	},
+	{
+		.name = "Root File System",
+		.offset = (4+6+24)*0x80000,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static struct mtd_partition partition_info_1024KB_blk[] = {
+	{
+		.name = "X-loader",
+		.offset = 0,
+		.size = 4*0x100000,
+	},
+	{
+		.name = "U-Boot",
+		.offset = 4*0x100000,
+		.size = 4*0x100000,
+	},
+	{
+		.name = "Kernel",
+		.offset = (4+4)*0x100000,
+		.size = 12*0x100000,
+	},
+	{
+		.name = "Root File System",
+		.offset = (4+4+12)*0x100000,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
+
+static struct mtd_partition partition_info_2048KB_blk[] = {
+	{
+		.name = "X-loader",
+		.offset = 0,
+		.size = 4*0x200000,
+	},
+	{
+		.name = "U-Boot",
+		.offset = 4*0x200000,
+		.size = 4*0x200000,
+	},
+	{
+		.name = "Kernel",
+		.offset = (4+4)*0x200000,
+		.size = 6*0x200000,
+	},
+	{
+		.name = "Root File System",
+		.offset = (4+4+6)*0x200000,
+		.size = MTDPART_SIZ_FULL,
+	},
+};
 
 /**
  * struct fsmc_nand_data - structure for FSMC NAND device state
@@ -726,6 +840,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	struct nand_chip *nand;
 	struct fsmc_regs *regs;
 	struct resource *res;
+	struct mtd_partition *parts;
+	int nr_parts;
 	int ret = 0;
 	u32 pid;
 	int i;
@@ -940,13 +1056,41 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
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
+
+	if (host->mtd.erasesize == 0x200000) {
+		parts = partition_info_2048KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_2048KB_blk);
+
+	} else if (host->mtd.erasesize == 0x100000) {
+		parts = partition_info_1024KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_1024KB_blk);
+
+	} else if (host->mtd.erasesize == 0x80000) {
+		parts = partition_info_512KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_512KB_blk);
+
+	} else if (host->mtd.erasesize == 0x40000) {
+		parts = partition_info_256KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_256KB_blk);
+
+	} else if (host->mtd.erasesize == 0x20000) {
+		parts = partition_info_128KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_128KB_blk);
+
+	} else if (host->mtd.erasesize == 0x10000) {
+		parts = partition_info_64KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_64KB_blk);
+
+	} else if (host->mtd.erasesize == 0x4000) {
+		parts = partition_info_16KB_blk;
+		nr_parts = ARRAY_SIZE(partition_info_16KB_blk);
+
+	} else {
+		dev_err(&pdev->dev, "Unrecognized erase size\n");
+		goto err_probe;
+	}
+
+	ret = mtd_device_parse_register(&host->mtd, NULL, 0, parts, nr_parts);
 	if (ret)
 		goto err_probe;
 
-- 
1.7.0.4
