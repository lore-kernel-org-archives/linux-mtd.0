Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh2CV-0002vy-PC
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 21:12:40 +0000
Received: by pacfv12 with SMTP id fv12so16980057pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 14:12:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Brian Norris <computersforpeace@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [RFC PATCH] mtd: nand: vf610_nfc: use nand_check_erased_ecc_chunk()
 helper
Date: Tue, 29 Sep 2015 14:11:56 -0700
Message-Id: <1443561116-139851-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
I forgot about this feedback. How does this patch look? Just compile tested.

 drivers/mtd/nand/vf610_nfc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 42dad8e4b26f..598faf655f5b 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -560,7 +560,6 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	u32 ecc_status_off = NFC_MAIN_AREA(0) + ECC_SRAM_ADDR + ECC_STATUS;
 	u8 ecc_status;
 	u8 ecc_count;
-	int flips;
 	int flips_threshold = nfc->chip.ecc.strength / 2;
 
 	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
@@ -577,16 +576,9 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	 * On an erased page, bit count (including OOB) should be zero or
 	 * at least less then half of the ECC strength.
 	 */
-	flips = count_written_bits(dat, nfc->chip.ecc.size, flips_threshold);
-	flips += count_written_bits(oob, mtd->oobsize, flips_threshold);
-
-	if (unlikely(flips > flips_threshold))
-		return -EINVAL;
-
-	/* Erased page. */
-	memset(dat, 0xff, nfc->chip.ecc.size);
-	memset(oob, 0xff, mtd->oobsize);
-	return flips;
+	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
+					   mtd->oobsize, NULL, 0,
+					   flips_threshold);
 }
 
 static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-- 
2.6.0.rc2.230.g3dd15c0
