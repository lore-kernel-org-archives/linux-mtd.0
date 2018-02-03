Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ehuYv-0002bm-RG
 for linux-mtd@lists.infradead.org; Sat, 03 Feb 2018 09:56:49 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 4/6] mtd: nand: Stop using a static parameter page for all
 chips
Date: Sat,  3 Feb 2018 10:55:42 +0100
Message-Id: <20180203095544.9855-5-miquel.raynal@bootlin.com>
In-Reply-To: <20180203095544.9855-1-miquel.raynal@bootlin.com>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Miquel Raynal <miquel.raynal@free-electrons.com>

The NAND chip parameter page is statically allocated within the
nand_chip structure, which reserves a lot of space. Even not ONFI nor
JEDEC chips have it embedded. Also, only a few parameters are still be
read from the parameter page after the detection.

Remove these pages from the nand_chip structure and instead create a
small structure with all the parameters that will be needed outside of
the identification phase.

During identification, allocate dynamically the parameter page after the
chip is declared ONFI or JEDEC. Extract all information from it and free
this space when exiting.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c    | 111 +++++++++++++++++++++++++---------------
 drivers/mtd/nand/nand_micron.c  |  15 +++---
 drivers/mtd/nand/nand_timings.c |  10 ++--
 include/linux/mtd/rawnand.h     |  45 ++++++----------
 4 files changed, 98 insertions(+), 83 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8d2c37011979..4a879b1635b3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1174,9 +1174,7 @@ int nand_get_features(struct nand_chip *chip, int addr,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+	if (!chip->parameters.support_setting_features)
 		return -ENOTSUPP;
 
 	return chip->onfi_get_features(mtd, chip, addr, subfeature_param);
@@ -1197,9 +1195,7 @@ int nand_set_features(struct nand_chip *chip, int addr,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
+	if (!chip->parameters.support_setting_features)
 		return -ENOTSUPP;
 
 	return chip->onfi_set_features(mtd, chip, addr, subfeature_param);
@@ -5198,7 +5194,7 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 static int nand_flash_detect_onfi(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_onfi_params *p = &chip->onfi_params;
+	struct nand_onfi_params *p;
 	char id[4];
 	int i, ret, val;
 
@@ -5207,14 +5203,23 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 	if (ret || strncmp(id, "ONFI", 4))
 		return 0;
 
+	/* ONFI chip: allocate a buffer to hold its parameter page */
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
 	ret = nand_read_param_page_op(chip, 0, NULL, 0);
-	if (ret)
-		return 0;
+	if (ret) {
+		ret = 0;
+		goto free_onfi_param_page;
+	}
 
 	for (i = 0; i < 3; i++) {
 		ret = nand_read_data_op(chip, p, sizeof(*p), true);
-		if (ret)
-			return 0;
+		if (ret) {
+			ret = 0;
+			goto free_onfi_param_page;
+		}
 
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
 				le16_to_cpu(p->crc)) {
@@ -5224,7 +5229,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	if (i == 3) {
 		pr_err("Could not find valid ONFI parameter page; aborting\n");
-		return 0;
+		goto free_onfi_param_page;
 	}
 
 	/* Check version */
@@ -5242,13 +5247,16 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 
 	if (!chip->onfi_version) {
 		pr_info("unsupported ONFI version: %d\n", val);
-		return 0;
+		goto free_onfi_param_page;
+	} else {
+		ret = 1;
 	}
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
+	memcpy(chip->parameters.model, p->model, sizeof(p->model));
 	if (!mtd->name)
-		mtd->name = p->model;
+		mtd->name = chip->parameters.model;
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5270,14 +5278,14 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
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
@@ -5295,7 +5303,20 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		pr_warn("Could not retrieve ONFI ECC requirements\n");
 	}
 
-	return 1;
+	/* Save some parameters from the parameter page for future use */
+	if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES)
+		chip->parameters.support_setting_features = true;
+	chip->parameters.t_prog = le16_to_cpu(p->t_prog);
+	chip->parameters.t_bers = le16_to_cpu(p->t_bers);
+	chip->parameters.t_r = le16_to_cpu(p->t_r);
+	chip->parameters.t_ccs = le16_to_cpu(p->t_ccs);
+	chip->parameters.async_timing_mode = le16_to_cpu(p->async_timing_mode);
+	chip->parameters.vendor_revision = le16_to_cpu(p->vendor_revision);
+	memcpy(chip->parameters.vendor, p->vendor, sizeof(p->vendor));
+
+free_onfi_param_page:
+	kfree(p);
+	return ret;
 }
 
 /*
@@ -5304,7 +5325,7 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 static int nand_flash_detect_jedec(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_jedec_params *p = &chip->jedec_params;
+	struct nand_jedec_params *p;
 	struct jedec_ecc_info *ecc;
 	char id[5];
 	int i, val, ret;
@@ -5314,14 +5335,23 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 	if (ret || strncmp(id, "JEDEC", sizeof(id)))
 		return 0;
 
+	/* JEDEC chip: allocate a buffer to hold its parameter page */
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
 	ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
-	if (ret)
-		return 0;
+	if (ret) {
+		ret = 0;
+		goto free_jedec_param_page;
+	}
 
 	for (i = 0; i < 3; i++) {
 		ret = nand_read_data_op(chip, p, sizeof(*p), true);
-		if (ret)
-			return 0;
+		if (ret) {
+			ret = 0;
+			goto free_jedec_param_page;
+		}
 
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
 				le16_to_cpu(p->crc))
@@ -5330,7 +5360,7 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	if (i == 3) {
 		pr_err("Could not find valid JEDEC parameter page; aborting\n");
-		return 0;
+		goto free_jedec_param_page;
 	}
 
 	/* Check version */
@@ -5342,13 +5372,14 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 
 	if (!chip->jedec_version) {
 		pr_info("unsupported JEDEC version: %d\n", val);
-		return 0;
+		goto free_jedec_param_page;
 	}
 
 	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
 	sanitize_string(p->model, sizeof(p->model));
+	memcpy(chip->parameters.model, p->model, sizeof(p->model));
 	if (!mtd->name)
-		mtd->name = p->model;
+		mtd->name = chip->parameters.model;
 
 	mtd->writesize = le32_to_cpu(p->byte_per_page);
 
@@ -5363,7 +5394,7 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 	chip->bits_per_cell = p->bits_per_cell;
 
-	if (jedec_feature(chip) & JEDEC_FEATURE_16_BIT_BUS)
+	if (le16_to_cpu(p->features) & JEDEC_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
 
 	/* ECC info */
@@ -5376,7 +5407,9 @@ static int nand_flash_detect_jedec(struct nand_chip *chip)
 		pr_warn("Invalid codeword size\n");
 	}
 
-	return 1;
+free_jedec_param_page:
+	kfree(p);
+	return ret;
 }
 
 /*
@@ -5678,11 +5711,17 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	chip->onfi_version = 0;
 	if (!type->name || !type->pagesize) {
 		/* Check if the chip is ONFI compliant */
-		if (nand_flash_detect_onfi(chip))
+		ret = nand_flash_detect_onfi(chip);
+		if (ret < 0)
+			return ret;
+		if (ret)
 			goto ident_done;
 
 		/* Check if the chip is JEDEC compliant */
-		if (nand_flash_detect_jedec(chip))
+		ret = nand_flash_detect_jedec(chip);
+		if (ret < 0)
+			return ret;
+		if (ret)
 			goto ident_done;
 	}
 
@@ -5749,17 +5788,9 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		maf_id, dev_id);
-
-	if (chip->onfi_version)
-		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-			chip->onfi_params.model);
-	else if (chip->jedec_version)
-		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-			chip->jedec_params.model);
-	else
-		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
-			type->name);
-
+	pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
+		(chip->onfi_version || chip->jedec_version) ?
+		chip->parameters.model : type->name);
 	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
index 48847b441ef7..eaf14885e059 100644
--- a/drivers/mtd/nand/nand_micron.c
+++ b/drivers/mtd/nand/nand_micron.c
@@ -56,17 +56,14 @@ static int micron_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
  */
 static int micron_nand_onfi_init(struct nand_chip *chip)
 {
-	struct nand_onfi_params *p = &chip->onfi_params;
+	struct nand_parameters *p = &chip->parameters;
 	struct nand_onfi_vendor_micron *micron = (void *)p->vendor;
 
-	if (!chip->onfi_version)
-		return 0;
-
-	if (le16_to_cpu(p->vendor_revision) < 1)
-		return 0;
+	if (chip->onfi_version && p->vendor_revision) {
+		chip->read_retries = micron->read_retry_options;
+		chip->setup_read_retry = micron_nand_setup_read_retry;
+	}
 
-	chip->read_retries = micron->read_retry_options;
-	chip->setup_read_retry = micron_nand_setup_read_retry;
 
 	return 0;
 }
@@ -237,7 +234,7 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	 * Some Micron NANDs have an on-die ECC of 4/512, some other
 	 * 8/512. We only support the former.
 	 */
-	if (chip->onfi_params.ecc_bits != 4)
+	if (chip->ecc_strength_ds != 4)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	return MICRON_ON_DIE_SUPPORTED;
diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index 9400d039ddbd..ac140fa4257f 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
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
+		timings->tPROG_max = 1000000ULL * params->t_prog;
+		timings->tBERS_max = 1000000ULL * params->t_bers;
+		timings->tR_max = 1000000ULL * params->t_r;
 
 		/* nanoseconds -> picoseconds */
-		timings->tCCS_min = 1000UL * le16_to_cpu(params->t_ccs);
+		timings->tCCS_min = 1000UL * params->t_ccs;
 	}
 
 	return 0;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 3244f2594b6b..6d8667bb96f4 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -429,6 +429,20 @@ struct nand_jedec_params {
 	__le16 crc;
 } __packed;
 
+struct nand_parameters {
+	/* Generic parameters */
+	char model[20];
+	/* ONFI parameters */
+	bool support_setting_features;
+	u16 t_prog;
+	u16 t_bers;
+	u16 t_r;
+	u16 t_ccs;
+	u16 async_timing_mode;
+	u16 vendor_revision;
+	u8 vendor[88];
+} __packed;
+
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
 
@@ -1161,10 +1175,6 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
  *			non 0 if ONFI supported.
  * @jedec_version:	[INTERN] holds the chip JEDEC version (BCD encoded),
  *			non 0 if JEDEC supported.
- * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
- *			supported, 0 otherwise.
- * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
- *			supported, 0 otherwise.
  * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
  *			this nand device will encounter their life times.
  * @blocks_per_die:	[INTERN] The number of PEBs in a die
@@ -1245,10 +1255,7 @@ struct nand_chip {
 	struct nand_id id;
 	int onfi_version;
 	int jedec_version;
-	union {
-		struct nand_onfi_params	onfi_params;
-		struct nand_jedec_params jedec_params;
-	};
+	struct nand_parameters parameters;
 	u16 max_bb_per_die;
 	u32 blocks_per_die;
 
@@ -1535,26 +1542,13 @@ struct platform_nand_data {
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
+	return chip->parameters.async_timing_mode;
 }
 
 int onfi_fill_data_interface(struct nand_chip *chip,
@@ -1591,13 +1585,6 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return 0;
 }
 
-/* return the supported JEDEC features. */
-static inline int jedec_feature(struct nand_chip *chip)
-{
-	return chip->jedec_version ? le16_to_cpu(chip->jedec_params.features)
-		: 0;
-}
-
 /* get timing characteristics from ONFI timing mode. */
 const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
 
-- 
2.14.1
