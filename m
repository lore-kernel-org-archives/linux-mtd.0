Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd7S-0004v9-CY
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:02:04 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 09/15] mtd: nand: move Toshiba specific init/detection
 logic in nand_toshiba.c
Date: Wed,  8 Jun 2016 15:00:43 +0200
Message-Id: <1465390849-13199-10-git-send-email-boris.brezillon@free-electrons.com>
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

Move Toshiba specific initialization and detection logic into
nand_toshiba.c. This is part of the "separate vendor specific code from
core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile       |  1 +
 drivers/mtd/nand/nand_base.c    | 19 ++--------------
 drivers/mtd/nand/nand_ids.c     |  3 ++-
 drivers/mtd/nand/nand_toshiba.c | 48 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+), 18 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_toshiba.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index d79338f..403e9a7 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -60,3 +60,4 @@ obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_hynix.o
 nand-objs += nand_samsung.o
+nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 69812fd..931aafb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3583,7 +3583,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
 void nand_decode_ext_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int extid, id_len = chip->id.len;
+	int extid;
 	u8 *id_data = chip->id.data;
 	/* The 3rd id byte holds MLC / multichip data */
 	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
@@ -3602,20 +3602,6 @@ void nand_decode_ext_id(struct nand_chip *chip)
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
 
@@ -3675,8 +3661,7 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
 	if ((nand_is_slc(chip) &&
-				(maf_id == NAND_MFR_TOSHIBA ||
-				 maf_id == NAND_MFR_AMD ||
+				(maf_id == NAND_MFR_AMD ||
 				 maf_id == NAND_MFR_MACRONIX)) ||
 			(mtd->writesize == 2048 &&
 			 maf_id == NAND_MFR_MICRON))
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 7bf93b8..2cc9d32 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -166,11 +166,12 @@ struct nand_flash_dev nand_flash_ids[] = {
 };
 
 /* Manufacturer IDs */
+extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 
 struct nand_manufacturers nand_manuf_ids[] = {
-	{NAND_MFR_TOSHIBA, "Toshiba"},
+	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
 	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
 	{NAND_MFR_FUJITSU, "Fujitsu"},
 	{NAND_MFR_NATIONAL, "National"},
diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
new file mode 100644
index 0000000..0e19f9d
--- /dev/null
+++ b/drivers/mtd/nand/nand_toshiba.c
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
-- 
2.7.4
