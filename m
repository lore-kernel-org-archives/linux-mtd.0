Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VturT-0001U8-Nd
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:51:13 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 3/5] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix erased-pages and bit-flips detection for H/W ECC schemes
Date: Fri, 20 Dec 2013 13:20:18 +0530
Message-ID: <1387525820-25709-4-git-send-email-pekon@ti.com>
In-Reply-To: <1387525820-25709-1-git-send-email-pekon@ti.com>
References: <1387525820-25709-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: avinashphilipk@gmail.com, Felipe Balbi <balbi@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
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
 - omap_elm_correct_data()	for BCHx_HW ecc-schemes

Current implementation of omap_elm_correct_data() has some issues:
 a) It depends on a specific byte-position in OOB area (reserved as 0x00)
    to differentiate between programmed-pages v/s erased-pages.
    Problem-1: reserved byte-position cannot be accomodated in all ecc-schemes
    Problem-2: reserved byte-position can itself be subjected upto 8 bit-flips
               causing the 0xff to become 0x00, causing page to be
               mis-recognized as erased-page.

 b) Bit-flips in erased-pages are detected by comparing each byte of Data & OOB
    with 0xff in check_erased_page().
    Problem-3: This is causes performance penalty when erased-pages are checked.

This patch optimizes omap_elm_correct_data() in following ways:
 - Removes dependency on specific reserved-byte (0x00) in OOB area
   instead identifies erased-pages based on (1).
 - Removes check_erased_page() instead bit-flips in erased-page are
   detected based on (2)
 - If bit-flips are detected in erased-page then corrective action
   is taken based on (3), (4) and (5).

(1) A page can be assumed 'erased' only if its OOB == all(0xff).
  - However an abrupt termination of page programming
   (e.g. power failure) may result in partial write, corrupting
    only main area. But such data should not be trusted so NAND
    driver should indicate upper-layers to re-erase such page.

(2) Instead of comparing each byte of main-area with 0xff, just compare
    calc_ecc[] with known ECC-syndromp-of-all(0xff). This confirms that
    both main-area + OOB are all(0xff). This will save CPU cycles.

(3) Bit-flips in erased-page can't be corrected because there is no ECC
    present in OOB

(4) Irrespective of number of bit-flips an erased-page will only contain
    all(0xff),So its safe to return error-code -EUCLEAN with data_buf=0xff,
    instead of -EBADMSG

(5) And incrementing ecc_stat->corrected makes chip->read_page() return -EUCLEAN

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 159 ++++++++++++++++++-----------------------------
 1 file changed, 59 insertions(+), 100 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 0fefff9..58a8b01 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1292,81 +1292,31 @@ static int omap3_calculate_ecc_bch(struct mtd_info *mtd, const u_char *dat,
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
+ *		- bit-flips in data or oob region
+ *		- erased page, where no ECC is written in OOB area
  */
 static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				u_char *read_ecc, u_char *calc_ecc)
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 			mtd);
+	enum omap_ecc ecc_opt	= info->ecc_opt;
+	int eccsize	= info->nand.ecc.size;
 	int eccbytes	= info->nand.ecc.bytes;
-	int eccsteps = info->nand.ecc.steps;
+	int eccstrength	= info->nand.ecc.strength;
+	int eccsteps	= info->nand.ecc.steps;
+	bool page_is_erased;
 	int i , j, stat = 0;
 	int eccflag;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
-	u_char *erased_ecc_vec;
 	enum bch_ecc type;
 	bool is_error_reported = false;
 
@@ -1375,10 +1325,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 
 	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
 		type = BCH8_ECC;
-		erased_ecc_vec = bch8_vector;
 	} else {
 		type = BCH4_ECC;
-		erased_ecc_vec = bch4_vector;
 	}
 
 	for (i = 0; i < eccsteps ; i++) {
@@ -1397,46 +1345,57 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 			}
 		}
 
-		if (eccflag == 1) {
-			/*
-			 * Set threshold to minimum of 4, half of ecc.strength/2
-			 * to allow max bit flip in byte to 4
-			 */
-			unsigned int threshold = min_t(unsigned int, 4,
-					info->nand.ecc.strength / 2);
-
-			/*
-			 * Check data area is programmed by counting
-			 * number of 0's at fixed offset in spare area.
-			 * Checking count of 0's against threshold.
-			 * In case programmed page expects at least threshold
-			 * zeros in byte.
-			 * If zeros are less than threshold for programmed page/
-			 * zeros are more than threshold erased page, either
-			 * case page reported as uncorrectable.
-			 */
-			if (hweight8(~read_ecc[eccbytes - 1]) >= threshold) {
-				/*
-				 * Update elm error vector as
-				 * data area is programmed
-				 */
-				err_vec[i].error_reported = true;
-				is_error_reported = true;
-			} else {
-				/* Error reported in erased page */
-				int bitflip_count;
-				u_char *buf = &data[info->nand.ecc.size * i];
-
-				if (memcmp(calc_ecc, erased_ecc_vec,
-							 (eccbytes - 1))) {
-					bitflip_count = erased_sector_bitflips(
-							buf, read_ecc, info);
-
-					if (bitflip_count)
-						stat += bitflip_count;
-					else
-						return -EINVAL;
+		/* A page can be assumed 'erased' only if read_ecc == all(0xff).
+		 * However an abrupt termination of page programming
+		 * (e.g. power failure) may result in partial write, corrupting
+		 * only main area. But such data should not be trusted so NAND
+		 * driver should indicate upper-layers to re-erase the page */
+		if (eccflag) {
+			/* check if OOB is all(0xff) */
+			page_is_erased = true;
+			for (j = 0; j < (eccbytes - 1) && page_is_erased; j++) {
+				if (read_ecc[j] != 0xff)
+					page_is_erased = false;
+			}
+			if (page_is_erased) {
+				/* check bit-flips in erased-pages */
+				/* - Instead of comparing each byte of main-area
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
+					/* omit  7th ECC byte reserved as 0x0 */
+					if (memcmp(calc_ecc, bch4_vector,
+								 eccbytes - 1))
+						stat += eccstrength;
+					break;
+				case OMAP_ECC_BCH8_CODE_HW:
+					/* omit 14th ECC byte reserved as 0x0 */
+					if (memcmp(calc_ecc, bch8_vector,
+								 eccbytes - 1))
+						stat += eccstrength;
+					break;
+				default:
+					return -EINVAL;
 				}
+				memset(&data[i * eccsize], 0xff, eccsize);
+			} else {
+				/* OOB != 0xff means either
+				 * - page is programmed OR
+				 * - OOB has bit-flips
+				 * in either cases go fix the bit-flips */
+				is_error_reported		= true;
+				err_vec[i].error_reported	= true;
 			}
 		}
 
-- 
1.8.1
