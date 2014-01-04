Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzHIZ-0004NN-06
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 02:49:18 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 6/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix programmed-page bit-flip correction logic
Date: Sat, 4 Jan 2014 08:18:18 +0530
Message-ID: <1388803698-26252-7-git-send-email-pekon@ti.com>
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

This patch updates following checks when bit-flips are detected by ELM:

 - Do not evaluate bit-flips when un-correctable bit-flips is reported by ELM,
   because as per [1] when ELM reports an un-correctable bit-flips,
   'number of error' field in its ELM_LOCATION_STATUS register is also invalid.

 - Return with error-code '-EBADMSG' on detection of un-correctable bit-flip.

 - Return with error-code '-EBADMSG' when bit-flips position is outside current
   Sector and OOB area.

[1] ELM IP spec Table-25 ELM_LOCATION_STATUS Register.
    ELM_LOCATION_STATUS[8] = ECC_CORRECTABLE: Error location process exit status
        0x0: ECC error location process failed.
             Number of errors and error locations are invalid.
        0x1: all errors were successfully located.
             Number of errors and error locations are valid.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 4cb08f4..c690721 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1309,6 +1309,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	bool page_is_erased;
 	u8 *buf;
 	int i , j, stat = 0;
+	int err = 0;
 	int eccflag, actual_eccbytes;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
@@ -1430,7 +1431,10 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	elm_decode_bch_error_page(info->elm_dev, ecc_vec, err_vec);
 
 	for (i = 0; i < eccsteps; i++) {
-		if (err_vec[i].error_reported) {
+		if (err_vec[i].error_uncorrectable) {
+			pr_err("nand: uncorrectable bit-flips found\n");
+			err = -EBADMSG;
+		} else if (err_vec[i].error_reported) {
 			for (j = 0; j < err_vec[i].error_count; j++) {
 				switch (ecc_opt) {
 				case OMAP_ECC_BCH4_CODE_HW:
@@ -1452,13 +1456,18 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				byte_pos = (error_max - pos - 1) / 8;
 
 				if (pos < error_max) {
+					pr_debug("fixed bit-flip @ [%d][%d]\n",
+							 byte_pos, bit_pos);
 					if (byte_pos < 512)
 						data[byte_pos] ^= 1 << bit_pos;
 					else
 						spare_ecc[byte_pos - 512] ^=
 							1 << bit_pos;
+				} else {
+					pr_err("invalid bit-flip @ [%d][%d]\n",
+							 byte_pos, bit_pos);
+					err = -EBADMSG;
 				}
-				/* else, not interested to correct ecc */
 			}
 		}
 
@@ -1470,12 +1479,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		spare_ecc += eccbytes;
 	}
 
-	for (i = 0; i < eccsteps; i++)
-		/* Return error if uncorrectable error present */
-		if (err_vec[i].error_uncorrectable)
-			return -EINVAL;
-
-	return stat;
+	return (err) ? err : stat;
 }
 
 /**
-- 
1.8.1
