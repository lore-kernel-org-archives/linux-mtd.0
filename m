Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFjzl-0001MG-RG
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 12:41:57 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 6/6] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 fix programmed-page bit-flip correction logic
Date: Tue, 18 Feb 2014 18:10:41 +0530
Message-ID: <1392727242-3556-7-git-send-email-pekon@ti.com>
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

Tested-by: Stefan Roese <sr@denx.de>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 3993cd2..05467c6 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1441,8 +1441,12 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 	/* Decode BCH error using ELM module */
 	elm_decode_bch_error_page(info->elm_dev, ecc_vec, err_vec);
 
+	err = 0;
 	for (i = 0; i < eccsteps; i++) {
-		if (err_vec[i].error_reported) {
+		if (err_vec[i].error_uncorrectable) {
+			pr_err("nand: uncorrectable bit-flips found\n");
+			err = -EBADMSG;
+		} else if (err_vec[i].error_reported) {
 			for (j = 0; j < err_vec[i].error_count; j++) {
 				switch (info->ecc_opt) {
 				case OMAP_ECC_BCH4_CODE_HW:
@@ -1464,13 +1468,22 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 				byte_pos = (error_max - pos - 1) / 8;
 
 				if (pos < error_max) {
-					if (byte_pos < 512)
+					if (byte_pos < 512) {
+						pr_debug("bitflip@dat[%d]=%x\n",
+						     byte_pos, data[byte_pos]);
 						data[byte_pos] ^= 1 << bit_pos;
-					else
+					} else {
+						pr_debug("bitflip@oob[%d]=%x\n",
+					             (byte_pos - 512),
+						     spare_ecc[byte_pos - 512]);
 						spare_ecc[byte_pos - 512] ^=
 							1 << bit_pos;
+					}
+				} else {
+					pr_err("invalid bit-flip @ %d:%d\n",
+							 byte_pos, bit_pos);
+					err = -EBADMSG;
 				}
-				/* else, not interested to correct ecc */
 			}
 		}
 
@@ -1482,12 +1495,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 		spare_ecc += ecc->bytes;
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
1.8.5.1.163.gd7aced9
