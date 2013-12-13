Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrOpF-0000fZ-7O
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 09:14:26 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, Scott Wood <scottwood@freescale.com>, Tom Rini
 <trini@ti.com>
Subject: [PATCH v1 1/2] mtd: nand: omap: fix ecclayout->oobfree->offset
Date: Fri, 13 Dec 2013 14:42:57 +0530
Message-ID: <1386925978-23705-2-git-send-email-pekon@ti.com>
In-Reply-To: <1386925978-23705-1-git-send-email-pekon@ti.com>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stefan Roese <sr@denx.de>, Michael Trimarchi <michael@amarulasolutions.com>,
 r-woodruff2@ti.com, avinashphilipk@gmail.com, jp.francois@cynove.com,
 Pekon Gupta <pekon@ti.com>, r.meier@siemens.com, balbi@ti.com,
 u-boot@lists.denx.de, Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd@lists.infradead.org, Igor Grinberg <grinberg@compulab.co.il>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 linux-omap <linux-omap@vger.kernel.org>, ivan.djelic@parrot.com,
 Nikita Kiryanov <nikita@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch updates starting offset for free bytes in OOB which can be used by
file-systems to store their metadata (like clean-marker in case of JFFS2).

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f777250..bbdb5e8 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1835,8 +1835,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 			ecclayout->eccpos[0]	= BADBLOCK_MARKER_LENGTH;
 		else
 			ecclayout->eccpos[0]	= 1;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
 		break;
 
 	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
@@ -1854,8 +1852,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
 		/* software bch library is used for locating errors */
 		nand_chip->ecc.priv		= nand_bch_init(mtd,
 							nand_chip->ecc.size,
@@ -1890,8 +1886,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
 		/* This ECC scheme requires ELM H/W block */
 		if (is_elm_present(info, pdata->elm_of_node, BCH4_ECC) < 0) {
 			pr_err("nand: error: could not initialize ELM\n");
@@ -1920,8 +1914,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
 		/* software bch library is used for locating errors */
 		nand_chip->ecc.priv		= nand_bch_init(mtd,
 							nand_chip->ecc.size,
@@ -1963,8 +1955,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 							(mtd->writesize /
 							nand_chip->ecc.size);
 		ecclayout->eccpos[0]		= BADBLOCK_MARKER_LENGTH;
-		ecclayout->oobfree->offset	= ecclayout->eccpos[0] +
-							ecclayout->eccbytes;
 		break;
 #else
 		pr_err("nand: error: CONFIG_MTD_NAND_OMAP_BCH not enabled\n");
@@ -1978,9 +1968,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 		goto return_error;
 	}
 
-	/* populate remaining ECC layout data */
-	ecclayout->oobfree->length = mtd->oobsize - (BADBLOCK_MARKER_LENGTH +
-							ecclayout->eccbytes);
 	for (i = 1; i < ecclayout->eccbytes; i++)
 		ecclayout->eccpos[i] = ecclayout->eccpos[0] + i;
 	/* check if NAND device's OOB is enough to store ECC signatures */
@@ -1990,6 +1977,10 @@ static int omap_nand_probe(struct platform_device *pdev)
 		err = -EINVAL;
 		goto return_error;
 	}
+	/* populate remaining ECC layout data */
+	ecclayout->oobfree->offset = ecclayout->eccpos[ecclayout->eccbytes] + 1;
+	ecclayout->oobfree->length = mtd->oobsize - (BADBLOCK_MARKER_LENGTH +
+							ecclayout->eccbytes);
 
 	/* second phase scan */
 	if (nand_scan_tail(mtd)) {
-- 
1.8.1
