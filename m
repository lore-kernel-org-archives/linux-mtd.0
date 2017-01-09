Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000Eh-08
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:05:13 +0000
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
Subject: [PATCH v6 11/17] mtd: nand: Move Toshiba specific init/detection
 logic in nand_toshiba.c
Date: Mon,  9 Jan 2017 11:04:18 +0100
Message-Id: <1483956264-3335-12-git-send-email-boris.brezillon@free-electrons.com>
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

Move Toshiba specific initialization and detection logic into
nand_toshiba.c. This is part of the "separate vendor specific code from
core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/Makefile       |  1 +
 drivers/mtd/nand/nand_base.c    | 19 ++-------------
 drivers/mtd/nand/nand_ids.c     |  2 +-
 drivers/mtd/nand/nand_toshiba.c | 51 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h        |  1 +
 5 files changed, 56 insertions(+), 18 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_toshiba.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index ddb2670d9767..7c059822f479 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -63,3 +63,4 @@ obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_hynix.o
 nand-objs += nand_samsung.o
+nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3b15a1cd39bc..02bffe47c311 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3782,7 +3782,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
 void nand_decode_ext_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int extid, id_len = chip->id.len;
+	int extid;
 	u8 *id_data = chip->id.data;
 	/* The 3rd id byte holds MLC / multichip data */
 	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
@@ -3801,20 +3801,6 @@ void nand_decode_ext_id(struct nand_chip *chip)
 	/* Get buswidth information */
 	if (extid & 0x1)
 		chip->options |= NAND_BUSWIDTH_16;
-
-	/*
-	 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
-	 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
-	 * follows:
-	 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
-	 *                         110b -> 24nm
-	 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
-	 */
-	if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
-	    nand_is_slc(chip) &&
-	    (id_data[5] & 0x7) == 0x6 /* 24nm */ &&
-	     !(id_data[4] & 0x80) /* !BENAND */)
-		mtd->oobsize = 32 * mtd->writesize >> 9;
 }
 EXPORT_SYMBOL_GPL(nand_decode_ext_id);
 
@@ -3874,8 +3860,7 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
 	if ((nand_is_slc(chip) &&
-	     (maf_id == NAND_MFR_TOSHIBA || maf_id == NAND_MFR_AMD ||
-	      maf_id == NAND_MFR_MACRONIX)) ||
+	     (maf_id == NAND_MFR_AMD || maf_id == NAND_MFR_MACRONIX)) ||
 	    (mtd->writesize == 2048 && maf_id == NAND_MFR_MICRON))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 3d0bcf1e1965..7adab884038e 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -170,7 +170,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 
 /* Manufacturer IDs */
 static const struct nand_manufacturer nand_manufacturers[] = {
-	{NAND_MFR_TOSHIBA, "Toshiba"},
+	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
 	{NAND_MFR_ESMT, "ESMT"},
 	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
new file mode 100644
index 000000000000..fa787ba38dcd
--- /dev/null
+++ b/drivers/mtd/nand/nand_toshiba.c
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
+static void toshiba_nand_decode_id(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	nand_decode_ext_id(chip);
+
+	/*
+	 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
+	 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
+	 * follows:
+	 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
+	 *                         110b -> 24nm
+	 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
+	 */
+	if (chip->id.len >= 6 && nand_is_slc(chip) &&
+	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
+	    !(chip->id.data[4] & 0x80) /* !BENAND */)
+		mtd->oobsize = 32 * mtd->writesize >> 9;
+}
+
+static int toshiba_nand_init(struct nand_chip *chip)
+{
+	if (nand_is_slc(chip))
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops toshiba_nand_manuf_ops = {
+	.detect = toshiba_nand_decode_id,
+	.init = toshiba_nand_init,
+};
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index a07ee03de4fd..3868999e76d5 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1107,6 +1107,7 @@ nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
 
 extern struct nand_flash_dev nand_flash_ids[];
 
+extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 
-- 
2.7.4
