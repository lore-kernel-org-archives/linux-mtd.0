Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRZ0N-0003gf-A5
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 22:00:47 +0000
From: nsnehaprabha@ti.com
To: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org,
	tglx@linutronix.de, akpm@linux-foundation.org
Subject: [PATCH v3 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Date: Thu, 16 Jul 2009 17:59:50 -0400
Message-Id: <1247781590-11323-1-git-send-email-nsnehaprabha@ti.com>
Cc: Sneha Narnakaje <nsnehaprabha@ti.com>, Sandeep Paulraj <s-paulraj@ti.com>
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

This patch series applies to linux-mtd next (mmotm) GIT tree.
This version (v3) addresses the review comment to keep OOB bytes towards the
end of sparebytes region. It also fixes a bug in the ECC correction handler.
When we introduce 5 bit-errors in chunk, error correction stops working. When
errors are detected the 4BITECC_START bit was left high, which should be
cleared.

Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |   45 +++++++++++++++++++++++++++++++++-----
 1 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 0fad648..14c72d2 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -348,6 +348,12 @@ compare:
 	if (!(syndrome[0] | syndrome[1] | syndrome[2] | syndrome[3]))
 		return 0;
 
+	/*
+	 * Clear any previous address calculation by doing a dummy read of an
+	 * error address register.
+	 */
+	davinci_nand_readl(info, NAND_ERR_ADD1_OFFSET);
+
 	/* Start address calculation, and wait for it to complete.
 	 * We _could_ start reading more data while this is working,
 	 * to speed up the overall page read.
@@ -359,8 +365,10 @@ compare:
 
 		switch ((fsr >> 8) & 0x0f) {
 		case 0:		/* no error, should not happen */
+			davinci_nand_readl(info, NAND_ERR_ERRVAL1_OFFSET);
 			return 0;
 		case 1:		/* five or more errors detected */
+			davinci_nand_readl(info, NAND_ERR_ERRVAL1_OFFSET);
 			return -EIO;
 		case 2:		/* error addresses computed */
 		case 3:
@@ -500,6 +508,26 @@ static struct nand_ecclayout hwecc4_small __initconst = {
 	},
 };
 
+/* An ECC layout for using 4-bit ECC with large-page (2048bytes) flash,
+ * storing ten ECC bytes plus the manufacturer's bad block marker byte,
+ * and not overlapping the default BBT markers.
+ */
+static struct nand_ecclayout hwecc4_2048 __initconst = {
+	.eccbytes = 40,
+	.eccpos = {
+		/* at the end of spare sector */
+		24, 25, 26, 27, 28, 29,	30, 31, 32, 33,
+		34, 35, 36, 37, 38, 39,	40, 41, 42, 43,
+		44, 45, 46, 47, 48, 49, 50, 51, 52, 53,
+		54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+		},
+	.oobfree = {
+		/* 1 byte at offset 0 holds manufacturer badblock marker */
+		{.offset = 1, .length = 23, },
+		/* 5 bytes at offset 8 hold BBT markers */
+		/* 8 bytes at offset 16 hold JFFS2 clean markers */
+	},
+};
 
 static int __init nand_davinci_probe(struct platform_device *pdev)
 {
@@ -690,15 +718,20 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 				info->mtd.oobsize - 16;
 			goto syndrome_done;
 		}
+		if (chunks == 4) {
+			info->ecclayout = hwecc4_2048;
+			info->chip.ecc.mode = NAND_ECC_HW_OOB_FIRST;
+			goto syndrome_done;
+		}
 
-		/* For large page chips we'll be wanting to use a
-		 * not-yet-implemented mode that reads OOB data
-		 * before reading the body of the page, to avoid
-		 * the "infix OOB" model of NAND_ECC_HW_SYNDROME
-		 * (and preserve manufacturer badblock markings).
+		/* 4K page chips are not yet supported. The eccpos from
+		 * nand_ecclayout cannot hold 80 bytes and change to eccpos[]
+		 * breaks userspace ioctl interface with mtd-utils. Once we
+		 * resolve this issue, NAND_ECC_HW_OOB_FIRST mode can be used
+		 * for the 4K page chips.
 		 */
 		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
-				"for large page NAND\n");
+				"for 4K page NAND\n");
 		ret = -EIO;
 		goto err_scan;
 
-- 
1.6.0.4
