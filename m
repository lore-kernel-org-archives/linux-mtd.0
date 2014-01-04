Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzHIQ-0004N1-26
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 02:49:11 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 3/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix erased-page bit-flip correction for H/W ECC schemes
Date: Sat, 4 Jan 2014 08:18:15 +0530
Message-ID: <1388803698-26252-4-git-send-email-pekon@ti.com>
In-Reply-To: <1388803698-26252-1-git-send-email-pekon@ti.com>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, balbi@ti.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

chip->ecc.correct() is used for detecting and correcting bit-flips during read
operations. In OMAP NAND driver different ecc-schemes have different callbacks:
 - omap_correct_data()		for HAM1_HW ecc-schemes (Untouched)
 - nand_bch_correct_data()	for BCHx_HW_DETECTION_SW ecc-schemes (Untouched)
 - omap_elm_correct_data()	for BCHx_HW ecc-schemes (updated)

This patch solves following problems in ECC correction for BCHx_HW ecc-schemes.
Problem: In current implementation, number of bit-flips in erased-pages is
         calculated comparing each byte of Data & OOB with 0xff in
         function check_erased_page().
         But, with growing density of NAND devices (especially for MLC NAND)
         where pagesize is of 4k or more bytes, occurence of bit-flips is
         very common. Thus comparing each byte of both main-area and OOB
         with 0xff decreases NAND performance due to CPU overhead.

Known attributes of an erased-page
 - Bit-flips in erased-page can't be corrected because there is no ECC
   present in OOB.
 - Irrespective of number of bit-flips an erased-page will only contain
   all(0xff), So its safe to return error-code -EUCLEAN with data_buf=0xff,
   instead of -EBADMSG.
 - And incrementing ecc_stat->corrected makes chip->read_page() return -EUCLEAN.

Solution: In NAND based file-systems like UBIFS, each page is checked for
         bit-flips before writing to it. If correctable bit-flips are found
         in erased-page then -EUCLEAN error-code is returned which causes
         UBIFS to re-erase the complete block. So, its unnecessary to get
         exact count of bit-flips in an erased-page.
         Hence this patch just compares calc_ecc[] with known
         ECC-syndromp-of-all(0xff), to confirm if erased-page has bit-flips.
         - if bit-flips are found, then
             read buffer is set to all(0xff) and
             correctable bit-flips = max(ecc-strength) is reported back to
             upper layer to take preventive action (like re-erasing block).
         - else
              read-data is returned normally.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 87 ++++++++++++++++++------------------------------
 1 file changed, 32 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 2c73389..5a6ee6b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1292,45 +1292,6 @@ static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
 }
 
 /**
- * erased_sector_bitflips - count bit flips
- * @data:	data sector buffer
- * @oob:	oob buffer
- * @info:	omap_nand_info
- *
- * Check the bit flips in erased page falls below correctable level.
- * If falls below, report the page as erased with correctable bit
- * flip, else report as uncorrectable page.
- */
-static int erased_sector_bitflips(u_char *data, u_char *oob,
-		struct omap_nand_info *info)
-{
-	int flip_bits = 0, i;
-
-	for (i = 0; i < info->nand.ecc.size; i++) {
-		flip_bits += hweight8(~data[i]);
-		if (flip_bits > info->nand.ecc.strength)
-			return 0;
-	}
-
-	for (i = 0; i < info->nand.ecc.bytes - 1; i++) {
-		flip_bits += hweight8(~oob[i]);
-		if (flip_bits > info->nand.ecc.strength)
-			return 0;
-	}
-
-	/*
-	 * Bit flips falls in correctable level.
-	 * Fill data area with 0xFF
-	 */
-	if (flip_bits) {
-		memset(data, 0xFF, info->nand.ecc.size);
-		memset(oob, 0xFF, info->nand.ecc.bytes);
-	}
-
-	return flip_bits;
-}
-
-/**
  * omap_elm_correct_data - corrects page data area in case error reported
  * @mtd:	MTD device structure
  * @data:	page data
@@ -1359,14 +1320,16 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 			mtd);
+	enum omap_ecc ecc_opt	= info->ecc_opt;
 	int eccbytes	= info->nand.ecc.bytes;
-	int eccsteps = info->nand.ecc.steps;
+	int eccsize	= info->nand.ecc.size;
+	int eccstrength	= info->nand.ecc.strength;
+	int eccsteps	= info->nand.ecc.steps;
 	int i , j, stat = 0;
 	int eccflag, actual_eccbytes;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
-	u_char *erased_ecc_vec;
 	enum bch_ecc type;
 	bool is_error_reported = false;
 
@@ -1389,10 +1352,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 
 	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
 		type = BCH8_ECC;
-		erased_ecc_vec = bch8_vector;
 	} else {
 		type = BCH4_ECC;
-		erased_ecc_vec = bch4_vector;
 	}
 
 	for (i = 0; i < eccsteps ; i++) {
@@ -1436,19 +1397,35 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				is_error_reported = true;
 			} else {
 				/* Error reported in erased page */
-				int bitflip_count;
-				u_char *buf = &data[info->nand.ecc.size * i];
-
-				if (memcmp(calc_ecc, erased_ecc_vec,
-							 actual_eccbytes)) {
-					bitflip_count = erased_sector_bitflips(
-							buf, read_ecc, info);
-
-					if (bitflip_count)
-						stat += bitflip_count;
-					else
-						return -EINVAL;
+				/* check bit-flips in erased-pages
+				 * - Instead of comparing each byte of main-area
+				 *   with 0xff, comparing just calc_ecc[] with
+				 *   known ECC-syndrome-of-all(0xff). This
+				 *   confirms that main-area + OOB are all(0xff)
+				 *   This will save CPU cycles.
+				 * - Bit-flips in erased-page can't be corrected
+				 *   because there is no ECC present in OOB
+				 * - Irrespective of number of bit-flips an
+				 *   erased-page will only contain all(0xff),
+				 *   So its safe to return error-code -EUCLEAN
+				 *   with data_buf=0xff, instead of -EBADMSG
+				 * - And incrementing ecc_stat->corrected makes
+				 *   chip->read_page() return -EUCLEAN */
+				switch (ecc_opt) {
+				case OMAP_ECC_BCH4_CODE_HW:
+					if (memcmp(calc_ecc, bch4_vector,
+							 actual_eccbytes))
+						stat += eccstrength;
+					break;
+				case OMAP_ECC_BCH8_CODE_HW:
+					if (memcmp(calc_ecc, bch8_vector,
+							 actual_eccbytes))
+						stat += eccstrength;
+					break;
+				default:
+					return -EINVAL;
 				}
+				memset(&data[i * eccsize], 0xff, eccsize);
 			}
 		}
 
-- 
1.8.1
