Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGfCP-0001yq-Hy
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 20:24:12 +0000
From: s-paulraj@ti.com
To: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org, tglx@linutronix.de,
	akpm@linux-foundation.org
Subject: [PATCH v2 3/3] Add 4-bit ECC support for large page NAND chips on
	Davinci
Date: Tue, 16 Jun 2009 16:23:32 -0400
Message-Id: <1245183812-11500-1-git-send-email-s-paulraj@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>, Sandeep Paulraj <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sandeep Paulraj <s-paulraj@ti.com>

The patch applies to linux-mtd GIT tree

This patch adds 4-bit ECC support for large page NAND chips using the new ECC
mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has been
adjusted to use this mode.

The patches have been verified on DM355 device with 2K and 4K page size 
Micron devices using mtd-tests.
Error correction upto 4-bits has also been verified using
nandwrite/nanddump utilities.

Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |   65 ++++++++++++++++++++++++++++++++++----
 1 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index ba6940d..2ff0712 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -500,6 +500,49 @@ static struct nand_ecclayout hwecc4_small __initconst = {
 	},
 };
 
+/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
+ * storing ten ECC bytes plus the manufacturer's bad block marker byte,
+ * and not overlapping the default BBT markers.
+ */
+static struct nand_ecclayout hwecc4_2048 __initconst = {
+	.eccbytes = 40,
+	.eccpos = { /* 2 bytes at offset 0 hold the badblock markers */
+		/* 4 bytes at offset 8 hold BBT header */
+		/* 1 byte at offset 12 holds BBT version */
+		/* 8 bytes at offset 16 hold JFFS2 clean markers */
+		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
+		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
+		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
+		54, 55, 56, 57, 58, 59, 60, 61, 62, 63, },
+	.oobfree = {
+		{.offset = 16, .length = 8, },
+		{.offset = 64, },
+	},
+};
+
+/* An ECC layout for using 4-bit ECC with large-page (4096bytes) flash,
+ * storing ten ECC bytes plus the manufacturer's bad block marker byte,
+ * and not overlapping the default BBT markers.
+ */
+static struct nand_ecclayout hwecc4_4096 __initconst = {
+	.eccbytes = 80,
+	.eccpos = { /* 2 bytes at offset 0 hold the badblock markers */
+		/* 4 bytes at offset 8 hold BBT header */
+		/* 1 byte at offset 12 holds BBT version */
+		/* 8 bytes at offset 16 hold JFFS2 clean markers */
+		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
+		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
+		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
+		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+		64, 65, 66, 67, 68, 69, 70, 71, 72, 73,
+		74, 75, 76, 77, 78, 69,	80, 81, 82, 83,
+		84, 85, 86, 87, 88, 89, 90, 91, 92, 93,
+		94, 95, 96, 97, 98, 99, 100, 101, 102, 103, },
+	.oobfree = {
+		{.offset = 16, .length = 8, },
+		{.offset = 104, },
+	},
+};
 
 static int __init nand_davinci_probe(struct platform_device *pdev)
 {
@@ -689,15 +732,23 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 				info->mtd.oobsize - 16;
 			goto syndrome_done;
 		}
+		if (chunks == 4) {
+			info->ecclayout = hwecc4_2048;
+			info->ecclayout.oobfree[1].length = info->mtd.oobsize -
+				info->ecclayout.oobfree[1].offset;
+			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
+			goto syndrome_done;
+		}
+		if (chunks == 8) {
+			info->ecclayout = hwecc4_4096;
+			info->ecclayout.oobfree[1].length = info->mtd.oobsize -
+				info->ecclayout.oobfree[1].offset;
+			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
+			goto syndrome_done;
+		}
 
-		/* For large page chips we'll be wanting to use a
-		 * not-yet-implemented mode that reads OOB data
-		 * before reading the body of the page, to avoid
-		 * the "infix OOB" model of NAND_ECC_HW_SYNDROME
-		 * (and preserve manufacturer badblock markings).
-		 */
 		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
-				"for large page NAND\n");
+				"for >4K page NAND\n");
 		ret = -EIO;
 		goto err_scan;
 
-- 
1.6.0.4
