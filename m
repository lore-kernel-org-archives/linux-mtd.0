Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VturV-0001UF-Ep
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:51:13 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 4/5] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 cleanup to make it scalable for future ecc-schemes
Date: Fri, 20 Dec 2013 13:20:19 +0530
Message-ID: <1387525820-25709-5-git-send-email-pekon@ti.com>
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

Current omap_elm_correct_data() code is not scalable for future ecc-schemes
due to presence of tweaks and hard-coded macros for BCH4_ECC and BCH8_ECC
ecc-schemes at multiple places.

This patch:
 - replaces 'ecc_opt' with '(info->nand.ecc.strength == BCH8_MAX_ERROR)
   used to differentiate between BCH8_HW and BCH4_SW
 - replaces macros (defining magic number for specific ecc-scheme) with
   generic variables
 - removes dependency on macros defined in elm.h (like BCHx_ECC_OOB_BYTES)

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 58a8b01..8d9c947 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -118,14 +118,9 @@
 
 #define OMAP24XX_DMA_GPMC		4
 
-#define BCH8_MAX_ERROR		8	/* upto 8 bit correctable */
-#define BCH4_MAX_ERROR		4	/* upto 4 bit correctable */
-
 #define SECTOR_BYTES		512
 /* 4 bit padding to make byte aligned, 56 = 52 + 4 */
 #define BCH4_BIT_PAD		4
-#define BCH8_ECC_MAX		((SECTOR_BYTES + BCH8_ECC_OOB_BYTES) * 8)
-#define BCH4_ECC_MAX		((SECTOR_BYTES + BCH4_ECC_OOB_BYTES) * 8)
 
 /* GPMC ecc engine settings for read */
 #define BCH_WRAPMODE_1		1	/* BCH wrap mode 1 */
@@ -1317,18 +1312,12 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
 	u_char *spare_ecc = read_ecc;
-	enum bch_ecc type;
 	bool is_error_reported = false;
+	u32 bit_pos, byte_pos, error_max, pos;
 
 	/* Initialize elm error vector to zero */
 	memset(err_vec, 0, sizeof(err_vec));
 
-	if (info->nand.ecc.strength == BCH8_MAX_ERROR) {
-		type = BCH8_ECC;
-	} else {
-		type = BCH4_ECC;
-	}
-
 	for (i = 0; i < eccsteps ; i++) {
 		eccflag = 0;	/* initialize eccflag */
 
@@ -1414,20 +1403,24 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	for (i = 0; i < eccsteps; i++) {
 		if (err_vec[i].error_reported) {
 			for (j = 0; j < err_vec[i].error_count; j++) {
-				u32 bit_pos, byte_pos, error_max, pos;
-
-				if (type == BCH8_ECC)
-					error_max = BCH8_ECC_MAX;
-				else
-					error_max = BCH4_ECC_MAX;
-
-				if (info->nand.ecc.strength == BCH8_MAX_ERROR)
-					pos = err_vec[i].error_loc[j];
-				else
-					/* Add 4 to take care 4 bit padding */
+				switch (ecc_opt) {
+				case OMAP_ECC_BCH4_CODE_HW:
+					/* omit  7th ECC byte reserved as 0x0 */
+					error_max =
+						 (eccsize + (eccbytes - 1)) * 8;
+					/* Add 4 bits to take care of padding */
 					pos = err_vec[i].error_loc[j] +
 						BCH4_BIT_PAD;
-
+					break;
+				case OMAP_ECC_BCH8_CODE_HW:
+					/* omit 14th ECC byte reserved as 0x0 */
+					error_max =
+						 (eccsize + (eccbytes - 1)) * 8;
+					pos = err_vec[i].error_loc[j];
+					break;
+				default:
+					return -EINVAL;
+				}
 				/* Calculate bit position of error */
 				bit_pos = pos % 8;
 
@@ -1449,7 +1442,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		stat += err_vec[i].error_count;
 
 		/* Update page data with sector size */
-		data += info->nand.ecc.size;
+		data += eccsize;
 		spare_ecc += eccbytes;
 	}
 
-- 
1.8.1
