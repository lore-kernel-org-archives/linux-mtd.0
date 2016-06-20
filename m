Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEvUq-0003pd-G1
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 09:28:03 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Aleksei Mamlin <mamlinav@gmail.com>, valdis.kletnieks@vt.edu
Subject: [PATCH v3 12/16] mtd: nand: move AMD/Spansion specific init/detection
 logic in nand_amd.c
Date: Mon, 20 Jun 2016 11:26:58 +0200
Message-Id: <1466414822-18948-13-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466414822-18948-1-git-send-email-boris.brezillon@free-electrons.com>
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
---
 drivers/mtd/nand/Makefile    |  1 +
 drivers/mtd/nand/nand_amd.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand_base.c | 19 +-----------------
 drivers/mtd/nand/nand_ids.c  |  3 ++-
 4 files changed, 52 insertions(+), 19 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_amd.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f1bd008564b2..19d0cb8829a5 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_amd.o
 nand-objs += nand_hynix.o
 nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
diff --git a/drivers/mtd/nand/nand_amd.c b/drivers/mtd/nand/nand_amd.c
new file mode 100644
index 000000000000..3d7cc366ae9c
--- /dev/null
+++ b/drivers/mtd/nand/nand_amd.c
@@ -0,0 +1,48 @@
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
+	 if (chip->id.data[4] != 0x00 && chip->id.data[5] == 0x00 &&
+	     chip->id.data[6] == 0x00 && chip->id.data[7] == 0x00 &&
+	     mtd->writesize == 512) {
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
index 456812946acc..3d738845941c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3589,8 +3589,6 @@ EXPORT_SYMBOL_GPL(nand_decode_ext_id);
 static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	u8 *id_data = chip->id.data;
-	int maf_id = id_data[0];
 
 	mtd->erasesize = type->erasesize;
 	mtd->writesize = type->pagesize;
@@ -3598,19 +3596,6 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 
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
@@ -3636,9 +3621,7 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
-	if ((nand_is_slc(chip) &&
-				(maf_id == NAND_MFR_AMD ||
-				 maf_id == NAND_MFR_MACRONIX)))
+	if (nand_is_slc(chip) && maf_id == NAND_MFR_MACRONIX)
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 5d027879b3b0..299b2b14c080 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -170,6 +170,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
+extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
 
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
@@ -180,7 +181,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
 	{NAND_MFR_MICRON, "Micron", &micron_nand_manuf_ops},
-	{NAND_MFR_AMD, "AMD/Spansion"},
+	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
 	{NAND_MFR_MACRONIX, "Macronix"},
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_SANDISK, "SanDisk"},
-- 
2.7.4
