Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTa5n-0005QO-Ny
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 16:57:20 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [REV3] mtd: nand: Prepare for Micron on-die ECC controller support.
Date: Fri, 28 Mar 2014 10:56:40 -0600
Message-Id: <1396025800-18444-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>, gsi@denx.de,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds NAND_ECC_HW_ON_DIE and all other changes to generic code.
On-die ECC detection now has moved into nand_onfi_detect_micron().

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |   42 ++++++++++++++++++++++++++++++++++++------
 drivers/of/of_mtd.c          |    1 +
 include/linux/mtd/nand.h     |    7 +++++++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5826da3..1f4a9d8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3049,16 +3049,29 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
 /*
  * Configure chip properties from Micron vendor-specific ONFI table
  */
-static void nand_onfi_detect_micron(struct nand_chip *chip,
-		struct nand_onfi_params *p)
+static void nand_onfi_detect_micron(struct mtd_info *mtd,
+		struct nand_chip *chip, struct nand_onfi_params *p)
 {
 	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
+	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
 
 	if (le16_to_cpu(p->vendor_revision) < 1)
 		return;
 
 	chip->read_retries = micron->read_retry_options;
 	chip->setup_read_retry = nand_setup_read_retry_micron;
+
+	if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_OP_MODE,
+				    features) >= 0) {
+		if (features[0] & ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC) {
+			/*
+			 * If the chip has on-die ECC enabled, we kind
+			 * of have to do the same...
+			 */
+			chip->ecc.mode = NAND_ECC_HW_ON_DIE;
+			pr_info("Using on-die ECC\n");
+		}
+	}
 }
 
 /*
@@ -3160,7 +3173,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (p->jedec_id == NAND_MFR_MICRON)
-		nand_onfi_detect_micron(chip, p);
+		nand_onfi_detect_micron(mtd, chip, p);
 
 	return 1;
 }
@@ -3792,13 +3805,24 @@ int nand_scan_tail(struct mtd_info *mtd)
 			!(chip->bbt_options & NAND_BBT_USE_FLASH));
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		size_t on_die_bufsz = 0;
+
+		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
+			on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);
+
 		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
-				+ mtd->oobsize * 3, GFP_KERNEL);
+				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
 		if (!nbuf)
 			return -ENOMEM;
 		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
 		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
 		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
+		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
+			nbuf->chkbuf = (nbuf->databuf + mtd->writesize
+					+ mtd->oobsize);
+			nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
+					+ mtd->oobsize);
+		}
 
 		chip->buffers = nbuf;
 	} else {
@@ -3956,6 +3980,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
 		break;
 
+	case NAND_ECC_HW_ON_DIE:
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. "
 			   "This is not recommended!\n");
@@ -4023,8 +4048,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
-	/* Large page NAND with SOFT_ECC should support subpage reads */
-	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
+	/*
+	 * Large page NAND with SOFT_ECC or on-die ECC should support
+	 * subpage reads.
+	 */
+	if (((ecc->mode == NAND_ECC_SOFT)
+	     || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
+	    && (chip->page_shift > 9))
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..c844c84 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -23,6 +23,7 @@ static const char *nand_ecc_modes[] = {
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
 	[NAND_ECC_SOFT_BCH]	= "soft_bch",
+	[NAND_ECC_HW_ON_DIE]	= "hw_on_die",
 };
 
 /**
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 450d61e..a1cc980 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -115,6 +115,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_SOFT_BCH,
+	NAND_ECC_HW_ON_DIE,
 } nand_ecc_modes_t;
 
 /*
@@ -214,6 +215,10 @@ struct nand_chip;
 /* Vendor-specific feature address (Micron) */
 #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
 
+/* Vendor-specific array operation mode (Micron) */
+#define ONFI_FEATURE_ADDR_OP_MODE	0x90
+#define ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC		0x08
+
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
 
@@ -516,6 +521,8 @@ struct nand_buffers {
 	uint8_t	*ecccalc;
 	uint8_t	*ecccode;
 	uint8_t *databuf;
+	uint8_t *chkbuf;
+	uint8_t *rawbuf;
 };
 
 /**
-- 
1.7.9.5
