Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFjzd-0001MB-HK
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 12:41:52 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 3/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix erased-page detection for BCHx_HW ECC schemes
Date: Tue, 18 Feb 2014 18:10:38 +0530
Message-ID: <1392727242-3556-4-git-send-email-pekon@ti.com>
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

Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 89 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 4bf2f76d..19b891a 100644
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
+			if (*bitflip_count > max_bitflips)
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
@@ -1367,6 +1391,10 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
 	u_char *erased_ecc_vec;
+	u_char *buf;
+	int bitflip_count;
+	int err;
+	bool page_is_erased;
 	enum bch_ecc type;
 	bool is_error_reported = false;
 
@@ -1410,24 +1438,55 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		}
 
 		if (eccflag == 1) {
-			/*
-			 * Set threshold to minimum of 4, half of ecc.strength/2
-			 * to allow max bit flip in byte to 4
-			 */
-			unsigned int threshold = min_t(unsigned int, 4,
-					info->nand.ecc.strength / 2);
+			bitflip_count = 0;
+			buf = &data[ecc->size * i];
+			/* count zero-bits in OOB region */
+			err = count_zero_bits(read_ecc, ecc->bytes,
+						 ecc->strength, &bitflip_count);
+			if (err) {
+				/*
+				 * number of zero-bits in OOB > ecc-strength
+				 * either un-correctable or programmed-page
+				 */
+				page_is_erased = false;
+			} else if (bitflip_count == 0) {
+				/* OOB == all(0xff), so its an erased-page */
+				page_is_erased = true;
+				/* count bit-flips in DATA region */
+				err = count_zero_bits(buf, ecc->size,
+						 ecc->strength, &bitflip_count);
+				if (err)
+					pr_warn("nand: corrupt erased-page");
+			} else {
+				/*
+				 * OOB has some zero-bits but their count is
+				 * less than ecc-strength, So these can be
+				 * correctable bit-flips. Hence further checks
+				 * are required to identify erased-page.
+				 */
+				/* count zero-bits in DATA region */
+				err = count_zero_bits(buf, ecc->size,
+						 ecc->strength, &bitflip_count);
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
+			 * programmed and erased pages are handled differently:
+			 * programmed-page: bit-flips are detected and corrected
+			 *              and bit-flip count reported
+			 * erased-page: bit-flip count is reported to upper
+			 *              layer to decide appropriate action
 			 */
-			if (hweight8(~read_ecc[actual_eccbytes]) >= threshold) {
+			if (!page_is_erased) {
 				/*
 				 * Update elm error vector as
 				 * data area is programmed
-- 
1.8.5.1.163.gd7aced9
