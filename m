Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOOjO-0006MP-Qm
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 13:02:33 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/15] mtd: nand: move Samsung specific init/detection
 logic in nand_samsung.c
Date: Tue,  3 Jan 2017 14:01:27 +0100
Message-Id: <1483448495-31607-8-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move Samsung specific initialization and detection logic into
nand_samsung.c. This is part of the "separate vendor specific code from
core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile       |  1 +
 drivers/mtd/nand/nand_base.c    | 52 ++----------------------
 drivers/mtd/nand/nand_ids.c     |  6 ++-
 drivers/mtd/nand/nand_samsung.c | 89 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 50 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_samsung.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index bfd5d12b9ade..d4b90b0f879e 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -61,3 +61,4 @@ obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_samsung.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f80faa57984..0f0fa13e9448 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3792,48 +3792,13 @@ void nand_decode_ext_id(struct nand_chip *chip)
 	/*
 	 * Field definitions are in the following datasheets:
 	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
-	 * New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44)
 	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
 	 *
 	 * Check for ID length, non-zero 6th byte, cell type, and Hynix/Samsung
 	 * ID to decide what to do.
 	 */
-	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
-			!nand_is_slc(chip) && id_data[5] != 0x00) {
-		/* Calc pagesize */
-		mtd->writesize = 2048 << (extid & 0x03);
-		extid >>= 2;
-		/* Calc oobsize */
-		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
-		case 1:
-			mtd->oobsize = 128;
-			break;
-		case 2:
-			mtd->oobsize = 218;
-			break;
-		case 3:
-			mtd->oobsize = 400;
-			break;
-		case 4:
-			mtd->oobsize = 436;
-			break;
-		case 5:
-			mtd->oobsize = 512;
-			break;
-		case 6:
-			mtd->oobsize = 640;
-			break;
-		case 7:
-		default: /* Other cases are "reserved" (unknown) */
-			mtd->oobsize = 1024;
-			break;
-		}
-		extid >>= 2;
-		/* Calc blocksize */
-		mtd->erasesize = (128 * 1024) <<
-			(((extid >> 1) & 0x04) | (extid & 0x03));
-	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
-			!nand_is_slc(chip)) {
+	if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
+	    !nand_is_slc(chip)) {
 		unsigned int tmp;
 
 		/* Calc pagesize */
@@ -3961,13 +3926,10 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
-	if (!nand_is_slc(chip) &&
-			(maf_id == NAND_MFR_SAMSUNG ||
-			 maf_id == NAND_MFR_HYNIX))
+	if (!nand_is_slc(chip) && maf_id == NAND_MFR_HYNIX)
 		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
 	else if ((nand_is_slc(chip) &&
-				(maf_id == NAND_MFR_SAMSUNG ||
-				 maf_id == NAND_MFR_HYNIX ||
+				(maf_id == NAND_MFR_HYNIX ||
 				 maf_id == NAND_MFR_TOSHIBA ||
 				 maf_id == NAND_MFR_AMD ||
 				 maf_id == NAND_MFR_MACRONIX)) ||
@@ -4149,12 +4111,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	/* Get chip options */
 	chip->options |= type->options;
 
-	/*
-	 * Check if chip is not a Samsung device. Do not clear the
-	 * options for chips which do not have an extended id.
-	 */
-	if (maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
-		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
 ident_done:
 
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index b3a332f37e14..05e9366696c9 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -10,7 +10,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/sizes.h>
 
-#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
+#define LP_OPTIONS 0
 #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
 #define SP_OPTIONS NAND_NEED_READRDY
@@ -169,10 +169,12 @@ struct nand_flash_dev nand_flash_ids[] = {
 };
 
 /* Manufacturer IDs */
+extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
+
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba"},
 	{NAND_MFR_ESMT, "ESMT"},
-	{NAND_MFR_SAMSUNG, "Samsung"},
+	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
 	{NAND_MFR_NATIONAL, "National"},
 	{NAND_MFR_RENESAS, "Renesas"},
diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
new file mode 100644
index 000000000000..863be01a2232
--- /dev/null
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright (C) 2013 Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/mtd/nand.h>
+
+static void samsung_nand_decode_id(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/* New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44) */
+	if (chip->id.len == 6 && !nand_is_slc(chip) &&
+	    chip->id.data[5] != 0x00) {
+		u8 extid = chip->id.data[3];
+
+		/* Get pagesize */
+		mtd->writesize = 2048 << (extid & 0x03);
+
+		extid >>= 2;
+
+		/* Get oobsize */
+		switch (((extid >> 2) & 0x4) | (extid & 0x3)) {
+		case 1:
+			mtd->oobsize = 128;
+			break;
+		case 2:
+			mtd->oobsize = 218;
+			break;
+		case 3:
+			mtd->oobsize = 400;
+			break;
+		case 4:
+			mtd->oobsize = 436;
+			break;
+		case 5:
+			mtd->oobsize = 512;
+			break;
+		case 6:
+			mtd->oobsize = 640;
+			break;
+		default:
+			/*
+			 * We should never reach this case, but if that
+			 * happens, this probably means Samsung decided to use
+			 * a different extended ID format, and we should find
+			 * a way to support it.
+			 */
+			WARN(1, "Invalid OOB size value");
+			break;
+		}
+
+		/* Get blocksize */
+		extid >>= 2;
+		mtd->erasesize = (128 * 1024) <<
+				 (((extid >> 1) & 0x04) | (extid & 0x03));
+	} else {
+		nand_decode_ext_id(chip);
+	}
+}
+
+static int samsung_nand_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	if (mtd->writesize > 512)
+		chip->options |= NAND_SAMSUNG_LP_OPTIONS;
+
+	if (!nand_is_slc(chip))
+		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+	else
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops samsung_nand_manuf_ops = {
+	.detect = samsung_nand_decode_id,
+	.init = samsung_nand_init,
+};
-- 
2.7.4
