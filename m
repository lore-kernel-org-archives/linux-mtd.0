Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cPQ5K-0005Ox-FU
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 08:41:25 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/15] mtd: nand: hynix: rework NAND ID decoding to extract
 more information
Date: Fri,  6 Jan 2017 09:40:25 +0100
Message-Id: <1483692026-19663-15-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483692026-19663-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483692026-19663-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current NAND ID detection in nand_hynix.c is not handling the
different scheme used by Hynix, thus forcing developers to add new
entries in the nand_ids table each time they want to support a new MLC
NAND.

Enhance the detection logic to handle all known formats. This does not
necessarily mean we are handling all the cases, but if new formats are
discovered, the code should evolve to take them into account instead of
adding more full-id entries in the nand_ids table.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_hynix.c | 228 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 209 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index fbd661688158..92b8e435776c 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -16,21 +16,56 @@
  */
 
 #include <linux/mtd/nand.h>
+#include <linux/sizes.h>
 
-static void hynix_nand_decode_id(struct nand_chip *chip)
+static bool hynix_nand_has_valid_jedecid(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 jedecid[6] = { };
+	int i = 0;
+
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);
+	for (i = 0; i < 5; i++)
+		jedecid[i] = chip->read_byte(mtd);
 
-	/* Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22) */
-	if (chip->id.len == 6 && !nand_is_slc(chip)) {
-		u8 tmp, extid = chip->id.data[3];
+	return !strcmp("JEDEC", jedecid);
+}
 
-		/* Extract pagesize */
-		mtd->writesize = 2048 << (extid & 0x03);
-		extid >>= 2;
+static void hynix_nand_extract_oobsize(struct nand_chip *chip,
+				       bool valid_jedecid)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 oobsize;
 
-		/* Extract oobsize */
-		switch (((extid >> 2) & 0x4) | (extid & 0x3)) {
+	oobsize = ((chip->id.data[3] >> 2) & 0x3) |
+		  ((chip->id.data[3] >> 4) & 0x4);
+
+	if (valid_jedecid) {
+		switch (oobsize) {
+		case 0:
+			mtd->oobsize = 2048;
+			break;
+		case 1:
+			mtd->oobsize = 1664;
+			break;
+		case 2:
+			mtd->oobsize = 1024;
+			break;
+		case 3:
+			mtd->oobsize = 640;
+			break;
+		default:
+			/*
+			 * We should never reach this case, but if that
+			 * happens, this probably means Hynix decided to use
+			 * a different extended ID format, and we should find
+			 * a way to support it.
+			 */
+			WARN(1, "Invalid OOB size");
+			break;
+		}
+	} else {
+		switch (oobsize) {
 		case 0:
 			mtd->oobsize = 128;
 			break;
@@ -49,23 +84,178 @@ static void hynix_nand_decode_id(struct nand_chip *chip)
 		case 5:
 			mtd->oobsize = 16;
 			break;
-		default:
+		case 6:
 			mtd->oobsize = 640;
 			break;
+		default:
+			/*
+			 * We should never reach this case, but if that
+			 * happens, this probably means Hynix decided to use
+			 * a different extended ID format, and we should find
+			 * a way to support it.
+			 */
+			WARN(1, "Invalid OOB size");
+			break;
 		}
+	}
+}
+
+static void hynix_nand_extract_ecc_requirements(struct nand_chip *chip,
+						bool valid_jedecid)
+{
+	u8 ecc_level = (chip->id.data[4] >> 4) & 0x7;
+
+	if (valid_jedecid) {
+		/* Reference: H27UCG8T2E datasheet */
+		chip->ecc_step_ds = 1024;
 
-		/* Extract blocksize */
-		extid >>= 2;
-		tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
-		if (tmp < 0x03)
-			mtd->erasesize = (128 * 1024) << tmp;
-		else if (tmp == 0x03)
-			mtd->erasesize = 768 * 1024;
-		else
-			mtd->erasesize = (64 * 1024) << tmp;
+		switch (ecc_level) {
+		case 0:
+			chip->ecc_step_ds = 0;
+			chip->ecc_strength_ds = 0;
+			break;
+		case 1:
+			chip->ecc_strength_ds = 4;
+			break;
+		case 2:
+			chip->ecc_strength_ds = 24;
+			break;
+		case 3:
+			chip->ecc_strength_ds = 32;
+			break;
+		case 4:
+			chip->ecc_strength_ds = 40;
+			break;
+		case 5:
+			chip->ecc_strength_ds = 50;
+			break;
+		case 6:
+			chip->ecc_strength_ds = 60;
+			break;
+		default:
+			/*
+			 * We should never reach this case, but if that
+			 * happens, this probably means Hynix decided to use
+			 * a different extended ID format, and we should find
+			 * a way to support it.
+			 */
+			WARN(1, "Invalid ECC requirements");
+		}
+	} else {
+		/*
+		 * The ECC requirements field meaning depends on the
+		 * NAND technology.
+		 */
+		u8 nand_tech = chip->id.data[5] & 0x3;
+
+		if (nand_tech < 3) {
+			/* > 26nm, reference: H27UBG8T2A datasheet */
+			if (ecc_level < 5) {
+				chip->ecc_step_ds = 512;
+				chip->ecc_strength_ds = 1 << ecc_level;
+			} else if (ecc_level < 7) {
+				if (ecc_level == 5)
+					chip->ecc_step_ds = 2048;
+				else
+					chip->ecc_step_ds = 2048;
+				chip->ecc_strength_ds = 24;
+			} else {
+				/*
+				 * We should never reach this case, but if that
+				 * happens, this probably means Hynix decided
+				 * to use a different extended ID format, and
+				 * we should find a way to support it.
+				 */
+				WARN(1, "Invalid ECC requirements");
+			}
+		} else {
+			/* <= 26nm, reference: H27UBG8T2B datasheet */
+			if (!ecc_level) {
+				chip->ecc_step_ds = 0;
+				chip->ecc_strength_ds = 0;
+			} else if (ecc_level < 5) {
+				chip->ecc_step_ds = 512;
+				chip->ecc_strength_ds = 1 << (ecc_level - 1);
+			} else {
+				chip->ecc_step_ds = 1024;
+				chip->ecc_strength_ds = 24 +
+							(8 * (ecc_level - 5));
+			}
+		}
+	}
+}
+
+static void hynix_nand_extract_scrambling_requirements(struct nand_chip *chip,
+						       bool valid_jedecid)
+{
+	u8 nand_tech;
+
+	/* We need scrambling on all TLC NANDs*/
+	if (chip->bits_per_cell > 2)
+		chip->options |= NAND_NEED_SCRAMBLING;
+
+	/* And on MLC NANDs with sub-3xnm process */
+	if (valid_jedecid) {
+		nand_tech = chip->id.data[5] >> 4;
+
+		/* < 3xnm */
+		if (nand_tech > 0)
+			chip->options |= NAND_NEED_SCRAMBLING;
 	} else {
+		nand_tech = chip->id.data[5] & 0x3;
+
+		/* < 32nm */
+		if (nand_tech > 2)
+			chip->options |= NAND_NEED_SCRAMBLING;
+	}
+}
+
+static void hynix_nand_decode_id(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	bool valid_jedecid;
+	u8 tmp;
+
+	/*
+	 * Exclude all SLC NANDs from this advanced detection scheme.
+	 * According to the ranges defined in several datasheets, it might
+	 * appear that even SLC NANDs could fall in this extended ID scheme.
+	 * If that the case rework the test to let SLC NANDs go through the
+	 * detection process.
+	 */
+	if (chip->id.len < 6 || nand_is_slc(chip)) {
 		nand_decode_ext_id(chip);
+		return;
 	}
+
+	/* Extract pagesize */
+	mtd->writesize = 2048 << (chip->id.data[3] & 0x03);
+
+	tmp = (chip->id.data[3] >> 4) & 0x3;
+	/*
+	 * When bit7 is set that means we start counting at 1MiB, otherwise
+	 * we start counting at 128KiB and shift this value the content of
+	 * ID[3][4:5].
+	 * The only exception is when ID[3][4:5] == 3 and ID[3][7] == 0, in
+	 * this case the erasesize is set to 768KiB.
+	 */
+	if (chip->id.data[3] & 0x80)
+		mtd->erasesize = SZ_1M << tmp;
+	else if (tmp == 3)
+		mtd->erasesize = SZ_512K + SZ_256K;
+	else
+		mtd->erasesize = SZ_128K << tmp;
+
+	/*
+	 * Modern Toggle DDR NANDs have a valid JEDECID even though they are
+	 * not exposing a valid JEDEC parameter table.
+	 * These NANDs use a different NAND ID scheme.
+	 */
+	valid_jedecid = hynix_nand_has_valid_jedecid(chip);
+
+	hynix_nand_extract_oobsize(chip, valid_jedecid);
+	hynix_nand_extract_ecc_requirements(chip, valid_jedecid);
+	hynix_nand_extract_scrambling_requirements(chip, valid_jedecid);
 }
 
 static int hynix_nand_init(struct nand_chip *chip)
-- 
2.7.4
