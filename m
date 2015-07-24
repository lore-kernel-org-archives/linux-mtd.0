Content-Transfer-Encoding: 7bit
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: [PATCH REPOST v3] mtd: nand support for Toshiba BENAND (Built-in ECC
 NAND)
Date: Sat, 25 Jul 2015 02:42:56 +0900
Message-Id: <1437759776-12445-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
In-Reply-To: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enables support for Toshiba BENAND. BENAND is a SLC NAND
solution that automatically generates ECC inside NAND chip.

I considered to use the patch of on-die ECC, but I believe reading twice
the same page approach will affect read performance. Additionally, BENAND
does not support Disable ECC. So, I cannot use same approach.

BENAND Read Status CMD(70h) is able to report Rewrite Recommend. BENAND
also has extended ECC Status CMD(7Ah). This command is able to report the
number of bit error/sector data. When MTD_NAND_BENAND_ENABLE option enabled,
this driver use the extended ECC status CMD(7Ah) to report real number of
bitflips. In case of difficult to use CMD(7Ah), this driver use
"mtd->bitflip_threshold" to assume the number of bitflips.

Changelog[v3]:
  1. Change implementation for 8bit on-die ECC of BENAND.
    - chip->ecc.strength is changed 1 to 8.
  2. When a bit error beyond a threshold occurred in read operation inside
     BENAND, use the 0x7A command(BENAND original command) to get actual
     number of bitflips.
    - Add the config MTD_NAND_BENAND_ECC_STATUS for ECC Status Read Command.
    - Use the 0x7A command when config MTD_NAND_BENAND_ECC_STATUS is enable
      and chip->cmd_ctrl is implemented.
  3. Delete all pr_info().

Changelog[v2]:
  Added nand_benand.c and nand_benand.h

Changelog[v1]
  The original version.
  (I forgot to add nand_benand.c and nand_benand.h)

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/Kconfig        |   21 +++++
 drivers/mtd/nand/Makefile       |    1 +
 drivers/mtd/nand/nand_base.c    |   30 +++++++-
 drivers/mtd/nand/nand_benand.c  |  154 +++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h        |    1 +
 include/linux/mtd/nand_benand.h |   48 ++++++++++++
 6 files changed, 253 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/nand/nand_benand.c
 create mode 100644 include/linux/mtd/nand_benand.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5b2806a..67e13c2 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -22,6 +22,27 @@ menuconfig MTD_NAND
 
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
+	  This enables support for Toshiba BENAND.
+	  Toshiba BENAND is a SLC NAND solution that automatically
+	  generates ECC inside NAND chip.
+
+config MTD_NAND_BENAND_ECC_STATUS
+	bool "Enable ECC Status Read Command(0x7A)"
+	depends on MTD_NAND_BENAND_ENABLE
+	help
+	  This enables support for ECC Status Read Command(0x7A) of BENAND.
+	  When this enables, report the real number of bitflips.
+	  In other cases, report the assumud number.
+
 config MTD_NAND_BCH
 	tristate
 	select BCH
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 1f897ec..d019309 100644
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
index ceb68ca..1ffdb5c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -41,6 +41,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand_benand.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/leds.h>
@@ -3522,8 +3523,13 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		if (id_len >= 6 && id_data[0] == NAND_MFR_TOSHIBA &&
 				nand_is_slc(chip) &&
 				(id_data[5] & 0x7) == 0x6 /* 24nm */ &&
-				!(id_data[4] & 0x80) /* !BENAND */) {
-			mtd->oobsize = 32 * mtd->writesize >> 9;
+				(id_data[4] & 0x80) /* BENAND */) {
+
+			if (IS_ENABLED(CONFIG_MTD_NAND_BENAND))
+				chip->ecc.mode = NAND_ECC_BENAND;
+
+		} else {
+			mtd->oobsize = 32 * mtd->writesize >> 9; /* !BENAND */
 		}
 
 	}
@@ -4111,6 +4117,26 @@ int nand_scan_tail(struct mtd_info *mtd)
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
+		ecc->size = mtd->writesize;
+		ecc->strength = 8;
+
+		nand_benand_init(mtd);
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
 		ecc->read_page = nand_read_page_raw;
diff --git a/drivers/mtd/nand/nand_benand.c b/drivers/mtd/nand/nand_benand.c
new file mode 100644
index 0000000..43f89ae
--- /dev/null
+++ b/drivers/mtd/nand/nand_benand.c
@@ -0,0 +1,154 @@
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
+/* Recommended to rewrite for BENAND */
+#define NAND_STATUS_RECOM_REWRT	0x08
+
+/* ECC Status Read Command */
+#define NAND_CMD_ECC_STATUS	0x7A
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
+
+static int nand_benand_status_chk(struct mtd_info *mtd, struct nand_chip *chip)
+{
+	unsigned int max_bitflips = 0;
+	u8 status;
+
+	/* Check Read Status */
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+
+	/* timeout */
+	if (!(status & NAND_STATUS_READY)) {
+		pr_debug("BENAND : Time Out!\n");
+		return -EIO;
+	}
+
+	/* uncorrectable */
+	else if (status & NAND_STATUS_FAIL)
+		mtd->ecc_stats.failed++;
+
+	/* correctable */
+	else if (status & NAND_STATUS_RECOM_REWRT) {
+		if (chip->cmd_ctrl &&
+			IS_ENABLED(CONFIG_MTD_NAND_BENAND_ECC_STATUS)) {
+
+			int i;
+			u8 ecc_status;
+			unsigned int bitflips;
+
+			/* Check Read ECC Status */
+			chip->cmd_ctrl(mtd, NAND_CMD_ECC_STATUS,
+				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+			/* Get bitflips info per 512Byte */
+			for (i = 0; i < mtd->writesize >> 9; i++) {
+				ecc_status = chip->read_byte(mtd);
+				bitflips = ecc_status & 0x0f;
+				max_bitflips = max_t(unsigned int,
+						max_bitflips, bitflips);
+			}
+			mtd->ecc_stats.corrected += max_bitflips;
+		} else {
+			/*
+			 * If can't use chip->cmd_ctrl,
+			 * we can't get real number of bitflips.
+			 * So, we set max_bitflips mtd->bitflip_threshold.
+			 */
+			max_bitflips = mtd->bitflip_threshold;
+			mtd->ecc_stats.corrected += max_bitflips;
+		}
+	}
+
+	return max_bitflips;
+}
+
+
+void nand_benand_init(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+
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
+		BUG();
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
+	if (data_offs != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
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
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Toshiba Corporation Semiconductor and Storage Products Company");
+MODULE_DESCRIPTION("BENAND (Built-in ECC NAND) support");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f25e2bd..ba3c2f1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -117,6 +117,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_SOFT_BCH,
+	NAND_ECC_BENAND,
 } nand_ecc_modes_t;
 
 /*
diff --git a/include/linux/mtd/nand_benand.h b/include/linux/mtd/nand_benand.h
new file mode 100644
index 0000000..0aa5aec
--- /dev/null
+++ b/include/linux/mtd/nand_benand.h
@@ -0,0 +1,48 @@
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
+#endif /* CONFIG_MTD_NAND_BENAND_ENABLE */
+#endif
-- 
1.7.2.5
