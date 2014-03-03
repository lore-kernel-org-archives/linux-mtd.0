Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKPoF-0001YD-Vm
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 10:09:21 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 3/4] mtd: nand: omap: ecc.hwctl: clean
 omap_enable_hwecc_bch for redundant ECC configs
Date: Mon, 3 Mar 2014 15:38:32 +0530
Message-ID: <1393841313-28214-4-git-send-email-pekon@ti.com>
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

This patch
 - refactors GPMC configurations based on ecc-scheme
 - removed dependency on is_elm_present() flag, which is implicitely
   taken care by selecting appropriate ecc-scheme

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 99f9223..c057a88 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1048,7 +1048,7 @@ static int omap_dev_ready(struct mtd_info *mtd)
  */
 static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 {
-	int nerrors;
+	unsigned int bch_type;
 	unsigned int dev_width, nsectors;
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 						   mtd);
@@ -1057,20 +1057,11 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	u32 val, wr_mode;
 	unsigned int ecc_size1, ecc_size0;
 
-	/* Perform ecc calculation on 512-byte sector */
-	nsectors = 1;
-
-	/* Update number of error correction */
-	nerrors = info->nand.ecc.strength;
-
-	/* Multi sector reading/writing for NAND flash with page size < 4096 */
-	if (info->is_elm_used && (mtd->writesize <= 4096)) {
-		/* Perform ecc calculation for one page (< 4096) */
-		nsectors = info->nand.ecc.steps;
-	}
 	/* GPMC configurations for calculating ECC */
 	switch (ecc_opt) {
 	case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
+		bch_type = 0;
+		nsectors = 1;
 		if (mode == NAND_ECC_READ) {
 			wr_mode	  = BCH_WRAPMODE_6;
 			ecc_size0 = BCH_ECC_SIZE0;
@@ -1082,6 +1073,8 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 		}
 		break;
 	case OMAP_ECC_BCH4_CODE_HW:
+		bch_type = 0;
+		nsectors = chip->ecc.steps;
 		if (mode == NAND_ECC_READ) {
 			wr_mode	  = BCH_WRAPMODE_1;
 			ecc_size0 = BCH4R_ECC_SIZE0;
@@ -1093,6 +1086,8 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 		}
 		break;
 	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
+		bch_type = 1;
+		nsectors = 1;
 		if (mode == NAND_ECC_READ) {
 			wr_mode	  = BCH_WRAPMODE_6;
 			ecc_size0 = BCH_ECC_SIZE0;
@@ -1104,6 +1099,8 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 		}
 		break;
 	case OMAP_ECC_BCH8_CODE_HW:
+		bch_type = 1;
+		nsectors = chip->ecc.steps;
 		if (mode == NAND_ECC_READ) {
 			wr_mode	  = BCH_WRAPMODE_1;
 			ecc_size0 = BCH8R_ECC_SIZE0;
@@ -1128,7 +1125,7 @@ static void __maybe_unused omap_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 
 	/* BCH configuration */
 	val = ((1                        << 16) | /* enable BCH */
-	       (((nerrors == 8) ? 1 : 0) << 12) | /* 8 or 4 bits */
+	       (bch_type		 << 12) | /* BCH4/BCH8/BCH16 */
 	       (wr_mode                  <<  8) | /* wrap mode */
 	       (dev_width                <<  7) | /* bus width */
 	       (((nsectors-1) & 0x7)     <<  4) | /* number of sectors */
-- 
1.8.5.1.163.gd7aced9
