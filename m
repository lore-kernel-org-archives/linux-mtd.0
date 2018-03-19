Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exrFV-0006Bv-KP
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:39:06 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 09/13] mtd: rawnand: prepare the removal of the ONFI
 parameter page
Date: Mon, 19 Mar 2018 10:38:07 +0100
Message-Id: <20180319093811.18351-10-miquel.raynal@bootlin.com>
In-Reply-To: <20180319093811.18351-1-miquel.raynal@bootlin.com>
References: <20180319093811.18351-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND chip parameter page is statically allocated within the
nand_chip structure, which reserves a lot of space. Even not ONFI nor
JEDEC chips have it embedded. Also, only a few parameters are actually
read from the parameter page after the detection.

ONFI-related parameters that will be used outside from the
identification function are stored in a separate onfi_parameters
structure embedded in nand_parameters, this small structure that
already hold generic parameters.

For now, the onfi_parameters structure is allocated statically. However,
after some deep rework in the NAND framework, it will be possible to do
dynamic allocations from the NAND identification phase, and this
strcuture will then be dynamically allocated when needed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c    | 14 +++++++++++--
 drivers/mtd/nand/raw/nand_micron.c  | 17 +++++++---------
 drivers/mtd/nand/raw/nand_timings.c | 10 +++++-----
 include/linux/mtd/rawnand.h         | 40 ++++++++++++++++++++++++-------------
 4 files changed, 50 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c3bc814a9beb..7614b47cea15 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5171,14 +5171,14 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	chip->max_bb_per_die = le16_to_cpu(p->bb_per_lun);
 	chip->blocks_per_die = le32_to_cpu(p->blocks_per_lun);
 
-	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
+	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
 
 	if (p->ecc_bits != 0xff) {
 		chip->ecc_strength_ds = p->ecc_bits;
 		chip->ecc_step_ds = 512;
 	} else if (chip->onfi_version >= 21 &&
-		(onfi_feature(chip) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
+		(le16_to_cpu(p->features) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
 
 		/*
 		 * The nand_flash_detect_ext_param_page() uses the
@@ -5199,6 +5199,16 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	/* Save some parameters from the parameter page for future use */
 	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
 		chip->parameters.supports_set_get_features = true;
+	chip->parameters.onfi.tPROG = le16_to_cpu(p->t_prog);
+	chip->parameters.onfi.tBERS = le16_to_cpu(p->t_bers);
+	chip->parameters.onfi.tR = le16_to_cpu(p->t_r);
+	chip->parameters.onfi.tCCS = le16_to_cpu(p->t_ccs);
+	chip->parameters.onfi.async_timing_mode =
+		le16_to_cpu(p->async_timing_mode);
+	chip->parameters.onfi.vendor_revision =
+		le16_to_cpu(p->vendor_revision);
+	memcpy(chip->parameters.onfi.vendor, p->vendor,
+	       sizeof(p->vendor));
 
 	return 1;
 }
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index b825656f6284..740785eb039b 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -56,17 +56,14 @@ static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
  */
 static int micron_nand_onfi_init(struct nand_chip *chip)
 {
-	struct nand_onfi_params *p = &chip->onfi_params;
-	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
+	struct nand_parameters *p = &chip->parameters;
+	struct nand_onfi_vendor_micron *micron = (void *)p->onfi.vendor;
 
-	if (!chip->onfi_version)
-		return 0;
+	if (chip->onfi_version && p->onfi.vendor_revision) {
+		chip->read_retries = micron->read_retry_options;
+		chip->setup_read_retry = micron_nand_setup_read_retry;
+	}
 
-	if (le16_to_cpu(p->vendor_revision) < 1)
-		return 0;
-
-	chip->read_retries = micron->read_retry_options;
-	chip->setup_read_retry = micron_nand_setup_read_retry;
 
 	return 0;
 }
@@ -239,7 +236,7 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	 * Some Micron NANDs have an on-die ECC of 4/512, some other
 	 * 8/512. We only support the former.
 	 */
-	if (chip->onfi_params.ecc_bits != 4)
+	if (chip->ecc_strength_ds != 4)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	return MICRON_ON_DIE_SUPPORTED;
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 9400d039ddbd..8b13e6d77b84 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -307,16 +307,16 @@ int onfi_fill_data_interface(struct nand_chip *chip,
 	 * These information are part of the ONFI parameter page.
 	 */
 	if (chip->onfi_version) {
-		struct nand_onfi_params *params = &chip->onfi_params;
+		struct nand_parameters *params = &chip->parameters;
 		struct nand_sdr_timings *timings = &iface->timings.sdr;
 
 		/* microseconds -> picoseconds */
-		timings->tPROG_max = 1000000ULL * le16_to_cpu(params->t_prog);
-		timings->tBERS_max = 1000000ULL * le16_to_cpu(params->t_bers);
-		timings->tR_max = 1000000ULL * le16_to_cpu(params->t_r);
+		timings->tPROG_max = 1000000ULL * params->onfi.tPROG;
+		timings->tBERS_max = 1000000ULL * params->onfi.tBERS;
+		timings->tR_max = 1000000ULL * params->onfi.tR;
 
 		/* nanoseconds -> picoseconds */
-		timings->tCCS_min = 1000UL * le16_to_cpu(params->t_ccs);
+		timings->tCCS_min = 1000UL * params->onfi.tCCS;
 	}
 
 	return 0;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index a24591411d78..07fc3a723a17 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -429,14 +429,39 @@ struct nand_jedec_params {
 	__le16 crc;
 } __packed;
 
+/**
+ * struct onfi_params - ONFI specific parameters that will be reused
+ * @tPROG: Page program time
+ * @tBERS: Block erase time
+ * @tR: Page read time
+ * @tCCS: Change column setup time
+ * @async_timing_mode: Supported asynchronous timing mode
+ * @vendor_revision: Vendor specific revision number
+ * @vendor: Vendor specific data
+ */
+struct onfi_params {
+	u16 tPROG;
+	u16 tBERS;
+	u16 tR;
+	u16 tCCS;
+	u16 async_timing_mode;
+	u16 vendor_revision;
+	u8 vendor[88];
+};
+
 /**
  * struct nand_parameters - NAND generic parameters from the parameter page
  * @model: Model name
  * @supports_set_get_features: The NAND chip supports setting/getting features
+ * @onfi: ONFI specific parameters
  */
 struct nand_parameters {
+	/* Generic parameters */
 	char model[100];
 	bool supports_set_get_features;
+
+	/* ONFI parameters */
+	struct onfi_params onfi;
 };
 
 /* The maximum expected count of bytes in the NAND ID sequence */
@@ -1548,26 +1573,13 @@ struct platform_nand_data {
 	struct platform_nand_ctrl ctrl;
 };
 
-/* return the supported features. */
-static inline int onfi_feature(struct nand_chip *chip)
-{
-	return chip->onfi_version ? le16_to_cpu(chip->onfi_params.features) : 0;
-}
-
 /* return the supported asynchronous timing mode. */
 static inline int onfi_get_async_timing_mode(struct nand_chip *chip)
 {
 	if (!chip->onfi_version)
 		return ONFI_TIMING_MODE_UNKNOWN;
-	return le16_to_cpu(chip->onfi_params.async_timing_mode);
-}
 
-/* return the supported synchronous timing mode. */
-static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
-{
-	if (!chip->onfi_version)
-		return ONFI_TIMING_MODE_UNKNOWN;
-	return le16_to_cpu(chip->onfi_params.src_sync_timing_mode);
+	return chip->parameters.onfi.async_timing_mode;
 }
 
 int onfi_fill_data_interface(struct nand_chip *chip,
-- 
2.14.1
