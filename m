Content-Transfer-Encoding: 7bit
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC NAND)
Date: Fri, 12 Jun 2015 01:00:02 +0900
Message-Id: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
Cc: linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enables support for Toshiba BENAND.
BENAND is a SLC NAND solution that automatically generates ECC inside
NAND chip.

Some of the comments in the following discussion may need to be considerd.
  https://lkml.org/lkml/2015/3/25/310

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/Kconfig        |   13 ++++
 drivers/mtd/nand/Makefile       |    1 +
 drivers/mtd/nand/nand_base.c    |   32 +++++++++-
 drivers/mtd/nand/nand_benand.c  |  137 +++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h        |    3 +
 include/linux/mtd/nand_benand.h |   55 ++++++++++++++++
 6 files changed, 239 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_benand.c
 create mode 100644 include/linux/mtd/nand_benand.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5897d8d..050f0e9 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -22,6 +22,19 @@ menuconfig MTD_NAND
 
 if MTD_NAND
 
+config MTD_NAND_BENAND
+	tristate
+	depends on MTD_NAND_BENAND_ENABLE
+	default MTD_NAND
+
+config MTD_NAND_BENAND_ENABLE
+	bool "Support for Toshiba BENAND (Built-in ECC NAND)"
+	default y
+	help
+		This enables support for Toshiba BENAND.
+		Toshiba BENAND is a SLC NAND solution that automatically
+		generates ECC inside NAND chip.
+
 config MTD_NAND_BCH
 	tristate
 	select BCH
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 582bbd05..7f58bc1 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,6 +3,7 @@
 #
 
 obj-$(CONFIG_MTD_NAND)			+= nand.o
+obj-$(CONFIG_MTD_NAND_BENAND)		+= nand_benand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_BCH)		+= nand_bch.o
 obj-$(CONFIG_MTD_NAND_IDS)		+= nand_ids.o
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2e1232..98a8932 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -43,6 +43,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand_benand.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/leds.h>
@@ -3526,8 +3527,17 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
 				nand_is_slc(chip) &&
 				(id_data[5] & 0x7) == 0x6 /* 24nm */ &&
-				!(id_data[4] & 0x80) /* !BENAND */) {
-			mtd->oobsize = 32 * mtd->writesize >> 9;
+				(id_data[4] & 0x80) /* BENAND */) {
+			pr_info("24nm BENAND\n");
+
+			if (IS_ENABLED(CONFIG_MTD_NAND_BENAND)) {
+				chip->ecc.mode = NAND_ECC_BENAND;
+				pr_info("Selected BENAND Driver\n");
+			}
+
+		} else {
+			pr_info("24nm SLC NAND\n");
+			mtd->oobsize = 32 * mtd->writesize >> 9; /* !BENAND */
 		}
 
 	}
@@ -4075,6 +4085,24 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 		break;
 
+	case NAND_ECC_BENAND:
+		if (!mtd_nand_has_benand()) {
+			pr_warn("CONFIG_MTD_NAND_BENAND not enabled\n");
+			BUG();
+		}
+		ecc->calculate = NULL;
+		ecc->correct = NULL;
+		ecc->read_page = nand_read_page_benand;
+		ecc->read_subpage = nand_read_subpage_benand;
+		ecc->write_page = nand_write_page_raw;
+		ecc->read_page_raw = nand_read_page_raw;
+		ecc->write_page_raw = nand_write_page_raw;
+		ecc->read_oob = nand_read_oob_std;
+		ecc->write_oob = nand_write_oob_std;
+
+		nand_benand_init(mtd);
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
 		ecc->read_page = nand_read_page_raw;
diff --git a/drivers/mtd/nand/nand_benand.c b/drivers/mtd/nand/nand_benand.c
new file mode 100644
index 0000000..56385b0
--- /dev/null
+++ b/drivers/mtd/nand/nand_benand.c
@@ -0,0 +1,137 @@
+/*
+ *  drivers/mtd/nand_benand.c
+ *
+ *  (C) Copyright Toshiba Corporation
+ *                Semiconductor and Storage Products Company 2015
+ *
+ *  This program supports BENAND.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ *
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_benand.h>
+
+static struct nand_ecclayout benand_oob_64 = {
+	.eccbytes = 0,
+	.eccpos = {},
+	.oobfree = {
+		{.offset = 2, .length = 62}
+	}
+};
+
+static struct nand_ecclayout benand_oob_128 = {
+	.eccbytes = 0,
+	.eccpos = {},
+	.oobfree = {
+		{.offset = 2, .length = 126}
+	}
+};
+
+void nand_benand_init(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+
+	pr_info("%s\n", __func__);
+
+	chip->ecc.size = mtd->writesize;
+	chip->ecc.strength = 1;
+	chip->options |= NAND_SUBPAGE_READ;
+
+	switch (mtd->oobsize) {
+	case 64:
+		chip->ecc.layout = &benand_oob_64;
+		break;
+	case 128:
+		chip->ecc.layout = &benand_oob_128;
+		break;
+	default:
+		pr_warn("No oob scheme defined for oobsize %d\n",
+				mtd->oobsize);
+		 BUG();
+	}
+
+}
+EXPORT_SYMBOL(nand_benand_init);
+
+int nand_read_page_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			uint8_t *buf, int oob_required, int page)
+{
+	unsigned int max_bitflips = 0;
+
+	pr_debug("%s\n", __func__);
+
+	chip->ecc.read_page_raw(mtd, chip, buf, oob_required, page);
+	max_bitflips = nand_benand_status_chk(mtd, chip);
+
+	return max_bitflips;
+}
+EXPORT_SYMBOL(nand_read_page_benand);
+
+
+int nand_read_subpage_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi,
+			int page)
+{
+	uint8_t *p;
+	unsigned int max_bitflips = 0;
+
+	pr_debug("%s\n", __func__);
+
+	if (data_offs != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
+
+
+	p = bufpoi + data_offs;
+	chip->read_buf(mtd, p, readlen);
+
+	max_bitflips = nand_benand_status_chk(mtd, chip);
+
+	return max_bitflips;
+}
+EXPORT_SYMBOL(nand_read_subpage_benand);
+
+
+int nand_benand_status_chk(struct mtd_info *mtd, struct nand_chip *chip)
+{
+	unsigned int bitflips = 0;
+	u8 status;
+
+	pr_debug("%s\n", __func__);
+
+	/* Check Read Status */
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+
+	/* timeout */
+	if (!(status & NAND_STATUS_READY)) {
+		pr_info("BENAND : Time Out!\n");
+		return -EIO;
+	}
+
+	/* uncorrectable */
+	else if (status & NAND_STATUS_FAIL) {
+		pr_info("BENAND : Uncorrectable!\n");
+		mtd->ecc_stats.failed++;
+	}
+
+	/* correctable */
+	else if (status & NAND_STATUS_RECOM_REWRT) {
+		pr_info("BENAND : Recommended to rewrite!\n");
+		bitflips = chip->ecc.strength;
+		mtd->ecc_stats.corrected += chip->ecc.strength;
+	}
+
+	return bitflips;
+
+}
+EXPORT_SYMBOL(nand_benand_status_chk);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Toshiba Corporation Semiconductor and Storage Products Company");
+MODULE_DESCRIPTION("BENAND (Built-in ECC NAND) support");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7e..8f59ad9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -101,6 +101,8 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
+/* Recommended to rewrite for BENAND */
+#define NAND_STATUS_RECOM_REWRT	0x08
 #define NAND_STATUS_TRUE_READY	0x20
 #define NAND_STATUS_READY	0x40
 #define NAND_STATUS_WP		0x80
@@ -115,6 +117,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_SOFT_BCH,
+	NAND_ECC_BENAND,
 } nand_ecc_modes_t;
 
 /*
diff --git a/include/linux/mtd/nand_benand.h b/include/linux/mtd/nand_benand.h
new file mode 100644
index 0000000..48fcc49
--- /dev/null
+++ b/include/linux/mtd/nand_benand.h
@@ -0,0 +1,55 @@
+/*
+ *  linux/include/linux/mtd/nand_benand.h
+ *
+ *  (C) Copyright Toshiba Corporation
+ *                Semiconductor and Storage Products Company 2015
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __MTD_NAND_BENAND_H__
+#define __MTD_NAND_BENAND_H__
+
+#if defined(CONFIG_MTD_NAND_BENAND_ENABLE)
+
+static inline int mtd_nand_has_benand(void) { return 1; }
+
+void nand_benand_init(struct mtd_info *mtd);
+
+int nand_read_page_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			uint8_t *buf, int oob_required, int page);
+
+int nand_read_subpage_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi,
+			int page);
+
+int nand_benand_status_chk(struct mtd_info *mtd, struct nand_chip *chipr);
+
+#else  /* CONFIG_MTD_NAND_BENAND_ENABLE */
+static inline int mtd_nand_has_benand(void) { return 0; }
+
+void nand_benand_init(struct mtd_info *mtd) {}
+
+int nand_read_page_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			uint8_t *buf, int oob_required, int page)
+{
+	return -1;
+}
+
+int nand_read_subpage_benand(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi,
+			int page)
+{
+	return -1;
+}
+
+int nand_benand_status_chk(struct mtd_info *mtd, struct nand_chip *chipr)
+{
+	return -1;
+}
+
+#endif /* CONFIG_MTD_NAND_BENAND_ENABLE */
+#endif
-- 
1.7.2.5
