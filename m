Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FD9C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD922177B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZMj31IR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFD922177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nipQDg1s/aUvYF6RA+Kw0kETCVUuwxnIwrCf2HgUWA8=; b=ZZMj31IRkSXVkpuBe+E91cNkAP
	z/MQzn/ZTPguszfqdQ/HhTetEtSjEuFRJWm/Q/1vVLGy7d/G3HNZR051kKU/MJEwxH1TnHdhgrOSw
	SSw8klFYgtNGLolZ2yDkFeyWm6Q1wE8vmZ54OqgT+V7tmq5Qlh1GDW11kVFTGK7iTEo6pqJXZ+XTv
	/Z1DOrykj/VuH6f2Wh77rASgIkxBQ0fKmnZ9IU75LMtwdufFZs3WGKLeOK/2Zq5PyhZf6/TjD/1s2
	2TaF80yQ9Bu5PYUqtY1wpPEDmDvN4clmzofdtsqFnzL0gN0DIiKVvZG3fNclns4grLDwqjWQzy4Lf
	68jqmj+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDge-0006xy-Fs; Thu, 27 Aug 2020 08:55:12 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDgA-0006ZW-DN
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 08:54:44 +0000
X-Originating-IP: 77.205.47.153
Received: from xps13.clients.t25.sncf (153.47.205.77.rev.sfr.net
 [77.205.47.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CF1DD1C0003;
 Thu, 27 Aug 2020 08:54:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v13 19/20] mtd: rawnand: Use the ECC framework user input
 parsing bits
Date: Thu, 27 Aug 2020 10:52:07 +0200
Message-Id: <20200827085208.16276-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-1-miquel.raynal@bootlin.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045443_676815_097DB4D7 
X-CRM114-Status: GOOD (  21.31  )
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

Many helpers are generic to all NAND chips, they should not be
raw-NAND specific, so use the generic ones.

To avoid moving all the raw NAND core "history" into the generic NAND
layer, we keep a part of this parsing in the raw NAND core to ensure
backward compatibility.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 144 +++++++++++++++----------------
 include/linux/mtd/rawnand.h      |  12 ---
 2 files changed, 71 insertions(+), 85 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 66443986d80f..6a5f5699514f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4882,18 +4882,27 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	return ret;
 }
 
-static const char * const nand_ecc_modes[] = {
-	[NAND_ECC_NONE]		= "none",
-	[NAND_ECC_SOFT]		= "soft",
-	[NAND_ECC_HW]		= "hw",
-	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
-	[NAND_ECC_ON_DIE]	= "on-die",
-};
-
 static enum nand_ecc_engine_type
-of_get_nand_ecc_engine_type(struct device_node *np)
+of_get_rawnand_ecc_engine_type_legacy(struct device_node *np)
 {
-	enum nand_ecc_mode eng_type;
+	enum nand_ecc_legacy_mode {
+		NAND_ECC_INVALID,
+		NAND_ECC_NONE,
+		NAND_ECC_SOFT,
+		NAND_ECC_SOFT_BCH,
+		NAND_ECC_HW,
+		NAND_ECC_HW_SYNDROME,
+		NAND_ECC_ON_DIE,
+	};
+	const char * const nand_ecc_legacy_modes[] = {
+		[NAND_ECC_NONE]		= "none",
+		[NAND_ECC_SOFT]		= "soft",
+		[NAND_ECC_SOFT_BCH]	= "soft_bch",
+		[NAND_ECC_HW]		= "hw",
+		[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
+		[NAND_ECC_ON_DIE]	= "on-die",
+	};
+	enum nand_ecc_legacy_mode eng_type;
 	const char *pm;
 	int err;
 
@@ -4902,12 +4911,13 @@ of_get_nand_ecc_engine_type(struct device_node *np)
 		return NAND_ECC_ENGINE_TYPE_INVALID;
 
 	for (eng_type = NAND_ECC_NONE;
-	     eng_type < ARRAY_SIZE(nand_ecc_modes); eng_type++) {
-		if (!strcasecmp(pm, nand_ecc_modes[eng_type])) {
+	     eng_type < ARRAY_SIZE(nand_ecc_legacy_modes); eng_type++) {
+		if (!strcasecmp(pm, nand_ecc_legacy_modes[eng_type])) {
 			switch (eng_type) {
 			case NAND_ECC_NONE:
 				return NAND_ECC_ENGINE_TYPE_NONE;
 			case NAND_ECC_SOFT:
+			case NAND_ECC_SOFT_BCH:
 				return NAND_ECC_ENGINE_TYPE_SOFT;
 			case NAND_ECC_HW:
 			case NAND_ECC_HW_SYNDROME:
@@ -4920,43 +4930,29 @@ of_get_nand_ecc_engine_type(struct device_node *np)
 		}
 	}
 
-	/*
-	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into the nand_ecc_engine_providers enum anymore
-	 * (they were merged with other enums).
-	 */
-	if (!strcasecmp(pm, "soft_bch"))
-		return NAND_ECC_ENGINE_TYPE_SOFT;
-
 	return NAND_ECC_ENGINE_TYPE_INVALID;
 }
 
-static const char * const nand_ecc_algos[] = {
-	[NAND_ECC_ALGO_HAMMING]	= "hamming",
-	[NAND_ECC_ALGO_BCH]	= "bch",
-	[NAND_ECC_ALGO_RS]	= "rs",
-};
-
-static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
+enum nand_ecc_placement
+of_get_rawnand_ecc_placement_legacy(struct device_node *np)
 {
-	enum nand_ecc_algo ecc_algo;
 	const char *pm;
 	int err;
 
-	err = of_property_read_string(np, "nand-ecc-algo", &pm);
+	err = of_property_read_string(np, "nand-ecc-mode", &pm);
 	if (!err) {
-		for (ecc_algo = NAND_ECC_ALGO_HAMMING;
-		     ecc_algo < ARRAY_SIZE(nand_ecc_algos);
-		     ecc_algo++) {
-			if (!strcasecmp(pm, nand_ecc_algos[ecc_algo]))
-				return ecc_algo;
-		}
+		if (!strcasecmp(pm, "hw_syndrome"))
+			return NAND_ECC_PLACEMENT_INTERLEAVED;
 	}
 
-	/*
-	 * For backward compatibility we also read "nand-ecc-mode" checking
-	 * for some obsoleted values that were specifying ECC algorithm.
-	 */
+	return NAND_ECC_PLACEMENT_UNKNOWN;
+}
+
+static enum nand_ecc_algo of_get_rawnand_ecc_algo_legacy(struct device_node *np)
+{
+	const char *pm;
+	int err;
+
 	err = of_property_read_string(np, "nand-ecc-mode", &pm);
 	if (!err) {
 		if (!strcasecmp(pm, "soft"))
@@ -4968,22 +4964,19 @@ static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
 	return NAND_ECC_ALGO_UNKNOWN;
 }
 
-static int of_get_nand_ecc_step_size(struct device_node *np)
+static void of_get_nand_ecc_legacy_user_config(struct nand_chip *chip)
 {
-	int ret;
-	u32 val;
+	struct device_node *dn = nand_get_flash_node(chip);
+	struct nand_ecc_props *user_conf = &chip->base.ecc.user_conf;
 
-	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
-	return ret ? ret : val;
-}
+	if (user_conf->engine_type != NAND_ECC_ENGINE_TYPE_INVALID)
+		user_conf->engine_type = of_get_rawnand_ecc_engine_type_legacy(dn);
 
-static int of_get_nand_ecc_strength(struct device_node *np)
-{
-	int ret;
-	u32 val;
+	if (user_conf->algo != NAND_ECC_ALGO_UNKNOWN)
+		user_conf->algo = of_get_rawnand_ecc_algo_legacy(dn);
 
-	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
-	return ret ? ret : val;
+	if (user_conf->placement != NAND_ECC_PLACEMENT_UNKNOWN)
+		user_conf->placement = of_get_rawnand_ecc_placement_legacy(dn);
 }
 
 static int of_get_nand_bus_width(struct device_node *np)
@@ -5007,12 +5000,10 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
-static int nand_dt_init(struct nand_chip *chip)
+static int rawnand_dt_init(struct nand_chip *chip)
 {
+	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
 	struct device_node *dn = nand_get_flash_node(chip);
-	enum nand_ecc_engine_type ecc_type;
-	enum nand_ecc_algo ecc_algo;
-	int ecc_strength, ecc_step;
 
 	if (!dn)
 		return 0;
@@ -5026,26 +5017,33 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (of_get_nand_on_flash_bbt(dn))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	ecc_type = of_get_nand_ecc_engine_type(dn);
-	ecc_algo = of_get_nand_ecc_algo(dn);
-	ecc_strength = of_get_nand_ecc_strength(dn);
-	ecc_step = of_get_nand_ecc_step_size(dn);
-
-	if (ecc_type != NAND_ECC_ENGINE_TYPE_INVALID)
-		chip->ecc.engine_type = ecc_type;
-
-	if (ecc_algo != NAND_ECC_ALGO_UNKNOWN)
-		chip->ecc.algo = ecc_algo;
-
-	if (ecc_strength >= 0)
-		chip->ecc.strength = ecc_strength;
-
-	if (ecc_step > 0)
-		chip->ecc.size = ecc_step;
-
 	if (of_property_read_bool(dn, "nand-ecc-maximize"))
 		chip->ecc.options |= NAND_ECC_MAXIMIZE;
 
+	of_get_nand_ecc_user_config(nand);
+	of_get_nand_ecc_legacy_user_config(chip);
+
+	/*
+	 * If neither the user nor the NAND controller have requested a specific
+	 * ECC engine type, we will default to NAND_ECC_ENGINE_TYPE_ON_HOST.
+	 */
+	nand->ecc.defaults.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+
+	/*
+	 * Use the user requested engine type, unless there is none, in this
+	 * case default to the NAND controller choice, otherwise fallback to
+	 * the raw NAND default one.
+	 */
+	if (nand->ecc.user_conf.engine_type != NAND_ECC_ENGINE_TYPE_INVALID)
+		chip->ecc.engine_type = nand->ecc.user_conf.engine_type;
+	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_INVALID)
+		chip->ecc.engine_type = nand->ecc.defaults.engine_type;
+
+	chip->ecc.placement = nand->ecc.user_conf.placement;
+	chip->ecc.algo = nand->ecc.user_conf.algo;
+	chip->ecc.strength = nand->ecc.user_conf.strength;
+	chip->ecc.size = nand->ecc.user_conf.step_size;
+
 	return 0;
 }
 
@@ -5082,7 +5080,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	/* Enforce the right timings for reset/detection */
 	chip->current_interface_config = nand_get_reset_interface_config();
 
-	ret = nand_dt_init(chip);
+	ret = rawnand_dt_init(chip);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 1bbce6fa1b08..671e60948deb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -81,18 +81,6 @@ struct nand_chip;
 
 #define NAND_DATA_IFACE_CHECK_ONLY	-1
 
-/*
- * Constants for ECC_MODES
- */
-enum nand_ecc_mode {
-	NAND_ECC_INVALID,
-	NAND_ECC_NONE,
-	NAND_ECC_SOFT,
-	NAND_ECC_HW,
-	NAND_ECC_HW_SYNDROME,
-	NAND_ECC_ON_DIE,
-};
-
 /*
  * Constants for Hardware ECC
  */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
