Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vturb-0001UI-9v
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:51:16 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 5/5] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix bit-flip correction logic
Date: Fri, 20 Dec 2013 13:20:20 +0530
Message-ID: <1387525820-25709-6-git-send-email-pekon@ti.com>
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
 drivers/mtd/nand/omap2.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 8d9c947..7ac9a7c 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1307,7 +1307,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	int eccstrength	= info->nand.ecc.strength;
 	int eccsteps	= info->nand.ecc.steps;
 	bool page_is_erased;
-	int i , j, stat = 0;
+	int i , j, stat = 0, err = 0;
 	int eccflag;
 	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
 	u_char *ecc_vec = calc_ecc;
@@ -1401,7 +1401,10 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
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
@@ -1428,13 +1431,18 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
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
 
@@ -1446,12 +1454,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
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
