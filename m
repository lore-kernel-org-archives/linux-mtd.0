Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd7S-0004vD-CX
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:02:07 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 08/15] mtd: nand: move Hynix specific init/detection logic
 in nand_hynix.c
Date: Wed,  8 Jun 2016 15:00:42 +0200
Message-Id: <1465390849-13199-9-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move Hynix specific initialization and detection logic into
nand_hynix.c. This is part of the "separate vendor specific code from
core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile     |   1 +
 drivers/mtd/nand/nand_base.c  | 108 ++++++++++--------------------------------
 drivers/mtd/nand/nand_hynix.c |  81 +++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand_ids.c   |   3 +-
 4 files changed, 110 insertions(+), 83 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_hynix.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 55a55d3..d79338f 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -58,4 +58,5 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_hynix.o
 nand-objs += nand_samsung.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a7c7ef3..69812fd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3590,85 +3590,32 @@ void nand_decode_ext_id(struct nand_chip *chip)
 	/* The 4th id byte is the important one */
 	extid = id_data[3];
 
+	/* Calc pagesize */
+	mtd->writesize = 1024 << (extid & 0x03);
+	extid >>= 2;
+	/* Calc oobsize */
+	mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
+	extid >>= 2;
+	/* Calc blocksize. Blocksize is multiples of 64KiB */
+	mtd->erasesize = (64 * 1024) << (extid & 0x03);
+	extid >>= 2;
+	/* Get buswidth information */
+	if (extid & 0x1)
+		chip->options |= NAND_BUSWIDTH_16;
+
 	/*
-	 * Field definitions are in the following datasheets:
-	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
-	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
-	 *
-	 * Check for ID length, non-zero 6th byte, cell type, and Hynix/Samsung
-	 * ID to decide what to do.
+	 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
+	 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
+	 * follows:
+	 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
+	 *                         110b -> 24nm
+	 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
 	 */
-	if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
-	    !nand_is_slc(chip)) {
-		unsigned int tmp;
-
-		/* Calc pagesize */
-		mtd->writesize = 2048 << (extid & 0x03);
-		extid >>= 2;
-		/* Calc oobsize */
-		switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
-		case 0:
-			mtd->oobsize = 128;
-			break;
-		case 1:
-			mtd->oobsize = 224;
-			break;
-		case 2:
-			mtd->oobsize = 448;
-			break;
-		case 3:
-			mtd->oobsize = 64;
-			break;
-		case 4:
-			mtd->oobsize = 32;
-			break;
-		case 5:
-			mtd->oobsize = 16;
-			break;
-		default:
-			mtd->oobsize = 640;
-			break;
-		}
-		extid >>= 2;
-		/* Calc blocksize */
-		tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
-		if (tmp < 0x03)
-			mtd->erasesize = (128 * 1024) << tmp;
-		else if (tmp == 0x03)
-			mtd->erasesize = 768 * 1024;
-		else
-			mtd->erasesize = (64 * 1024) << tmp;
-	} else {
-		/* Calc pagesize */
-		mtd->writesize = 1024 << (extid & 0x03);
-		extid >>= 2;
-		/* Calc oobsize */
-		mtd->oobsize = (8 << (extid & 0x01)) *
-			(mtd->writesize >> 9);
-		extid >>= 2;
-		/* Calc blocksize. Blocksize is multiples of 64KiB */
-		mtd->erasesize = (64 * 1024) << (extid & 0x03);
-		extid >>= 2;
-		/* Get buswidth information */
-		if (extid & 0x1)
-			chip->options |= NAND_BUSWIDTH_16;
-
-		/*
-		 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
-		 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
-		 * follows:
-		 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
-		 *                         110b -> 24nm
-		 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
-		 */
-		if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
-				nand_is_slc(chip) &&
-				(id_data[5] & 0x7) == 0x6 /* 24nm */ &&
-				!(id_data[4] & 0x80) /* !BENAND */) {
-			mtd->oobsize = 32 * mtd->writesize >> 9;
-		}
-
-	}
+	if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
+	    nand_is_slc(chip) &&
+	    (id_data[5] & 0x7) == 0x6 /* 24nm */ &&
+	     !(id_data[4] & 0x80) /* !BENAND */)
+		mtd->oobsize = 32 * mtd->writesize >> 9;
 }
 EXPORT_SYMBOL_GPL(nand_decode_ext_id);
 
@@ -3727,11 +3674,8 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
-	if (!nand_is_slc(chip) && maf_id == NAND_MFR_HYNIX)
-		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
-	else if ((nand_is_slc(chip) &&
-				(maf_id == NAND_MFR_HYNIX ||
-				 maf_id == NAND_MFR_TOSHIBA ||
+	if ((nand_is_slc(chip) &&
+				(maf_id == NAND_MFR_TOSHIBA ||
 				 maf_id == NAND_MFR_AMD ||
 				 maf_id == NAND_MFR_MACRONIX)) ||
 			(mtd->writesize == 2048 &&
diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
new file mode 100644
index 0000000..06c8e8b
--- /dev/null
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -0,0 +1,81 @@
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
+static void hynix_nand_decode_id(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/* Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22) */
+	if (chip->id.len == 6 && !nand_is_slc(chip)) {
+		u8 tmp, extid = chip->id.data[3];
+
+		/* Extract pagesize */
+		mtd->writesize = 2048 << (extid & 0x03);
+		extid >>= 2;
+
+		/* Extract oobsize */
+		switch (((extid >> 2) & 0x4) | (extid & 0x3)) {
+		case 0:
+			mtd->oobsize = 128;
+			break;
+		case 1:
+			mtd->oobsize = 224;
+			break;
+		case 2:
+			mtd->oobsize = 448;
+			break;
+		case 3:
+			mtd->oobsize = 64;
+			break;
+		case 4:
+			mtd->oobsize = 32;
+			break;
+		case 5:
+			mtd->oobsize = 16;
+			break;
+		default:
+			mtd->oobsize = 640;
+			break;
+		}
+
+		/* Extract blocksize */
+		extid >>= 2;
+		tmp = ((extid >> 1) & 0x04) | (extid & 0x03);
+		if (tmp < 0x03)
+			mtd->erasesize = (128 * 1024) << tmp;
+		else if (tmp == 0x03)
+			mtd->erasesize = 768 * 1024;
+		else
+			mtd->erasesize = (64 * 1024) << tmp;
+	} else {
+		nand_decode_ext_id(chip);
+	}
+}
+
+static int hynix_nand_init(struct nand_chip *chip)
+{
+	if (!nand_is_slc(chip))
+		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+	else
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops hynix_nand_manuf_ops = {
+	.detect = hynix_nand_decode_id,
+	.init = hynix_nand_init,
+};
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 5d2bef5..7bf93b8 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -167,6 +167,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 
 /* Manufacturer IDs */
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
+extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba"},
@@ -175,7 +176,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_NATIONAL, "National"},
 	{NAND_MFR_RENESAS, "Renesas"},
 	{NAND_MFR_STMICRO, "ST Micro"},
-	{NAND_MFR_HYNIX, "Hynix"},
+	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
 	{NAND_MFR_MICRON, "Micron"},
 	{NAND_MFR_AMD, "AMD/Spansion"},
 	{NAND_MFR_MACRONIX, "Macronix"},
-- 
2.7.4
