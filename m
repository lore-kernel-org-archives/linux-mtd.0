Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmga-0000I8-Ef
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 19:36:57 +0000
From: David Mosberger <davidm@egauge.net>
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dedekind1@gmail.com, gsi@denx.de, pekon@ti.com
Subject: [PATCH v5 1/5] mtd: nand: Detect Micron flash with on-die ECC (aka
 "internal ECC") enabled.
Date: Mon, 14 Apr 2014 13:35:30 -0600
Message-Id: <1397504134-32178-2-git-send-email-davidm@egauge.net>
In-Reply-To: <1397504134-32178-1-git-send-email-davidm@egauge.net>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>
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
index 50a6e07..7d1ec81 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3058,19 +3058,40 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
 			feature);
 }
 
+static void nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd)
+{
+	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
+	struct nand_chip *chip = mtd->priv;
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
+				    struct nand_onfi_params *p)
 {
 	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
+	struct nand_chip *chip = mtd->priv;
 
 	if (le16_to_cpu(p->vendor_revision) < 1)
 		return;
 
 	chip->read_retries = micron->read_retry_options;
 	chip->setup_read_retry = nand_setup_read_retry_micron;
+
+	nand_onfi_detect_micron_on_die_ecc(mtd);
 }
 
 /*
@@ -3172,7 +3193,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (p->jedec_id == NAND_MFR_MICRON)
-		nand_onfi_detect_micron(chip, p);
+		nand_onfi_detect_micron(mtd, p);
 
 	return 1;
 }
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index cd38bba..27b01cc 100644
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
