Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1tNW-000879-4K
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 02:30:36 +0000
From: nsnehaprabha@ti.com
To: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org,
	tglx@linutronix.de, akpm@linux-foundation.org
Subject: [PATCH 2/2] NAND on DM355: Add 4-bit ECC support for large page NAND
	chips
Date: Wed,  6 May 2009 22:29:31 -0400
Message-Id: <1241663371-20448-1-git-send-email-nsnehaprabha@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sneha Narnakaje <nsnehaprabha@ti.com>

This patch adds 4-bit ECC support for large page NAND chips using the new ECC
mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has been
adjusted to use this mode.

The patches have been verified on DM355 device with 2K Micron devices using
mtd-tests and JFFS2. Error correction upto 4-bits has also been verified using
nandwrite/nanddump utilities.

Note: This patch is dependent on '[patch 2.6.30-rc1] NAND: minor davinci
nand cleanup' and '[patch 2.6.30-rc1] NAND: davinci nand, 4-bit ECC for
smallpage' from David Brownell:
http://lists.infradead.org/pipermail/linux-mtd/2009-April/025206.html
http://lists.infradead.org/pipermail/linux-mtd/2009-April/025207.html

Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
---
 arch/arm/mach-davinci/board-dm355-evm.c |    3 ++-
 drivers/mtd/nand/davinci_nand.c         |   22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm355-evm.c b/arch/arm/mach-davinci/board-dm355-evm.c
index f32e3d8..39c5a4e 100644
--- a/arch/arm/mach-davinci/board-dm355-evm.c
+++ b/arch/arm/mach-davinci/board-dm355-evm.c
@@ -85,8 +85,9 @@ static struct davinci_nand_pdata davinci_nand_data = {
 	.mask_chipsel		= BIT(14),
 	.parts			= davinci_nand_partitions,
 	.nr_parts		= ARRAY_SIZE(davinci_nand_partitions),
-	.ecc_mode		= NAND_ECC_HW_SYNDROME,
+	.ecc_mode		= NAND_ECC_HW,
 	.options		= NAND_USE_FLASH_BBT,
+	.ecc_bits		= 4,
 };
 
 static struct resource davinci_nand_resources[] = {
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 006843a..f84bc16 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -500,6 +500,21 @@ static struct nand_ecclayout hwecc4_small __initconst = {
 	},
 };
 
+/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
+ * storing ten ECC bytes plus the manufacturer's bad block marker byte,
+ * and not overlapping the default BBT markers.
+ */
+static struct nand_ecclayout hwecc4_2048 __initconst = {
+	.eccbytes = 10,
+	.eccpos = { 0, 1, 2, 3, 4, 6, 7, 8, 9, 10,
+		11, 12, 13, 14, 15, 24, 25, 26, 27, 28,
+		29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
+		39, 40, 41, 42, 43, 44, 45, 46, 47, 48, },
+	.oobfree = {
+		{.offset = 16, .length = 8, },
+		{.offset = 49, },
+	},
+};
 
 static int __init nand_davinci_probe(struct platform_device *pdev)
 {
@@ -690,6 +705,13 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 				info->mtd.oobsize - 16;
 			goto syndrome_done;
 		}
+		if (chunks == 4) {
+			info->ecclayout = hwecc4_2048;
+			info->ecclayout.oobfree[1].length =
+				info->mtd.oobsize - 49;
+			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
+			goto syndrome_done;
+		}
 
 		/* For large page chips we'll be wanting to use a
 		 * not-yet-implemented mode that reads OOB data
-- 
1.6.0.4
