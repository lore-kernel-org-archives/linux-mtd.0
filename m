Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFjzd-0001MC-HM
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 12:41:52 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 4/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 remove redundant bit-flip counting for erased-page
Date: Tue, 18 Feb 2014 18:10:39 +0530
Message-ID: <1392727242-3556-5-git-send-email-pekon@ti.com>
In-Reply-To: <1392727242-3556-1-git-send-email-pekon@ti.com>
References: <1392727242-3556-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch:
 - Removes erased_sector_bitflips() as counting of bit-flips is handled by
   count_zero_bits() in more optimized way.
   And count of bit-flips in both OOB and DATA region is anyways required for
   correct identification of erased-pages.

 - read-buffer is pre-filled with 0xff when an erased-page is detected, as
   erased-page can only contain 0xff bytes.

 - Removes static arrays bch8_vector[] and bch4_vector, which stores
   ECC signature with all(0xff) bytes.

Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 87 +++++-------------------------------------------
 1 file changed, 8 insertions(+), 79 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 19b891a..5171e46 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -141,11 +141,6 @@
 
 #define BADBLOCK_MARKER_LENGTH		2
 
-#ifdef CONFIG_MTD_NAND_OMAP_BCH
-static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
-	0xac, 0x6b, 0xff, 0x99, 0x7b};
-static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
-#endif
 
 /* oob info generated runtime depending on ecc algorithm and layout selected */
 static struct nand_ecclayout omap_oobinfo;
@@ -1292,45 +1287,6 @@ static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
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
  * count_zero_bits - count number of bit-flips in given buffer
  * @buf:	pointer to buffer
  * @length:	buffer length
@@ -1359,24 +1315,10 @@ static int count_zero_bits(u_char *buf, int length,
  * @mtd:	MTD device structure
  * @data:	page data
  * @read_ecc:	ecc read from nand flash
- * @calc_ecc:	ecc read from HW ECC registers
- *
- * Calculated ecc vector reported as zero in case of non-error pages.
- * In case of error/erased pages non-zero error vector is reported.
- * In case of non-zero ecc vector, check read_ecc at fixed offset
- * (x = 13/7 in case of BCH8/4 == 0) to find page programmed or not.
- * To handle bit flips in this data, count the number of 0's in
- * read_ecc[x] and check if it greater than 4. If it is less, it is
- * programmed page, else erased page.
- *
- * 1. If page is erased, check with standard ecc vector (ecc vector
- * for erased page to find any bit flip). If check fails, bit flip
- * is present in erased page. Count the bit flips in erased page and
- * if it falls under correctable level, report page with 0xFF and
- * update the correctable bit information.
- * 2. If error is reported on programmed page, update elm error
- * vector and correct the page with ELM error correction routine.
- *
+ * @calc_ecc:	ecc calculated after reading Data and OOB regions from flash
+ *		calc_ecc would be non-zero only in following cases:
+ *		- its a programmed-page with bit-flips
+ *		- its an erased-page (may or may not have bit-flips)
  */
 static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				u_char *read_ecc, u_char *calc_ecc)
@@ -1390,7 +1332,6 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
-	u_char *erased_ecc_vec;
 	u_char *buf;
 	int bitflip_count;
 	int err;
@@ -1417,10 +1358,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 
 	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
 		type = BCH8_ECC;
-		erased_ecc_vec = bch8_vector;
 	} else {
 		type = BCH4_ECC;
-		erased_ecc_vec = bch4_vector;
 	}
 
 	for (i = 0; i < eccsteps ; i++) {
@@ -1494,20 +1433,10 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				err_vec[i].error_reported = true;
 				is_error_reported = true;
 			} else {
-				/* Error reported in erased page */
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
-				}
+				/* report bit-flips found in erased-page */
+				stat += bitflip_count;
+				/* return clean read-buffer */
+				memset(buf, 0xff, ecc->size);
 			}
 		}
 
-- 
1.8.5.1.163.gd7aced9
