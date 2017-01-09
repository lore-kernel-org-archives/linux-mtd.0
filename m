Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000Em-0D
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:05:17 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/17] mtd: nand: Move AMD/Spansion specific init/detection
 logic in nand_amd.c
Date: Mon,  9 Jan 2017 11:04:20 +0100
Message-Id: <1483956264-3335-14-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Moving AMD/Spansion specific initialization/detection into nand_amd.c.
This is part of the "separate vendor specific code from core" cleanup
process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/Makefile    |  1 +
 drivers/mtd/nand/nand_amd.c  | 51 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand_base.c | 18 +---------------
 drivers/mtd/nand/nand_ids.c  |  2 +-
 include/linux/mtd/nand.h     |  1 +
 5 files changed, 55 insertions(+), 18 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_amd.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 11d743155810..f48ddcc132bc 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_amd.o
 nand-objs += nand_hynix.o
 nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
diff --git a/drivers/mtd/nand/nand_amd.c b/drivers/mtd/nand/nand_amd.c
new file mode 100644
index 000000000000..170403a3bfa8
--- /dev/null
+++ b/drivers/mtd/nand/nand_amd.c
@@ -0,0 +1,51 @@
+/*
+ * Copyright (C) 2017 Free Electrons
+ * Copyright (C) 2017 NextThing Co
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
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
+static void amd_nand_decode_id(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	nand_decode_ext_id(chip);
+
+	/*
+	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
+	 * some Spansion chips have erasesize that conflicts with size
+	 * listed in nand_ids table.
+	 * Data sheet (5 byte ID): Spansion S30ML-P ORNAND (p.39)
+	 */
+	if (chip->id.data[4] != 0x00 && chip->id.data[5] == 0x00 &&
+	    chip->id.data[6] == 0x00 && chip->id.data[7] == 0x00 &&
+	    mtd->writesize == 512) {
+		mtd->erasesize = 128 * 1024;
+		mtd->erasesize <<= ((chip->id.data[3] & 0x03) << 1);
+	}
+}
+
+static int amd_nand_init(struct nand_chip *chip)
+{
+	if (nand_is_slc(chip))
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops amd_nand_manuf_ops = {
+	.detect = amd_nand_decode_id,
+	.init = amd_nand_init,
+};
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index fe05191c952a..e8f92047059d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3785,8 +3785,6 @@ EXPORT_SYMBOL_GPL(nand_decode_ext_id);
 static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	u8 *id_data = chip->id.data;
-	int maf_id = id_data[0];
 
 	mtd->erasesize = type->erasesize;
 	mtd->writesize = type->pagesize;
@@ -3794,19 +3792,6 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	/* All legacy ID NAND are small-page, SLC */
 	chip->bits_per_cell = 1;
-
-	/*
-	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
-	 * some Spansion chips have erasesize that conflicts with size
-	 * listed in nand_ids table.
-	 * Data sheet (5 byte ID): Spansion S30ML-P ORNAND (p.39)
-	 */
-	if (maf_id == NAND_MFR_AMD && id_data[4] != 0x00 && id_data[5] == 0x00
-			&& id_data[6] == 0x00 && id_data[7] == 0x00
-			&& mtd->writesize == 512) {
-		mtd->erasesize = 128 * 1024;
-		mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
-	}
 }
 
 /*
@@ -3832,8 +3817,7 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
-	if (nand_is_slc(chip) &&
-	    (maf_id == NAND_MFR_AMD || maf_id == NAND_MFR_MACRONIX))
+	if (nand_is_slc(chip) && maf_id == NAND_MFR_MACRONIX)
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 7dd339c15d3e..d0914f356e1d 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -179,7 +179,7 @@ static const struct nand_manufacturer nand_manufacturers[] = {
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
 	{NAND_MFR_MICRON, "Micron", &micron_nand_manuf_ops},
-	{NAND_MFR_AMD, "AMD/Spansion"},
+	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
 	{NAND_MFR_MACRONIX, "Macronix"},
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_SANDISK, "SanDisk"},
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 545d562390c2..2fae29699eef 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1091,6 +1091,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
+extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
 
 int nand_default_bbt(struct mtd_info *mtd);
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.7.4
