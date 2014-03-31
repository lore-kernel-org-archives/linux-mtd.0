Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUle8-0002J7-Eh
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 23:29:43 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC (aka
 "internal ECC") enabled.
Date: Mon, 31 Mar 2014 17:28:53 -0600
Message-Id: <1396308537-16013-2-git-send-email-davidm@egauge.net>
In-Reply-To: <1396308537-16013-1-git-send-email-davidm@egauge.net>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
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

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |   27 ++++++++++++++++++++++++---
 include/linux/mtd/nand.h     |    4 ++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 09fe1b1..f145f00 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3054,11 +3054,30 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
 			feature);
 }
 
+static void
+nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd,
+				   struct nand_chip *chip)
+{
+	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
+
+	if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_ARRAY_OP_MODE,
+				    features) < 0)
+		return;
+
+	if (features[0] & ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC) {
+		/*
+		 * If the chip has on-die ECC enabled, we kind of have
+		 * to do the same...
+		 */
+		pr_info("Using on-die ECC\n");
+	}
+}
+
 /*
  * Configure chip properties from Micron vendor-specific ONFI table
  */
-static void nand_onfi_detect_micron(struct nand_chip *chip,
-		struct nand_onfi_params *p)
+static void nand_onfi_detect_micron(struct mtd_info *mtd,
+		struct nand_chip *chip, struct nand_onfi_params *p)
 {
 	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
 
@@ -3067,6 +3086,8 @@ static void nand_onfi_detect_micron(struct nand_chip *chip,
 
 	chip->read_retries = micron->read_retry_options;
 	chip->setup_read_retry = nand_setup_read_retry_micron;
+
+	nand_onfi_detect_micron_on_die_ecc(mtd, chip);
 }
 
 /*
@@ -3168,7 +3189,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (p->jedec_id == NAND_MFR_MICRON)
-		nand_onfi_detect_micron(chip, p);
+		nand_onfi_detect_micron(mtd, chip, p);
 
 	return 1;
 }
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 2bd6e4e..780ab58 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -225,6 +225,10 @@ struct nand_chip;
 /* Vendor-specific feature address (Micron) */
 #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
 
+/* Vendor-specific array operation mode (Micron) */
+#define ONFI_FEATURE_ADDR_ARRAY_OP_MODE	0x90
+#define ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC		0x08
+
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
 
-- 
1.7.9.5
