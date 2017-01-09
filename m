Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000Eg-01
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
Subject: [PATCH v6 12/17] mtd: nand: Move Micron specific init logic in
 nand_micron.c
Date: Mon,  9 Jan 2017 11:04:19 +0100
Message-Id: <1483956264-3335-13-git-send-email-boris.brezillon@free-electrons.com>
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

Move Micron specific initialization logic into nand_micron.c. This is
part of the "separate vendor specific code from core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/Makefile      |  1 +
 drivers/mtd/nand/nand_base.c   | 32 +---------------
 drivers/mtd/nand/nand_ids.c    |  2 +-
 drivers/mtd/nand/nand_micron.c | 86 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h       | 21 +----------
 5 files changed, 91 insertions(+), 51 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_micron.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 7c059822f479..11d743155810 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -62,5 +62,6 @@ obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_hynix.o
+nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
 nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 02bffe47c311..fe05191c952a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3500,30 +3500,6 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	return ret;
 }
 
-static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
-
-	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
-			feature);
-}
-
-/*
- * Configure chip properties from Micron vendor-specific ONFI table
- */
-static void nand_onfi_detect_micron(struct nand_chip *chip,
-		struct nand_onfi_params *p)
-{
-	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
-
-	if (le16_to_cpu(p->vendor_revision) < 1)
-		return;
-
-	chip->read_retries = micron->read_retry_options;
-	chip->setup_read_retry = nand_setup_read_retry_micron;
-}
-
 /*
  * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 otherwise.
  */
@@ -3620,9 +3596,6 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
-	if (p->jedec_id == NAND_MFR_MICRON)
-		nand_onfi_detect_micron(chip, p);
-
 	return 1;
 }
 
@@ -3859,9 +3832,8 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 * Micron devices with 2KiB pages and on SLC Samsung, Hynix, Toshiba,
 	 * AMD/Spansion, and Macronix.  All others scan only the first page.
 	 */
-	if ((nand_is_slc(chip) &&
-	     (maf_id == NAND_MFR_AMD || maf_id == NAND_MFR_MACRONIX)) ||
-	    (mtd->writesize == 2048 && maf_id == NAND_MFR_MICRON))
+	if (nand_is_slc(chip) &&
+	    (maf_id == NAND_MFR_AMD || maf_id == NAND_MFR_MACRONIX))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 7adab884038e..7dd339c15d3e 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -178,7 +178,7 @@ static const struct nand_manufacturer nand_manufacturers[] = {
 	{NAND_MFR_RENESAS, "Renesas"},
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_HYNIX, "Hynix", &hynix_nand_manuf_ops},
-	{NAND_MFR_MICRON, "Micron"},
+	{NAND_MFR_MICRON, "Micron", &micron_nand_manuf_ops},
 	{NAND_MFR_AMD, "AMD/Spansion"},
 	{NAND_MFR_MACRONIX, "Macronix"},
 	{NAND_MFR_EON, "Eon"},
diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
new file mode 100644
index 000000000000..877011069251
--- /dev/null
+++ b/drivers/mtd/nand/nand_micron.c
@@ -0,0 +1,86 @@
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
+struct nand_onfi_vendor_micron {
+	u8 two_plane_read;
+	u8 read_cache;
+	u8 read_unique_id;
+	u8 dq_imped;
+	u8 dq_imped_num_settings;
+	u8 dq_imped_feat_addr;
+	u8 rb_pulldown_strength;
+	u8 rb_pulldown_strength_feat_addr;
+	u8 rb_pulldown_strength_num_settings;
+	u8 otp_mode;
+	u8 otp_page_start;
+	u8 otp_data_prot_addr;
+	u8 otp_num_pages;
+	u8 otp_feat_addr;
+	u8 read_retry_options;
+	u8 reserved[72];
+	u8 param_revision;
+} __packed;
+
+static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
+
+	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_READ_RETRY,
+				       feature);
+}
+
+/*
+ * Configure chip properties from Micron vendor-specific ONFI table
+ */
+static int micron_nand_onfi_init(struct nand_chip *chip)
+{
+	struct nand_onfi_params *p = &chip->onfi_params;
+	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
+
+	if (!chip->onfi_version)
+		return 0;
+
+	if (le16_to_cpu(p->vendor_revision) < 1)
+		return 0;
+
+	chip->read_retries = micron->read_retry_options;
+	chip->setup_read_retry = micron_nand_setup_read_retry;
+
+	return 0;
+}
+
+static int micron_nand_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+
+	ret = micron_nand_onfi_init(chip);
+	if (ret)
+		return ret;
+
+	if (mtd->writesize == 2048)
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops micron_nand_manuf_ops = {
+	.init = micron_nand_init,
+};
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3868999e76d5..545d562390c2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -366,26 +366,6 @@ struct onfi_ext_param_page {
 	 */
 } __packed;
 
-struct nand_onfi_vendor_micron {
-	u8 two_plane_read;
-	u8 read_cache;
-	u8 read_unique_id;
-	u8 dq_imped;
-	u8 dq_imped_num_settings;
-	u8 dq_imped_feat_addr;
-	u8 rb_pulldown_strength;
-	u8 rb_pulldown_strength_feat_addr;
-	u8 rb_pulldown_strength_num_settings;
-	u8 otp_mode;
-	u8 otp_page_start;
-	u8 otp_data_prot_addr;
-	u8 otp_num_pages;
-	u8 otp_feat_addr;
-	u8 read_retry_options;
-	u8 reserved[72];
-	u8 param_revision;
-} __packed;
-
 struct jedec_ecc_info {
 	u8 ecc_bits;
 	u8 codeword_size;
@@ -1110,6 +1090,7 @@ extern struct nand_flash_dev nand_flash_ids[];
 extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
+extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 
 int nand_default_bbt(struct mtd_info *mtd);
 int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-- 
2.7.4
