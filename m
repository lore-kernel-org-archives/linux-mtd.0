Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIbeo-0001Ap-2B
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 10:24:09 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 2/4] mtd: nand: omap: ecc.calculate: refactor
 omap_calculate_ecc_bch for BCHx_HW ecc-scheme
Date: Wed, 26 Feb 2014 15:53:12 +0530
Message-ID: <1393410194-15094-3-git-send-email-pekon@ti.com>
In-Reply-To: <1393410194-15094-1-git-send-email-pekon@ti.com>
References: <1393410194-15094-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
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

This patch refactors omap_calculate_ecc_bch() so that
 - separate out ecc-scheme specific code so that common-code can be reused
   between different implementations of same ECC algorithm.
 - new ecc-schemes can be added with ease in future.

Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 68 +++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index a3f7707..f1a33eb 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1214,33 +1214,25 @@ static int omap3_calculate_ecc_bch8(struct mtd_info *mtd, const u_char *dat,
  * Support calculating of BCH4/8 ecc vectors for the page
  */
 static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
-					const u_char *dat, u_char *ecc_code)
+					const u_char *dat, u_char *ecc_calc)
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 						   mtd);
+	int eccbytes	= info->nand.ecc.bytes;
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
+		switch (info->ecc_opt) {
+		case OMAP_ECC_BCH8_CODE_HW:
+			bch_val1 = readl(gpmc_regs->gpmc_bch_result0[i]);
+			bch_val2 = readl(gpmc_regs->gpmc_bch_result1[i]);
+			bch_val3 = readl(gpmc_regs->gpmc_bch_result2[i]);
+			bch_val4 = readl(gpmc_regs->gpmc_bch_result3[i]);
 			*ecc_code++ = (bch_val4 & 0xFF);
 			*ecc_code++ = ((bch_val3 >> 24) & 0xFF);
 			*ecc_code++ = ((bch_val3 >> 16) & 0xFF);
@@ -1254,14 +1246,10 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
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
@@ -1270,12 +1258,26 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
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
+		switch (info->ecc_opt) {
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
1.8.5.1.163.gd7aced9
