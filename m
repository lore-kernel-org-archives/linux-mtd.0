Received: from mo1502.tsb.2iij.net ([210.149.48.174] helo=mo.tsb.2iij.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dE3s7-0001CE-QG
 for linux-mtd@lists.infradead.org; Fri, 26 May 2017 01:16:58 +0000
Content-Transfer-Encoding: 7bit
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: [PATCH -next] mtd: nand: Add support for Toshiba BENAND (Built-in ECC
 NAND)
Date: Fri, 26 May 2017 10:15:35 +0900
Message-Id: <1495761335-20535-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enables support for Toshiba BENAND. It was originally posted on
  https://lkml.org/lkml/2015/7/24/571

This patch is rewrote to adapt the recent mtd "separate vendor specific code
from core" cleanup process.

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/Kconfig        |  17 ++++++
 drivers/mtd/nand/nand_base.c    |  15 ++++++
 drivers/mtd/nand/nand_toshiba.c | 112 +++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h        |   1 +
 4 files changed, 143 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 0bd2319..6634d4b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -36,6 +36,23 @@ config MTD_NAND_ECC_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
 
+config MTD_NAND_BENAND
+	bool "Support for Toshiba BENAND (Built-in ECC NAND)"
+	default n
+	help
+	  This enables support for Toshiba BENAND.
+	  Toshiba BENAND is a SLC NAND solution that automatically
+	  generates ECC inside NAND chip.
+
+config MTD_NAND_BENAND_ECC_STATUS
+	bool "Enable ECC Status Read Command(0x7A)"
+	depends on MTD_NAND_BENAND
+	default n
+	help
+	  This enables support for ECC Status Read Command(0x7A) of BENAND.
+	  When this enables, report the real number of bitflips.
+	  In other cases, report the assumud number.
+
 config MTD_SM_COMMON
 	tristate
 	default n
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 43722a8..ab8652e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4186,6 +4186,7 @@ static const char * const nand_ecc_modes[] = {
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
 	[NAND_ECC_ON_DIE]	= "on-die",
+	[NAND_ECC_BENAND]	= "benand",
 };
 
 static int of_get_nand_ecc_mode(struct device_node *np)
@@ -4751,6 +4752,19 @@ int nand_scan_tail(struct mtd_info *mtd)
 			ecc->write_oob = nand_write_oob_std;
 		break;
 
+	case NAND_ECC_BENAND:
+		if (!ecc->read_page || !ecc->read_subpage) {
+			WARN(1, "No ECC functions supplied; benand ECC not possible\n");
+			ret = -EINVAL;
+			goto err_free;
+		}
+		ecc->write_page = nand_write_page_raw;
+		ecc->read_page_raw = nand_read_page_raw;
+		ecc->write_page_raw = nand_write_page_raw;
+		ecc->read_oob = nand_read_oob_std;
+		ecc->write_oob = nand_write_oob_std;
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
 		ecc->read_page = nand_read_page_raw;
@@ -4831,6 +4845,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Large page NAND with SOFT_ECC should support subpage reads */
 	switch (ecc->mode) {
 	case NAND_ECC_SOFT:
+	case NAND_ECC_BENAND:
 		if (chip->page_shift > 9)
 			chip->options |= NAND_SUBPAGE_READ;
 		break;
diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
index fa787ba..bb3c852 100644
--- a/drivers/mtd/nand/nand_toshiba.c
+++ b/drivers/mtd/nand/nand_toshiba.c
@@ -17,6 +17,97 @@
 
 #include <linux/mtd/nand.h>
 
+/* ECC Status Read Command for BENAND */
+#define NAND_CMD_ECC_STATUS	0x7A
+
+/* Recommended to rewrite for BENAND */
+#define NAND_STATUS_RECOM_REWRT	0x08
+
+
+static int toshiba_nand_benand_status_chk(struct mtd_info *mtd,
+			struct nand_chip *chip)
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
+static int toshiba_nand_read_page_benand(struct mtd_info *mtd,
+			struct nand_chip *chip, uint8_t *buf,
+			int oob_required, int page)
+{
+	unsigned int max_bitflips = 0;
+
+	chip->ecc.read_page_raw(mtd, chip, buf, oob_required, page);
+	max_bitflips = toshiba_nand_benand_status_chk(mtd, chip);
+
+	return max_bitflips;
+}
+
+static int toshiba_nand_read_subpage_benand(struct mtd_info *mtd,
+			struct nand_chip *chip, uint32_t data_offs,
+			uint32_t readlen, uint8_t *bufpoi, int page)
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
+	max_bitflips = toshiba_nand_benand_status_chk(mtd, chip);
+
+	return max_bitflips;
+}
+
 static void toshiba_nand_decode_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -33,15 +124,32 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 	 */
 	if (chip->id.len >= 6 && nand_is_slc(chip) &&
 	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
-	    !(chip->id.data[4] & 0x80) /* !BENAND */)
-		mtd->oobsize = 32 * mtd->writesize >> 9;
+	    (chip->id.data[4] & 0x80) /* BENAND */) {
+		if (IS_ENABLED(CONFIG_MTD_NAND_BENAND))
+			chip->ecc.mode = NAND_ECC_BENAND;
+	} else {
+		mtd->oobsize = 32 * mtd->writesize >> 9;	/* !BENAND */
+	}
 }
 
 static int toshiba_nand_init(struct nand_chip *chip)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
 	if (nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	if (chip->ecc.mode == NAND_ECC_BENAND) {
+		chip->ecc.options = NAND_ECC_CUSTOM_PAGE_ACCESS;
+		chip->ecc.bytes = 0;
+		chip->ecc.strength = 8;
+		chip->ecc.total = 0;
+		chip->ecc.read_page = toshiba_nand_read_page_benand;
+		chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
+
+		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3a6a77f..6821334 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -117,6 +117,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_ON_DIE,
+	NAND_ECC_BENAND,
 } nand_ecc_modes_t;
 
 enum nand_ecc_algo {
-- 
2.7.4
