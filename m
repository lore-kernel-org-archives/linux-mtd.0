Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W43cp-0000lC-DR
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 07:14:01 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v7 5/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 cleanup for future enhancements
Date: Fri, 17 Jan 2014 12:43:16 +0530
Message-ID: <1389942797-4632-6-git-send-email-pekon@ti.com>
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
 drivers/mtd/nand/omap2.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 78b7106..d0d9682 100644
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
@@ -1338,8 +1333,8 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	u_char *buf;
 	int bitflip_count;
 	int err;
+	u32 bit_pos, byte_pos, error_max, pos;
 	bool page_is_erased;
-	enum bch_ecc type;
 	bool is_error_reported = false;
 
 	switch (info->ecc_opt) {
@@ -1359,12 +1354,6 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
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
 
@@ -1451,20 +1440,19 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
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
+				switch (info->ecc_opt) {
+				case OMAP_ECC_BCH4_CODE_HW:
+					/* Add 4 bits to take care of padding */
 					pos = err_vec[i].error_loc[j] +
 						BCH4_BIT_PAD;
-
+					break;
+				case OMAP_ECC_BCH8_CODE_HW:
+					pos = err_vec[i].error_loc[j];
+					break;
+				default:
+					return -EINVAL;
+				}
+				error_max = (eccsize + actual_eccbytes) * 8;
 				/* Calculate bit position of error */
 				bit_pos = pos % 8;
 
@@ -1486,7 +1474,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		stat += err_vec[i].error_count;
 
 		/* Update page data with sector size */
-		data += info->nand.ecc.size;
+		data += eccsize;
 		spare_ecc += eccbytes;
 	}
 
-- 
1.8.1
