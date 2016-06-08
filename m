Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd7I-0004t7-Cb
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:01:55 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 10/15] mtd: nand: move Micron specific init logic in
 nand_micron.c
Date: Wed,  8 Jun 2016 15:00:44 +0200
Message-Id: <1465390849-13199-11-git-send-email-boris.brezillon@free-electrons.com>
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

Move Micron specific initialization logic into nand_micron.c. This is
part of the "separate vendor specific code from core" cleanup process.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/Makefile      |  1 +
 drivers/mtd/nand/nand_base.c   | 31 +---------------
 drivers/mtd/nand/nand_ids.c    |  3 +-
 drivers/mtd/nand/nand_micron.c | 84 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h       | 20 ----------
 5 files changed, 88 insertions(+), 51 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_micron.c

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 403e9a7..f1bd008 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -59,5 +59,6 @@ obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_hynix.o
+nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
 nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 931aafb..17fb6f6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3301,30 +3301,6 @@ ext_out:
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
@@ -3421,9 +3397,6 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
-	if (p->jedec_id == NAND_MFR_MICRON)
-		nand_onfi_detect_micron(chip, p);
-
 	return 1;
 }
 
@@ -3662,9 +3635,7 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 	 */
 	if ((nand_is_slc(chip) &&
 				(maf_id == NAND_MFR_AMD ||
-				 maf_id == NAND_MFR_MACRONIX)) ||
-			(mtd->writesize == 2048 &&
-			 maf_id == NAND_MFR_MICRON))
+				 maf_id == NAND_MFR_MACRONIX)))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 }
 
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 2cc9d32..5d02787 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -169,6 +169,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
 extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
+extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
@@ -178,7 +179,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
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
index 0000000..2303e45
--- /dev/null
+++ b/drivers/mtd/nand/nand_micron.c
@@ -0,0 +1,84 @@
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
+
+static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
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
index c0a1e36..0bdea71 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -348,26 +348,6 @@ struct onfi_ext_param_page {
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
-- 
2.7.4
