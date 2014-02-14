Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEMDs-0007UA-9V
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 17:06:46 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v2 1/3] mtd: nand: omap: fix ecclayout->oobfree->offset
Date: Fri, 14 Feb 2014 22:31:46 +0530
Message-ID: <1392397308-17630-2-git-send-email-pekon@ti.com>
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

1) In current implementation, ecclayout->oobfree->offset is calculated with
 respect to ecclayout->eccpos[0] which is incorrect because ECC bytes may not
 be stored contiguously in OOB.
 So, this patch calculates ecclayout->oobfree->offset with respect to last
 ECC byte-position 'eccpos[ecclayout->eccbytes-1]'.

2) ECC layout of some ecc-schemes expects reserved-markers at specific eccpos[]
 which should not be over-written by any file-system metadata.
 So this patch aligns oobfree->offset taking into account of such markers.

Tested-by: Enric Balletbo i Serra <eballetbo@gmail.com>
Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index ef4190a..874fd9d 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1829,8 +1829,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 			ecclayout->eccpos[0]	= BADBLOCK_MARKER_LENGTH;
 		else
 			ecclayout->eccpos[0]	= 1;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
+		/* no reserved-marker in ecclayout for this ecc-scheme */
+		ecclayout->oobfree->offset	=
+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
 		break;
 
 	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
@@ -1848,8 +1849,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
+		/* include reserved-marker in ecclayout->oobfree calculation */
+		ecclayout->oobfree->offset	= 1 +
+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
 		/* software bch library is used for locating errors */
 		nand_chip->ecc.priv		= nand_bch_init(mtd,
 							nand_chip->ecc.size,
@@ -1884,8 +1886,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
+		/* reserved marker already included in ecclayout->eccbytes */
+		ecclayout->oobfree->offset	=
+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
 		/* This ECC scheme requires ELM H/W block */
 		if (is_elm_present(info, pdata->elm_of_node, BCH4_ECC) < 0) {
 			pr_err("nand: error: could not initialize ELM\n");
@@ -1914,8 +1917,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
+		/* include reserved-marker in ecclayout->oobfree calculation */
+		ecclayout->oobfree->offset	= 1 +
+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
 		/* software bch library is used for locating errors */
 		nand_chip->ecc.priv		= nand_bch_init(mtd,
 							nand_chip->ecc.size,
@@ -1957,8 +1961,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
+		/* reserved marker already included in ecclayout->eccbytes */
+		ecclayout->oobfree->offset	=
+				ecclayout->eccpos[ecclayout->eccbytes - 1] + 1;
 		break;
 #else
 		pr_err("nand: error: CONFIG_MTD_NAND_OMAP_BCH not enabled\n");
-- 
1.8.5.1.163.gd7aced9
