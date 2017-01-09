Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000En-0E
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
Subject: [PATCH v6 14/17] mtd: nand: Move Macronix specific initialization in
 nand_macronix.c
Date: Mon,  9 Jan 2017 11:04:21 +0100
Message-Id: <1483956264-3335-15-git-send-email-boris.brezillon@free-electrons.com>
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

Move Macronix specific initialization into nand_macronix.c. This is part
of the "separate vendor specific code from core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile        |  1 +
 drivers/mtd/nand/nand_base.c     | 11 -----------
 drivers/mtd/nand/nand_ids.c      |  2 +-
 drivers/mtd/nand/nand_macronix.c | 30 ++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h         |  1 +
 5 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_macronix.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f48ddcc132bc..098b8791f10a 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_amd.o
 nand-objs += nand_hynix.o
+nand-objs += nand_macronix.o
 nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
 nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e8f92047059d..41e667577cfc 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3802,23 +3802,12 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
 static void nand_decode_bbm_options(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	u8 *id_data = chip->id.data;
-	int maf_id = id_data[0];
 
 	/* Set the bad block position */
 	if (mtd->writesize > 512 || (chip->options & NAND_BUSWIDTH_16))
 		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
 	else
 		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
-
-	/*
-	 * Bad block marker is stored in the last page of each block on Samsung
-	 * and Hynix MLC devices; stored in first two pages of each block on
-	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
-	 * AMD/Spansion, and Macronix.  All others scan only the first page.
-	 */
-	if (nand_is_slc(chip) && maf_id == NAND_MFR_MACRONIX)
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
 static inline bool is_full_id_nand(struct nand_flash_dev *type)
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index d0914f356e1d..ca927bcce65e 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -180,7 +180,7 @@ static const struct nand_manufacturer nand_manufacturers[] = {
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
 	{NAND_MFR_MICRON, "Micron", &micron_nand_manuf_ops},
 	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
-	{NAND_MFR_MACRONIX, "Macronix"},
+	{NAND_MFR_MACRONIX, "Macronix", &macronix_nand_manuf_ops},
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_INTEL, "Intel"},
diff --git a/drivers/mtd/nand/nand_macronix.c b/drivers/mtd/nand/nand_macronix.c
new file mode 100644
index 000000000000..84855c3e1a02
--- /dev/null
+++ b/drivers/mtd/nand/nand_macronix.c
@@ -0,0 +1,30 @@
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
+static int macronix_nand_init(struct nand_chip *chip)
+{
+	if (nand_is_slc(chip))
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops macronix_nand_manuf_ops = {
+	.init = macronix_nand_init,
+};
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2fae29699eef..e865f3b7e7c5 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -1092,6 +1092,7 @@ extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
+extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 
 int nand_default_bbt(struct mtd_info *mtd);
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.7.4
