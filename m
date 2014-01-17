Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W43co-0000l9-TK
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 07:13:59 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v7 3/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix erased-page detection for BCHx_HW ECC schemes
Date: Fri, 17 Jan 2014 12:43:14 +0530
Message-ID: <1389942797-4632-4-git-send-email-pekon@ti.com>
In-Reply-To: <1389942797-4632-1-git-send-email-pekon@ti.com>
References: <1389942797-4632-1-git-send-email-pekon@ti.com>
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

As erased-pages do not have ECC stored in their OOB area, so they need to be
seperated out from programmed-pages, before doing BCH ECC correction.

In current implementation of omap_elm_correct_data() which does ECC correction
for BCHx ECC schemes, this erased-pages are detected based on specific marker
byte (reserved as 0x00) in ecc-layout.
However, this approach has some limitation like;
 1) All ecc-scheme layouts do not have such Reserved byte marker to
    differentiate between erased-page v/s programmed-page. Thus this is a
    customized solution.
 2) Reserved marker byte can itself be subjected to bit-flips causing
    erased-page to be misunderstood as programmed-page.

This patch removes dependency on any marker byte in ecc-layout, to differentiate
between erased-page v/s programeed-page. Instead a page is considered erased if
 (a) all(OOB)  == 0xff, .i.e., number of zero-bits in read_ecc[] == 0
 (b) number of zero-bits in (Data + OOB) is less than ecc-strength

This patch also adds a generic function count_zero_bits(), to find number of
bits which are '0' in given buffer. This function is optimized for comparing
read-data with 0xff.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 88 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 2c73389..f833fbb 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1331,6 +1331,30 @@ static int erased_sector_bitflips(u_char *data, u_char *oob,
 }
 
 /**
+ * count_zero_bits - count number of bit-flips in given buffer
+ * @buf:	pointer to buffer
+ * @length:	buffer length
+ * @max_bitflips: maximum number of correctable bit-flips (ecc.strength)
+ * $bitflip_count: pointer to store bit-flip count
+ *
+ * Counts number of bit-flips in given buffer, returns with error
+ * as soon as count exceeds max_bitflips limit.
+ */
+static int count_zero_bits(u_char *buf, int length,
+					 int max_bitflips, int *bitflip_count)
+{	int i;
+
+	for (i = 0; i < length; i++) {
+		if (unlikely(buf[i] != 0xff)) {
+			*bitflip_count += hweight8(~buf[i]);
+			if (unlikely(*bitflip_count > max_bitflips))
+				return -EBADMSG;
+		}
+	}
+	return 0;
+}
+
+/**
  * omap_elm_correct_data - corrects page data area in case error reported
  * @mtd:	MTD device structure
  * @data:	page data
@@ -1359,14 +1383,21 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 {
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 			mtd);
-	int eccbytes	= info->nand.ecc.bytes;
-	int eccsteps = info->nand.ecc.steps;
+	struct nand_ecc_ctrl *ecc = &info->nand.ecc;
+	int eccstrength		= ecc->strength;
+	int eccsize		= ecc->size;
+	int eccbytes		= ecc->bytes;
+	int eccsteps		= ecc->steps;
 	int i , j, stat = 0;
 	int eccflag, actual_eccbytes;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
 	u_char *erased_ecc_vec;
+	u_char *buf;
+	int bitflip_count;
+	int err;
+	bool page_is_erased;
 	enum bch_ecc type;
 	bool is_error_reported = false;
 
@@ -1410,24 +1441,47 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		}
 
 		if (eccflag == 1) {
-			/*
-			 * Set threshold to minimum of 4, half of ecc.strength/2
-			 * to allow max bit flip in byte to 4
-			 */
-			unsigned int threshold = min_t(unsigned int, 4,
-					info->nand.ecc.strength / 2);
+			bitflip_count = 0;
+			/* count zero-bits in OOB region */
+			err = count_zero_bits(read_ecc, eccbytes,
+						 eccstrength, &bitflip_count);
+			if (err) {
+				/*
+				 * number of zero-bits in OOB > ecc-strength
+				 * either un-correctable or programmed-page
+				 */
+				page_is_erased = false;
+			} else if (bitflip_count == 0) {
+				/* OOB == all(0xff) */
+				page_is_erased = true;
+			} else {
+				/*
+				 * OOB has some bits as '0' but
+				 * number of zero-bits in OOB < ecc-strength.
+				 * It may be erased-page with bit-flips so,
+				 * further checks are needed for confirmation
+				 */
+				/* count zero-bits in DATA region */
+				buf = &data[eccsize * i];
+				err = count_zero_bits(buf, eccsize,
+						 eccstrength, &bitflip_count);
+				if (err) {
+					/*
+					 * total number of zero-bits in OOB
+					 * and DATA exceeds ecc-strength
+					 */
+					page_is_erased = false;
+				} else {
+					/* number of zero-bits < ecc-strength */
+					page_is_erased = true;
+				}
+			}
 
 			/*
-			 * Check data area is programmed by counting
-			 * number of 0's at fixed offset in spare area.
-			 * Checking count of 0's against threshold.
-			 * In case programmed page expects at least threshold
-			 * zeros in byte.
-			 * If zeros are less than threshold for programmed page/
-			 * zeros are more than threshold erased page, either
-			 * case page reported as uncorrectable.
+			 * erased-pages do not have ECC stored in OOB area,
+			 * so they need to be handled separately.
 			 */
-			if (hweight8(~read_ecc[actual_eccbytes]) >= threshold) {
+			if (!page_is_erased) {
 				/*
 				 * Update elm error vector as
 				 * data area is programmed
-- 
1.8.1
