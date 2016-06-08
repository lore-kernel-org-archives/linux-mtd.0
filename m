Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd79-0004r9-FB
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:01:44 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 12/15] mtd: nand: move Macronix specific initialization in
 nand_macronix.c
Date: Wed,  8 Jun 2016 15:00:46 +0200
Message-Id: <1465390849-13199-13-git-send-email-boris.brezillon@free-electrons.com>
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

Move Macronix specific initialization into nand_macronix.c. This is part
of the "separate vendor specific code from core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile        |  1 +
 drivers/mtd/nand/nand_base.c     | 11 -----------
 drivers/mtd/nand/nand_ids.c      |  3 ++-
 drivers/mtd/nand/nand_macronix.c | 27 +++++++++++++++++++++++++++
 4 files changed, 30 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_macronix.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 19d0cb8..19150d3 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_amd.o
 nand-objs += nand_hynix.o
+nand-objs += nand_macronix.o
 nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
 nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5fd8487..06b5abf 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3603,23 +3603,12 @@ static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
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
index 299b2b1..5bc347c 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -171,6 +171,7 @@ extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
+extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
@@ -182,7 +183,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
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
index 0000000..960ddc0
--- /dev/null
+++ b/drivers/mtd/nand/nand_macronix.c
@@ -0,0 +1,27 @@
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
-- 
2.7.4
