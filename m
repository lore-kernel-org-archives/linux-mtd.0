Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0WzH-0007b2-OZ
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 13:46:34 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 2/4] mtd: nand: omap: ecc.calculate: refactor
 omap_calculate_ecc_bch for BCHx_HW ecc-scheme
Date: Tue, 7 Jan 2014 19:15:44 +0530
Message-ID: <1389102346-1455-3-git-send-email-pekon@ti.com>
In-Reply-To: <1389102346-1455-1-git-send-email-pekon@ti.com>
References: <1389102346-1455-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OMAP NAND driver supports multiple flavours of BCH4 and BCH8 ECC algorithms.
+------+------------------------------------+---------------+---------------+
| Algo | ECC scheme                         |ECC calculation|Error detection|
+------+------------------------------------+---------------+---------------+
|      |OMAP_ECC_BCH4_CODE_HW_DETECTION_SW  |H/W (GPMC)     |S/W            |
| BCH4 |OMAP_ECC_BCH4_CODE_HW               |H/W (GPMC)     |H/W (ELM)      |
+------+------------------------------------+---------------+---------------+
|      |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW  |H/W (GPMC)     |S/W            |
| BCH8 |OMAP_ECC_BCH8_CODE_HW               |H/W (GPMC)     |H/W (ELM)      |
+------+------------------------------------+---------------+---------------+

As all implementations of H/W ecc-scheme use GPMC engine for ECC calculation,
Thus this patch:
(1) Replaces if..then..else with switch..case statements, so that code is
    scalable for adding new ecc-schemes in future.

(2) Separates out ecc-scheme specific customizations into separate switch..case,
    so that common code can be re-used between different flavours of ecc-scheme.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 69 +++++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index bf9bf7e..dabea92 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1219,33 +1219,26 @@ static int omap3_calculate_ecc_bch8(struct mtd_info *mtd, const u_char *dat,
  * Support calculating of BCH4/8 ecc vectors for the page
  */
 static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
-					const u_char *dat, u_char *ecc_code)
+					const u_char *dat, u_char *ecc_calc)
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 						   mtd);
+	int eccbytes	= info->nand.ecc.bytes;
+	enum omap_ecc ecc_opt = info->ecc_opt;
+	struct gpmc_nand_regs	*gpmc_regs = &info->reg;
+	u8 *ecc_code;
 	unsigned long nsectors, bch_val1, bch_val2, bch_val3, bch_val4;
-	int i, eccbchtsel;
+	int i;
 
 	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
-	/*
-	 * find BCH scheme used
-	 * 0 -> BCH4
-	 * 1 -> BCH8
-	 */
-	eccbchtsel = ((readl(info->reg.gpmc_ecc_config) >> 12) & 0x3);
-
 	for (i = 0; i < nsectors; i++) {
-
-		/* Read hw-computed remainder */
-		bch_val1 = readl(info->reg.gpmc_bch_result0[i]);
-		bch_val2 = readl(info->reg.gpmc_bch_result1[i]);
-		if (eccbchtsel) {
-			bch_val3 = readl(info->reg.gpmc_bch_result2[i]);
-			bch_val4 = readl(info->reg.gpmc_bch_result3[i]);
-		}
-
-		if (eccbchtsel) {
-			/* BCH8 ecc scheme */
+		ecc_code = ecc_calc;
+		switch (ecc_opt) {
+		case OMAP_ECC_BCH8_CODE_HW:
+			bch_val1 = readl(gpmc_regs->gpmc_bch_result0[i]);
+			bch_val2 = readl(gpmc_regs->gpmc_bch_result1[i]);
+			bch_val3 = readl(gpmc_regs->gpmc_bch_result2[i]);
+			bch_val4 = readl(gpmc_regs->gpmc_bch_result3[i]);
 			*ecc_code++ = (bch_val4 & 0xFF);
 			*ecc_code++ = ((bch_val3 >> 24) & 0xFF);
 			*ecc_code++ = ((bch_val3 >> 16) & 0xFF);
@@ -1259,14 +1252,10 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 			*ecc_code++ = ((bch_val1 >> 16) & 0xFF);
 			*ecc_code++ = ((bch_val1 >> 8) & 0xFF);
 			*ecc_code++ = (bch_val1 & 0xFF);
-			/*
-			 * Setting 14th byte to zero to handle
-			 * erased page & maintain compatibility
-			 * with RBL
-			 */
-			*ecc_code++ = 0x0;
-		} else {
-			/* BCH4 ecc scheme */
+			break;
+		case OMAP_ECC_BCH4_CODE_HW:
+			bch_val1 = readl(gpmc_regs->gpmc_bch_result0[i]);
+			bch_val2 = readl(gpmc_regs->gpmc_bch_result1[i]);
 			*ecc_code++ = ((bch_val2 >> 12) & 0xFF);
 			*ecc_code++ = ((bch_val2 >> 4) & 0xFF);
 			*ecc_code++ = ((bch_val2 & 0xF) << 4) |
@@ -1275,12 +1264,26 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 			*ecc_code++ = ((bch_val1 >> 12) & 0xFF);
 			*ecc_code++ = ((bch_val1 >> 4) & 0xFF);
 			*ecc_code++ = ((bch_val1 & 0xF) << 4);
-			/*
-			 * Setting 8th byte to zero to handle
-			 * erased page
-			 */
-			*ecc_code++ = 0x0;
+			break;
+		default:
+			return -EINVAL;
 		}
+
+		/* ECC scheme specific syndrome customizations */
+		switch (ecc_opt) {
+		case OMAP_ECC_BCH4_CODE_HW:
+			/* Set  8th ECC byte as 0x0 for ROM compatibility */
+			ecc_calc[eccbytes - 1] = 0x0;
+			break;
+		case OMAP_ECC_BCH8_CODE_HW:
+			/* Set 14th ECC byte as 0x0 for ROM compatibility */
+			ecc_calc[eccbytes - 1] = 0x0;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+	ecc_calc += eccbytes;
 	}
 
 	return 0;
-- 
1.8.1
