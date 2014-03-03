Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKPoG-0001XP-MJ
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 10:09:23 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 2/4] mtd: nand: omap: ecc.hwctl: refactor
 omap_enable_hwecc_bch for ECC related GPMC configs
Date: Mon, 3 Mar 2014 15:38:31 +0530
Message-ID: <1393841313-28214-3-git-send-email-pekon@ti.com>
In-Reply-To: <1393841313-28214-1-git-send-email-pekon@ti.com>
References: <1393841313-28214-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lots of if..then..else conditions in omap_enable_hwecc_bch() can be avoided if
code is refactored based on ecc-scheme.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 74 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index efc94f1..99f9223 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1052,20 +1052,11 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	unsigned int dev_width, nsectors;
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 						   mtd);
+	enum omap_ecc ecc_opt = info->ecc_opt;
 	struct nand_chip *chip = mtd->priv;
 	u32 val, wr_mode;
 	unsigned int ecc_size1, ecc_size0;
 
-	/* Using wrapping mode 6 for writing */
-	wr_mode = BCH_WRAPMODE_6;
-
-	/*
-	 * ECC engine enabled for valid ecc_size0 nibbles
-	 * and disabled for ecc_size1 nibbles.
-	 */
-	ecc_size0 = BCH_ECC_SIZE0;
-	ecc_size1 = BCH_ECC_SIZE1;
-
 	/* Perform ecc calculation on 512-byte sector */
 	nsectors = 1;
 
@@ -1074,23 +1065,58 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 
 	/* Multi sector reading/writing for NAND flash with page size < 4096 */
 	if (info->is_elm_used && (mtd->writesize <= 4096)) {
-		if (mode == NAND_ECC_READ) {
-			/* Using wrapping mode 1 for reading */
-			wr_mode = BCH_WRAPMODE_1;
-
-			/*
-			 * ECC engine enabled for ecc_size0 nibbles
-			 * and disabled for ecc_size1 nibbles.
-			 */
-			ecc_size0 = (nerrors == 8) ?
-				BCH8R_ECC_SIZE0 : BCH4R_ECC_SIZE0;
-			ecc_size1 = (nerrors == 8) ?
-				BCH8R_ECC_SIZE1 : BCH4R_ECC_SIZE1;
-		}
-
 		/* Perform ecc calculation for one page (< 4096) */
 		nsectors = info->nand.ecc.steps;
 	}
+	/* GPMC configurations for calculating ECC */
+	switch (ecc_opt) {
+	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
+		if (mode == NAND_ECC_READ) {
+			wr_mode	  = BCH_WRAPMODE_6;
+			ecc_size0 = BCH_ECC_SIZE0;
+			ecc_size1 = BCH_ECC_SIZE1;
+		} else {
+			wr_mode   = BCH_WRAPMODE_6;
+			ecc_size0 = BCH_ECC_SIZE0;
+			ecc_size1 = BCH_ECC_SIZE1;
+		}
+		break;
+	case OMAP_ECC_BCH4_CODE_HW:
+		if (mode == NAND_ECC_READ) {
+			wr_mode	  = BCH_WRAPMODE_1;
+			ecc_size0 = BCH4R_ECC_SIZE0;
+			ecc_size1 = BCH4R_ECC_SIZE1;
+		} else {
+			wr_mode   = BCH_WRAPMODE_6;
+			ecc_size0 = BCH_ECC_SIZE0;
+			ecc_size1 = BCH_ECC_SIZE1;
+		}
+		break;
+	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
+		if (mode == NAND_ECC_READ) {
+			wr_mode	  = BCH_WRAPMODE_6;
+			ecc_size0 = BCH_ECC_SIZE0;
+			ecc_size1 = BCH_ECC_SIZE1;
+		} else {
+			wr_mode   = BCH_WRAPMODE_6;
+			ecc_size0 = BCH_ECC_SIZE0;
+			ecc_size1 = BCH_ECC_SIZE1;
+		}
+		break;
+	case OMAP_ECC_BCH8_CODE_HW:
+		if (mode == NAND_ECC_READ) {
+			wr_mode	  = BCH_WRAPMODE_1;
+			ecc_size0 = BCH8R_ECC_SIZE0;
+			ecc_size1 = BCH8R_ECC_SIZE1;
+		} else {
+			wr_mode   = BCH_WRAPMODE_6;
+			ecc_size0 = BCH_ECC_SIZE0;
+			ecc_size1 = BCH_ECC_SIZE1;
+		}
+		break;
+	default:
+		return;
+	}
 
 	writel(ECC1, info->reg.gpmc_ecc_control);
 
-- 
1.8.5.1.163.gd7aced9
