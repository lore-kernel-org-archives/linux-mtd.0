Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEMAT-0007LH-Iu
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 17:03:15 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v2 3/3] mtd: nand: omap: fix ecclayout to be in sync with
 u-boot NAND driver
Date: Fri, 14 Feb 2014 22:31:48 +0530
Message-ID: <1392397308-17630-4-git-send-email-pekon@ti.com>
In-Reply-To: <1392397308-17630-1-git-send-email-pekon@ti.com>
References: <1392397308-17630-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Felipe Balbi <balbi@ti.com>, u-boot@lists.denx.de,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes: commit a919e51161b58ed7e6e663daba99ab7d558808f3
       mtd: nand: omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in device_probe

Fixes ecclayout mismatch introduced in above commit for following ecc-schemes:
 - OMAP_ECC_BCH4_CODE_HW_DETECTION_SW
 - OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
 However, this patch also touches other ecc-schemes as the fix required
 refactoring common code, into ecc-scheme specific code.

This patch aligns ecc-layout for below ecc-schemes as per reference [1],[2],[3]

 +---+------------+-------------++-------------+-------------+
 |OOB|BCH8_CODE_HW|BCH8_CODE_HW_||HAM1_CODE_HW |HAM1_CODE_HW |
 |pos|            | DETECTION_SW||(x8 device)  |(x16 device) |
 +---+------------+-------------++-------------+-------------+
 | 0 |BADBLK_MARK | BADBLK_MARK || BADBLK_MARK | BADBLK_MARK |
 | 1 |BADBLK_MARK | BADBLK_MARK || eccpos[0]   | BADBLK_MARK |
 | 2 | eccpos[0]  | eccpos[0]   || eccpos[1]   | eccpos[0]   |
 | 3 | eccpos[1]  | eccpos[1]   || eccpos[2]   | eccpos[1]   |
 | 4 | eccpos[2]  | eccpos[2]   || eccpos[3]   | eccpos[2]   |
 | 5 | eccpos[3]  | eccpos[3]   || eccpos[4]   | eccpos[3]   |
 | 6 | eccpos[4]  | eccpos[4]   || eccpos[5]   | eccpos[4]   |
 | 7 | eccpos[5]  | eccpos[5]   || eccpos[6]   | eccpos[5]   |
 | 8 | eccpos[6]  | eccpos[6]   || eccpos[7]   | eccpos[6]   |
 | 9 | eccpos[7]  | eccpos[7]   || eccpos[8]   | eccpos[7]   |
 |10 | eccpos[8]  | eccpos[8]   || eccpos[9]   | eccpos[8]   |
 |11 | eccpos[9]  | eccpos[9]   || eccpos[10]  | eccpos[9]   |
 |12 | eccpos[10] | eccpos[10]  || eccpos[11]  | eccpos[10]  |
 |13 | eccpos[11] | eccpos[11]  || oobfree[0]  | eccpos[11]  |
 |14 | eccpos[12] | eccpos[12]  || oobfree[1]  | oobfree[0]  |
 |15 | eccpos[13] | <reserved>  || oobfree[2]  | oobfree[1]  |
 +---+------------+-------------++-------------+-------------+
 |16 | eccpos[14] | eccpos[13]  || oobfree[3]  | oobfree[2]  |
 |...| [...]      | [...]       || [...]       | [...]       |
 |56 | eccpos[54] | eccpos[51]  || oobfree[43] | oobfree[42] |
 |57 | eccpos[55] | <reserved>  || oobfree[44] | oobfree[43] |
 +===+============+=============+==============+=============+
 |58 | oobfree[0] | oobfree[0]  || oobfree[45] | oobfree[44] |
 |59 | oobfree[1] | oobfree[1]  || oobfree[46] | oobfree[45] |
 |60 | oobfree[2] | oobfree[2]  || oobfree[47] | oobfree[46] |
 |61 | oobfree[3] | oobfree[3]  || oobfree[48] | oobfree[47] |
 |62 | oobfree[4] | oobfree[4]  || oobfree[49] | oobfree[48] |
 |63 | oobfree[5] | oobfree[5]  || oobfree[50] | oobfree[49] |
 +---+------------+-------------+--------------+-------------+

[1] ecc-layout expected by ROM code, as specified in SoC TRM under:
      Chapter="Initialization"
        Section="Device Initialization by ROM code"
            Sub-Section="Memory Booting"
                Heading="NAND"
                Figure="ECC Locations in NAND Spare Areas"

[2] ecc-layout updates in u-boot
    http://lists.denx.de/pipermail/u-boot/2013-November/167551.html

[3] u-boot configurations to match above ecc-layout are documented at
    https://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide

Reported-by: Enric Balletbo Serra <eballetbo@iseebcn.com>
Tested-by: Enric Balletbo i Serra <eballetbo@gmail.com>
Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 433e58a..bf642ce 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1633,6 +1633,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	int				i;
 	dma_cap_mask_t			mask;
 	unsigned			sig;
+	unsigned			oob_index;
 	struct resource			*res;
 	struct mtd_part_parser_data	ppdata = {};
 
@@ -1826,9 +1827,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		if (nand_chip->options & NAND_BUSWIDTH_16)
-			ecclayout->eccpos[0]	= BADBLOCK_MARKER_LENGTH;
+			oob_index		= BADBLOCK_MARKER_LENGTH;
 		else
-			ecclayout->eccpos[0]	= 1;
+			oob_index		= 1;
+		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++)
+			ecclayout->eccpos[i]	= oob_index;
 		/* no reserved-marker in ecclayout for this ecc-scheme */
 		ecclayout->oobfree->offset	=
 				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
@@ -1848,7 +1851,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 		ecclayout->eccbytes		= nand_chip->ecc.bytes *
 							(mtd->writesize /
 							nand_chip->ecc.size);
-		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
+		oob_index			= BADBLOCK_MARKER_LENGTH;
+		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++) {
+			ecclayout->eccpos[i] = oob_index;
+			if (((i + 1) % nand_chip->ecc.bytes) == 0)
+				oob_index++;
+		}
 		/* include reserved-marker in ecclayout->oobfree calculation */
 		ecclayout->oobfree->offset	= 1 +
 				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
@@ -1885,7 +1893,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		ecclayout->eccbytes		= nand_chip->ecc.bytes *
 							(mtd->writesize /
 							nand_chip->ecc.size);
-		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
+		oob_index			= BADBLOCK_MARKER_LENGTH;
+		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++)
+			ecclayout->eccpos[i]	= oob_index;
 		/* reserved marker already included in ecclayout->eccbytes */
 		ecclayout->oobfree->offset	=
 				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
@@ -1916,7 +1926,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 		ecclayout->eccbytes		= nand_chip->ecc.bytes *
 							(mtd->writesize /
 							nand_chip->ecc.size);
-		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
+		oob_index			= BADBLOCK_MARKER_LENGTH;
+		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++) {
+			ecclayout->eccpos[i] = oob_index;
+			if (((i + 1) % nand_chip->ecc.bytes) == 0)
+				oob_index++;
+		}
 		/* include reserved-marker in ecclayout->oobfree calculation */
 		ecclayout->oobfree->offset	= 1 +
 				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
@@ -1960,7 +1975,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 		ecclayout->eccbytes		= nand_chip->ecc.bytes *
 							(mtd->writesize /
 							nand_chip->ecc.size);
-		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
+		oob_index			= BADBLOCK_MARKER_LENGTH;
+		for (i = 0; i < ecclayout->eccbytes; i++, oob_index++)
+			ecclayout->eccpos[i]	= oob_index;
 		/* reserved marker already included in ecclayout->eccbytes */
 		ecclayout->oobfree->offset	=
 				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
@@ -1979,8 +1996,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	/* all OOB bytes from oobfree->offset till end off OOB are free */
 	ecclayout->oobfree->length = mtd->oobsize - ecclayout->oobfree->offset;
-	for (i = 1; i < ecclayout->eccbytes; i++)
-		ecclayout->eccpos[i] = ecclayout->eccpos[0] + i;
 	/* check if NAND device's OOB is enough to store ECC signatures */
 	if (mtd->oobsize < (ecclayout->eccbytes + BADBLOCK_MARKER_LENGTH)) {
 		pr_err("not enough OOB bytes required = %d, available=%d\n",
-- 
1.8.5.1.163.gd7aced9
