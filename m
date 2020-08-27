Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBB0C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:55:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C7F2177B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jOOsNz3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34C7F2177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3fPm2mPXhc2n/nKpU8q7RMMunClvDEtyJiMKf9p248=; b=jOOsNz3+Omar92lbEWKaplMvSm
	us9ax17pWTaIKLcJbDVxPPBtW/MQanqXqDS9iuicmOsR/0E+GoFkHew4KPAC3gHsB105710+MqsT9
	J350OWJjf0kox6xkUdecpubps6Iws9qprwxEukddNSqZBXsvMq+VLIg+WH4bHYU2eTTer+Gy+25EJ
	CWrFwAlmjwnNW9Sc3Bqspr7Z57NMPn/FIRYibosG8PHp4dPhVsyDoElYtLI74BNYDWthnaTxgpd7m
	i94WQmTY060+eY2uhKkMgM8bU/z6lVZkX4qOLC70/+2RJ29F+1lRPHOffI3OJXKPh5pwg1OyIQIkp
	0v1ejARw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDg0-0006R8-Rg; Thu, 27 Aug 2020 08:54:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDeb-0005dN-OJ
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 08:53:08 +0000
X-Originating-IP: 77.205.47.153
Received: from xps13.clients.t25.sncf (153.47.205.77.rev.sfr.net
 [77.205.47.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5FC341C000B;
 Thu, 27 Aug 2020 08:52:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v13 14/20] mtd: rawnand: Use
 nanddev_get/set_ecc_requirements() when relevant
Date: Thu, 27 Aug 2020 10:52:02 +0200
Message-Id: <20200827085208.16276-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-1-miquel.raynal@bootlin.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045306_084524_73B366B5 
X-CRM114-Status: GOOD (  22.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Instead of accessing ->strength/step_size directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 10 +++--
 drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  8 ++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c   | 13 +++---
 drivers/mtd/nand/raw/marvell_nand.c          |  8 ++--
 drivers/mtd/nand/raw/mtk_nand.c              |  6 ++-
 drivers/mtd/nand/raw/nand_base.c             | 27 +++++++-----
 drivers/mtd/nand/raw/nand_esmt.c             | 15 ++++---
 drivers/mtd/nand/raw/nand_hynix.c            | 44 +++++++++++---------
 drivers/mtd/nand/raw/nand_jedec.c            |  9 +++-
 drivers/mtd/nand/raw/nand_micron.c           | 17 +++++---
 drivers/mtd/nand/raw/nand_onfi.c             | 17 ++++++--
 drivers/mtd/nand/raw/nand_samsung.c          | 22 ++++++----
 drivers/mtd/nand/raw/nand_toshiba.c          | 14 ++++---
 drivers/mtd/nand/raw/sunxi_nand.c            |  6 ++-
 drivers/mtd/nand/raw/tegra_nand.c            | 12 ++++--
 drivers/mtd/nand/spi/core.c                  |  2 +-
 16 files changed, 144 insertions(+), 86 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0d9cd7faf00d..3d162fdc9ce2 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1043,6 +1043,8 @@ static int atmel_hsmc_nand_pmecc_read_page_raw(struct nand_chip *chip,
 
 static int atmel_nand_pmecc_init(struct nand_chip *chip)
 {
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_nand_controller *nc;
@@ -1072,15 +1074,15 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 		req.ecc.strength = ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH;
 	else if (chip->ecc.strength)
 		req.ecc.strength = chip->ecc.strength;
-	else if (chip->base.eccreq.strength)
-		req.ecc.strength = chip->base.eccreq.strength;
+	else if (requirements->strength)
+		req.ecc.strength = requirements->strength;
 	else
 		req.ecc.strength = ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH;
 
 	if (chip->ecc.size)
 		req.ecc.sectorsize = chip->ecc.size;
-	else if (chip->base.eccreq.step_size)
-		req.ecc.sectorsize = chip->base.eccreq.step_size;
+	else if (requirements->step_size)
+		req.ecc.sectorsize = requirements->step_size;
 	else
 		req.ecc.sectorsize = ATMEL_PMECC_SECTOR_SIZE_AUTO;
 
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index afe27a27cb93..2da39ab89286 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2532,6 +2532,8 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 {
 	struct mtd_info *mtd = nand_to_mtd(&host->chip);
 	struct nand_chip *chip = &host->chip;
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	char msg[128];
@@ -2589,10 +2591,10 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_NONE &&
 	    (!chip->ecc.size || !chip->ecc.strength)) {
-		if (chip->base.eccreq.step_size && chip->base.eccreq.strength) {
+		if (requirements->step_size && requirements->strength) {
 			/* use detected ECC parameters */
-			chip->ecc.size = chip->base.eccreq.step_size;
-			chip->ecc.strength = chip->base.eccreq.strength;
+			chip->ecc.size = requirements->step_size;
+			chip->ecc.strength = requirements->strength;
 			dev_info(ctrl->dev, "Using ECC step-size %d, strength %d\n",
 				chip->ecc.size, chip->ecc.strength);
 		}
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 9b015d360a50..39903a13ef19 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -272,8 +272,8 @@ static int set_geometry_by_ecc_info(struct gpmi_nand_data *this,
 	default:
 		dev_err(this->dev,
 			"unsupported nand chip. ecc bits : %d, ecc size : %d\n",
-			chip->base.eccreq.strength,
-			chip->base.eccreq.step_size);
+			nanddev_get_ecc_requirements(&chip->base)->strength,
+			nanddev_get_ecc_requirements(&chip->base)->step_size);
 		return -EINVAL;
 	}
 	geo->ecc_chunk_size = ecc_step;
@@ -509,6 +509,8 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 
 static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 {
+	struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	struct nand_chip *chip = &this->nand;
 
 	if (chip->ecc.strength > 0 && chip->ecc.size > 0)
@@ -517,13 +519,12 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 
 	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
 				|| legacy_set_geometry(this)) {
-		if (!(chip->base.eccreq.strength > 0 &&
-		      chip->base.eccreq.step_size > 0))
+		if (!(requirements->strength > 0 && requirements->step_size > 0))
 			return -EINVAL;
 
 		return set_geometry_by_ecc_info(this,
-						chip->base.eccreq.strength,
-						chip->base.eccreq.step_size);
+						requirements->strength,
+						requirements->step_size);
 	}
 
 	return 0;
diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 88f8ed051226..f7ff8e93a249 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2247,14 +2247,16 @@ static int marvell_nand_ecc_init(struct mtd_info *mtd,
 				 struct nand_ecc_ctrl *ecc)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 	int ret;
 
 	if (ecc->engine_type != NAND_ECC_ENGINE_TYPE_NONE &&
 	    (!ecc->size || !ecc->strength)) {
-		if (chip->base.eccreq.step_size && chip->base.eccreq.strength) {
-			ecc->size = chip->base.eccreq.step_size;
-			ecc->strength = chip->base.eccreq.strength;
+		if (requirements->step_size && requirements->strength) {
+			ecc->size = requirements->step_size;
+			ecc->strength = requirements->strength;
 		} else {
 			dev_info(nfc->dev,
 				 "No minimum ECC strength, using 1b/512B\n");
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 42966fe22d8b..57f1f1708994 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1253,6 +1253,8 @@ static int mtk_nfc_set_spare_per_sector(u32 *sps, struct mtd_info *mtd)
 static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&nand->base);
 	struct mtk_nfc *nfc = nand_get_controller_data(nand);
 	u32 spare;
 	int free, ret;
@@ -1266,8 +1268,8 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
 	/* if optional dt settings not present */
 	if (!nand->ecc.size || !nand->ecc.strength) {
 		/* use datasheet requirements */
-		nand->ecc.strength = nand->base.eccreq.strength;
-		nand->ecc.size = nand->base.eccreq.step_size;
+		nand->ecc.strength = requirements->strength;
+		nand->ecc.size = requirements->step_size;
 
 		/*
 		 * align eccstrength and eccsize
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4256c2c28714..81caab7b9306 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4755,6 +4755,8 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
 static bool find_full_id_nand(struct nand_chip *chip,
 			      struct nand_flash_dev *type)
 {
+	struct nand_device *base = &chip->base;
+	struct nand_ecc_props requirements;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_memory_organization *memorg;
 	u8 *id_data = chip->id.data;
@@ -4776,8 +4778,9 @@ static bool find_full_id_nand(struct nand_chip *chip,
 					   memorg->pagesize *
 					   memorg->pages_per_eraseblock);
 		chip->options |= type->options;
-		chip->base.eccreq.strength = NAND_ECC_STRENGTH(type);
-		chip->base.eccreq.step_size = NAND_ECC_STEP(type);
+		requirements.strength = NAND_ECC_STRENGTH(type);
+		requirements.step_size = NAND_ECC_STEP(type);
+		nanddev_set_ecc_requirements(base, &requirements);
 
 		chip->parameters.model = kstrdup(type->name, GFP_KERNEL);
 		if (!chip->parameters.model)
@@ -5477,10 +5480,12 @@ static int
 nand_match_ecc_req(struct nand_chip *chip,
 		   const struct nand_ecc_caps *caps, int oobavail)
 {
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_ecc_step_info *stepinfo;
-	int req_step = chip->base.eccreq.step_size;
-	int req_strength = chip->base.eccreq.strength;
+	int req_step = requirements->step_size;
+	int req_strength = requirements->strength;
 	int req_corr, step_size, strength, nsteps, ecc_bytes, ecc_bytes_total;
 	int best_step, best_strength, best_ecc_bytes;
 	int best_ecc_bytes_total = INT_MAX;
@@ -5671,9 +5676,11 @@ static bool nand_ecc_strength_good(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	int corr, ds_corr;
 
-	if (ecc->size == 0 || chip->base.eccreq.step_size == 0)
+	if (ecc->size == 0 || requirements->step_size == 0)
 		/* Not enough information */
 		return true;
 
@@ -5682,10 +5689,10 @@ static bool nand_ecc_strength_good(struct nand_chip *chip)
 	 * the correction density.
 	 */
 	corr = (mtd->writesize * ecc->strength) / ecc->size;
-	ds_corr = (mtd->writesize * chip->base.eccreq.strength) /
-		  chip->base.eccreq.step_size;
+	ds_corr = (mtd->writesize * requirements->strength) /
+		  requirements->step_size;
 
-	return corr >= ds_corr && ecc->strength >= chip->base.eccreq.strength;
+	return corr >= ds_corr && ecc->strength >= requirements->strength;
 }
 
 static int rawnand_erase(struct nand_device *nand, const struct nand_pos *pos)
@@ -5972,8 +5979,8 @@ static int nand_scan_tail(struct nand_chip *chip)
 	if (!nand_ecc_strength_good(chip))
 		pr_warn("WARNING: %s: the ECC used on your system (%db/%dB) is too weak compared to the one required by the NAND chip (%db/%dB)\n",
 			mtd->name, chip->ecc.strength, chip->ecc.size,
-			chip->base.eccreq.strength,
-			chip->base.eccreq.step_size);
+			nanddev_get_ecc_requirements(&chip->base)->strength,
+			nanddev_get_ecc_requirements(&chip->base)->step_size);
 
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
index 3338c68aaaf1..4412c407aef3 100644
--- a/drivers/mtd/nand/raw/nand_esmt.c
+++ b/drivers/mtd/nand/raw/nand_esmt.c
@@ -10,27 +10,32 @@
 
 static void esmt_nand_decode_id(struct nand_chip *chip)
 {
+	struct nand_device *base = &chip->base;
+	struct nand_ecc_props requirements = {};
+
 	nand_decode_ext_id(chip);
 
 	/* Extract ECC requirements from 5th id byte. */
 	if (chip->id.len >= 5 && nand_is_slc(chip)) {
-		chip->base.eccreq.step_size = 512;
+		requirements.step_size = 512;
 		switch (chip->id.data[4] & 0x3) {
 		case 0x0:
-			chip->base.eccreq.strength = 4;
+			requirements.strength = 4;
 			break;
 		case 0x1:
-			chip->base.eccreq.strength = 2;
+			requirements.strength = 2;
 			break;
 		case 0x2:
-			chip->base.eccreq.strength = 1;
+			requirements.strength = 1;
 			break;
 		default:
 			WARN(1, "Could not get ECC info");
-			chip->base.eccreq.step_size = 0;
+			requirements.step_size = 0;
 			break;
 		}
 	}
+
+	nanddev_set_ecc_requirements(base, &requirements);
 }
 
 static int esmt_nand_init(struct nand_chip *chip)
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 6d08eb834456..a9f50c9af109 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -495,34 +495,36 @@ static void hynix_nand_extract_oobsize(struct nand_chip *chip,
 static void hynix_nand_extract_ecc_requirements(struct nand_chip *chip,
 						bool valid_jedecid)
 {
+	struct nand_device *base = &chip->base;
+	struct nand_ecc_props requirements = {};
 	u8 ecc_level = (chip->id.data[4] >> 4) & 0x7;
 
 	if (valid_jedecid) {
 		/* Reference: H27UCG8T2E datasheet */
-		chip->base.eccreq.step_size = 1024;
+		requirements.step_size = 1024;
 
 		switch (ecc_level) {
 		case 0:
-			chip->base.eccreq.step_size = 0;
-			chip->base.eccreq.strength = 0;
+			requirements.step_size = 0;
+			requirements.strength = 0;
 			break;
 		case 1:
-			chip->base.eccreq.strength = 4;
+			requirements.strength = 4;
 			break;
 		case 2:
-			chip->base.eccreq.strength = 24;
+			requirements.strength = 24;
 			break;
 		case 3:
-			chip->base.eccreq.strength = 32;
+			requirements.strength = 32;
 			break;
 		case 4:
-			chip->base.eccreq.strength = 40;
+			requirements.strength = 40;
 			break;
 		case 5:
-			chip->base.eccreq.strength = 50;
+			requirements.strength = 50;
 			break;
 		case 6:
-			chip->base.eccreq.strength = 60;
+			requirements.strength = 60;
 			break;
 		default:
 			/*
@@ -543,14 +545,14 @@ static void hynix_nand_extract_ecc_requirements(struct nand_chip *chip,
 		if (nand_tech < 3) {
 			/* > 26nm, reference: H27UBG8T2A datasheet */
 			if (ecc_level < 5) {
-				chip->base.eccreq.step_size = 512;
-				chip->base.eccreq.strength = 1 << ecc_level;
+				requirements.step_size = 512;
+				requirements.strength = 1 << ecc_level;
 			} else if (ecc_level < 7) {
 				if (ecc_level == 5)
-					chip->base.eccreq.step_size = 2048;
+					requirements.step_size = 2048;
 				else
-					chip->base.eccreq.step_size = 1024;
-				chip->base.eccreq.strength = 24;
+					requirements.step_size = 1024;
+				requirements.strength = 24;
 			} else {
 				/*
 				 * We should never reach this case, but if that
@@ -563,18 +565,20 @@ static void hynix_nand_extract_ecc_requirements(struct nand_chip *chip,
 		} else {
 			/* <= 26nm, reference: H27UBG8T2B datasheet */
 			if (!ecc_level) {
-				chip->base.eccreq.step_size = 0;
-				chip->base.eccreq.strength = 0;
+				requirements.step_size = 0;
+				requirements.strength = 0;
 			} else if (ecc_level < 5) {
-				chip->base.eccreq.step_size = 512;
-				chip->base.eccreq.strength = 1 << (ecc_level - 1);
+				requirements.step_size = 512;
+				requirements.strength = 1 << (ecc_level - 1);
 			} else {
-				chip->base.eccreq.step_size = 1024;
-				chip->base.eccreq.strength = 24 +
+				requirements.step_size = 1024;
+				requirements.strength = 24 +
 							(8 * (ecc_level - 5));
 			}
 		}
 	}
+
+	nanddev_set_ecc_requirements(base, &requirements);
 }
 
 static void hynix_nand_extract_scrambling_requirements(struct nand_chip *chip,
diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index b15c42f48755..85b6d9372d80 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -23,6 +23,7 @@
  */
 int nand_jedec_detect(struct nand_chip *chip)
 {
+	struct nand_device *base = &chip->base;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_memory_organization *memorg;
 	struct nand_jedec_params *p;
@@ -120,8 +121,12 @@ int nand_jedec_detect(struct nand_chip *chip)
 	ecc = &p->ecc_info[0];
 
 	if (ecc->codeword_size >= 9) {
-		chip->base.eccreq.strength = ecc->ecc_bits;
-		chip->base.eccreq.step_size = 1 << ecc->codeword_size;
+		struct nand_ecc_props requirements = {
+			.strength = ecc->ecc_bits,
+			.step_size = 1 << ecc->codeword_size,
+		};
+
+		nanddev_set_ecc_requirements(base, &requirements);
 	} else {
 		pr_warn("Invalid codeword size\n");
 	}
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index c43afaf21482..c0192881906b 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -413,6 +413,8 @@ enum {
  */
 static int micron_supports_on_die_ecc(struct nand_chip *chip)
 {
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	u8 id[5];
 	int ret;
 
@@ -425,7 +427,7 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	/*
 	 * We only support on-die ECC of 4/512 or 8/512
 	 */
-	if  (chip->base.eccreq.strength != 4 && chip->base.eccreq.strength != 8)
+	if  (requirements->strength != 4 && requirements->strength != 8)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	/* 0x2 means on-die ECC is available. */
@@ -466,7 +468,7 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	/*
 	 * We only support on-die ECC of 4/512 or 8/512
 	 */
-	if  (chip->base.eccreq.strength != 4 && chip->base.eccreq.strength != 8)
+	if  (requirements->strength != 4 && requirements->strength != 8)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
 	return MICRON_ON_DIE_SUPPORTED;
@@ -474,6 +476,9 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 
 static int micron_nand_init(struct nand_chip *chip)
 {
+	struct nand_device *base = &chip->base;
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(base);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct micron_nand *micron;
 	int ondie;
@@ -523,7 +528,7 @@ static int micron_nand_init(struct nand_chip *chip)
 		 * That's not needed for 8-bit ECC, because the status expose
 		 * a better approximation of the number of bitflips in a page.
 		 */
-		if (chip->base.eccreq.strength == 4) {
+		if (requirements->strength == 4) {
 			micron->ecc.rawbuf = kmalloc(mtd->writesize +
 						     mtd->oobsize,
 						     GFP_KERNEL);
@@ -533,16 +538,16 @@ static int micron_nand_init(struct nand_chip *chip)
 			}
 		}
 
-		if (chip->base.eccreq.strength == 4)
+		if (requirements->strength == 4)
 			mtd_set_ooblayout(mtd,
 					  &micron_nand_on_die_4_ooblayout_ops);
 		else
 			mtd_set_ooblayout(mtd,
 					  &micron_nand_on_die_8_ooblayout_ops);
 
-		chip->ecc.bytes = chip->base.eccreq.strength * 2;
+		chip->ecc.bytes = requirements->strength * 2;
 		chip->ecc.size = 512;
-		chip->ecc.strength = chip->base.eccreq.strength;
+		chip->ecc.strength = requirements->strength;
 		chip->ecc.algo = NAND_ECC_ALGO_BCH;
 		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
 		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index be3456627288..45649e03797d 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -34,6 +34,8 @@ u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
 static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 					    struct nand_onfi_params *p)
 {
+	struct nand_device *base = &chip->base;
+	struct nand_ecc_props requirements;
 	struct onfi_ext_param_page *ep;
 	struct onfi_ext_section *s;
 	struct onfi_ext_ecc_info *ecc;
@@ -94,8 +96,10 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 		goto ext_out;
 	}
 
-	chip->base.eccreq.strength = ecc->ecc_bits;
-	chip->base.eccreq.step_size = 1 << ecc->codeword_size;
+	requirements.strength = ecc->ecc_bits;
+	requirements.step_size = 1 << ecc->codeword_size;
+	nanddev_set_ecc_requirements(base, &requirements);
+
 	ret = 0;
 
 ext_out:
@@ -139,6 +143,7 @@ static void nand_bit_wise_majority(const void **srcbufs,
  */
 int nand_onfi_detect(struct nand_chip *chip)
 {
+	struct nand_device *base = &chip->base;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_memory_organization *memorg;
 	struct nand_onfi_params *p = NULL, *pbuf;
@@ -265,8 +270,12 @@ int nand_onfi_detect(struct nand_chip *chip)
 		chip->options |= NAND_BUSWIDTH_16;
 
 	if (p->ecc_bits != 0xff) {
-		chip->base.eccreq.strength = p->ecc_bits;
-		chip->base.eccreq.step_size = 512;
+		struct nand_ecc_props requirements = {
+			.strength = p->ecc_bits,
+			.step_size = 512,
+		};
+
+		nanddev_set_ecc_requirements(base, &requirements);
 	} else if (onfi_version >= 21 &&
 		(le16_to_cpu(p->features) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
 
diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
index 3a4a19e808f6..0be6b7563805 100644
--- a/drivers/mtd/nand/raw/nand_samsung.c
+++ b/drivers/mtd/nand/raw/nand_samsung.c
@@ -10,6 +10,8 @@
 
 static void samsung_nand_decode_id(struct nand_chip *chip)
 {
+	struct nand_device *base = &chip->base;
+	struct nand_ecc_props requirements = {};
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_memory_organization *memorg;
 
@@ -71,23 +73,23 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 		/* Extract ECC requirements from 5th id byte*/
 		extid = (chip->id.data[4] >> 4) & 0x07;
 		if (extid < 5) {
-			chip->base.eccreq.step_size = 512;
-			chip->base.eccreq.strength = 1 << extid;
+			requirements.step_size = 512;
+			requirements.strength = 1 << extid;
 		} else {
-			chip->base.eccreq.step_size = 1024;
+			requirements.step_size = 1024;
 			switch (extid) {
 			case 5:
-				chip->base.eccreq.strength = 24;
+				requirements.strength = 24;
 				break;
 			case 6:
-				chip->base.eccreq.strength = 40;
+				requirements.strength = 40;
 				break;
 			case 7:
-				chip->base.eccreq.strength = 60;
+				requirements.strength = 60;
 				break;
 			default:
 				WARN(1, "Could not decode ECC info");
-				chip->base.eccreq.step_size = 0;
+				requirements.step_size = 0;
 			}
 		}
 	} else {
@@ -97,8 +99,8 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 			switch (chip->id.data[1]) {
 			/* K9F4G08U0D-S[I|C]B0(T00) */
 			case 0xDC:
-				chip->base.eccreq.step_size = 512;
-				chip->base.eccreq.strength = 1;
+				requirements.step_size = 512;
+				requirements.strength = 1;
 				break;
 
 			/* K9F1G08U0E 21nm chips do not support subpage write */
@@ -112,6 +114,8 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 			}
 		}
 	}
+
+	nanddev_set_ecc_requirements(base, &requirements);
 }
 
 static int samsung_nand_init(struct nand_chip *chip)
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 7ba0516c6247..fb6662337b90 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -145,6 +145,8 @@ static void toshiba_nand_benand_init(struct nand_chip *chip)
 
 static void toshiba_nand_decode_id(struct nand_chip *chip)
 {
+	struct nand_device *base = &chip->base;
+	struct nand_ecc_props requirements = {};
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_memory_organization *memorg;
 
@@ -175,23 +177,25 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 	 *  - 24nm: 8 bit ECC for each 512Byte is required.
 	 */
 	if (chip->id.len >= 6 && nand_is_slc(chip)) {
-		chip->base.eccreq.step_size = 512;
+		requirements.step_size = 512;
 		switch (chip->id.data[5] & 0x7) {
 		case 0x4:
-			chip->base.eccreq.strength = 1;
+			requirements.strength = 1;
 			break;
 		case 0x5:
-			chip->base.eccreq.strength = 4;
+			requirements.strength = 4;
 			break;
 		case 0x6:
-			chip->base.eccreq.strength = 8;
+			requirements.strength = 8;
 			break;
 		default:
 			WARN(1, "Could not get ECC info");
-			chip->base.eccreq.step_size = 0;
+			requirements.step_size = 0;
 			break;
 		}
 	}
+
+	nanddev_set_ecc_requirements(base, &requirements);
 }
 
 static int
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c78276de7c37..b7b764ef4b1d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1732,6 +1732,8 @@ static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct device_node *np = nand_get_flash_node(nand);
 	int ret;
@@ -1745,8 +1747,8 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	nand->options |= NAND_SUBPAGE_READ;
 
 	if (!ecc->size) {
-		ecc->size = nand->base.eccreq.step_size;
-		ecc->strength = nand->base.eccreq.strength;
+		ecc->size = requirements->step_size;
+		ecc->strength = requirements->strength;
 	}
 
 	if (!ecc->size || !ecc->strength)
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index cc72a2de8891..100c18ef8fe8 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -840,6 +840,8 @@ static int tegra_nand_get_strength(struct nand_chip *chip, const int *strength,
 				   int strength_len, int bits_per_step,
 				   int oobsize)
 {
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	bool maximize = chip->ecc.options & NAND_ECC_MAXIMIZE;
 	int i;
 
@@ -855,7 +857,7 @@ static int tegra_nand_get_strength(struct nand_chip *chip, const int *strength,
 		} else {
 			strength_sel = strength[i];
 
-			if (strength_sel < chip->base.eccreq.strength)
+			if (strength_sel < requirements->strength)
 				continue;
 		}
 
@@ -908,6 +910,8 @@ static int tegra_nand_select_strength(struct nand_chip *chip, int oobsize)
 static int tegra_nand_attach_chip(struct nand_chip *chip)
 {
 	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
 	struct tegra_nand_chip *nand = to_tegra_chip(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int bits_per_step;
@@ -919,9 +923,9 @@ static int tegra_nand_attach_chip(struct nand_chip *chip)
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 	chip->ecc.size = 512;
 	chip->ecc.steps = mtd->writesize / chip->ecc.size;
-	if (chip->base.eccreq.step_size != 512) {
+	if (requirements->step_size != 512) {
 		dev_err(ctrl->dev, "Unsupported step size %d\n",
-			chip->base.eccreq.step_size);
+			requirements->step_size);
 		return -EINVAL;
 	}
 
@@ -952,7 +956,7 @@ static int tegra_nand_attach_chip(struct nand_chip *chip)
 		if (ret < 0) {
 			dev_err(ctrl->dev,
 				"No valid strength found, minimum %d\n",
-				chip->base.eccreq.strength);
+				requirements->strength);
 			return ret;
 		}
 
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 56019de28a90..0939e0f9c6a4 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -903,7 +903,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			continue;
 
 		nand->memorg = table[i].memorg;
-		nand->eccreq = table[i].eccreq;
+		nanddev_set_ecc_requirements(nand, &table[i].eccreq);
 		spinand->eccinfo = table[i].eccinfo;
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
