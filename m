Content-Transfer-Encoding: 7bit
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: support for Toshiba BENAND (Built-in ECC NAND)
Date: Wed, 10 Jun 2015 16:08:39 +0900
Message-Id: <1433920119-16303-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
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
Toshiba BENAND is a SLC NAND solution that automatically generates ECC
inside NAND chip. Newer generation SLC NAND devices of today need multi-bit
hardware ECC by NAND controller in SoC. BENAND solution is ECC free,
has high performance and backward compatibility in NAND chip trend.

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/Kconfig     |   16 ++++++++++++++++
 drivers/mtd/nand/Makefile    |    1 +
 drivers/mtd/nand/nand_base.c |   32 ++++++++++++++++++++++++++++++--
 include/linux/mtd/nand.h     |    3 +++
 4 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5897d8d..2f11d43 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -22,6 +22,22 @@ menuconfig MTD_NAND
 
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
+		Toshiba BENAND is a SLC NAND solution that automatically
+		generates ECC inside NAND chip.
+		Newer generation SLC NAND devices of today need multi-bit
+		hardware ECC by NAND controller in SoC.
+		BENAND solution is ECC free, has high performance and
+		backward compatibility in NAND chip trend.
+
 config MTD_NAND_BCH
 	tristate
 	select BCH
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 582bbd05..afd26f0 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,6 +3,7 @@
 #
 
 obj-$(CONFIG_MTD_NAND)			+= nand.o
+obj-$(CONFIG_MTD_NAND_BENAND)	+= nand_benand.o
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
-- 
1.7.2.5
