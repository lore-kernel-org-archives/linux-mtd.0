Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E3BC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 00:38:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D800420897
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 00:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuAPjPq6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D800420897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu5T3RtVasepDFAaAfdeeOhpwBiBaPNHN+k5j/BQ834=; b=HuAPjPq66mFUug
	GXx19FgkUakBYOU9bxlH008hXjJKb3sEMoRk7L0MLJ6IASSFk7vpD+LKkjAjd8Lb5KUQeHM7LYJs9
	RTYeHZ5sv3sZmEBuREjazyLDXQtPumAbFuwgDr3I3pENcbMrm6piv9xYKzcqi61iGOlVItMi8TKSF
	7x4TSpHzyOQBADAyMzhSaoSVEgvZ3+c4is+ds4n9gjj4XL0zytAiNn2+Jg6f5l19skFdDYlNFSJjT
	zga18rtFBPxkZupkQSW8y7Q43UmnjlVsdr3trNEnzHJhcE1zVJnUSGBaGNRBgtewE+YGP8NcAAoyv
	oPemDmQISo+s4D1cQReQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeT2d-0005Fs-TM; Fri, 29 May 2020 00:38:31 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeSqS-0006If-I7; Fri, 29 May 2020 00:26:06 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0D5A2200005;
 Fri, 29 May 2020 00:25:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 18/20] mtd: rawnand: Write a compatibility layer
Date: Fri, 29 May 2020 02:25:15 +0200
Message-Id: <20200529002517.3546-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529002517.3546-1-miquel.raynal@bootlin.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_172556_918298_8CA3DE0E 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, Weijie Gao <weijie.gao@mediatek.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Before moving generic bits from the raw NAND core to the generic NAND
core, let's disociate clearly what is a rawnand legacy property, and
what should be made public to other NAND users.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 158 +++++++++++++++++++++----------
 include/linux/mtd/rawnand.h      |  12 ---
 2 files changed, 107 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 1eb478ec1d1c..0ddbae037eaf 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5026,14 +5026,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
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
 static const char * const nand_ecc_placement[] = {
 	[NAND_ECC_PLACEMENT_OOB] = "oob",
 	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
@@ -5042,7 +5034,30 @@ static const char * const nand_ecc_placement[] = {
 static enum nand_ecc_engine_type
 of_get_nand_ecc_engine_type(struct device_node *np)
 {
-	enum nand_ecc_mode eng_type;
+	return NAND_ECC_ENGINE_TYPE_INVALID;
+}
+
+static enum nand_ecc_engine_type
+of_get_rawnand_ecc_engine_type_legacy(struct device_node *np)
+{
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
 
@@ -5051,12 +5066,13 @@ of_get_nand_ecc_engine_type(struct device_node *np)
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
@@ -5069,14 +5085,6 @@ of_get_nand_ecc_engine_type(struct device_node *np)
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
 
@@ -5088,17 +5096,22 @@ enum nand_ecc_placement of_get_nand_ecc_placement(struct device_node *np)
 
 	err = of_property_read_string(np, "nand-ecc-placement", &pm);
 	if (!err) {
-		for (placement = NAND_ECC_PLACEMENT_INTERLEAVED;
+		for (placement = NAND_ECC_PLACEMENT_OOB;
 		     placement < ARRAY_SIZE(nand_ecc_placement); placement++) {
 			if (!strcasecmp(pm, nand_ecc_placement[placement]))
 				return placement;
 		}
 	}
 
-	/*
-	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into the nand_ecc_placement enum anymore.
-	 */
+	return NAND_ECC_PLACEMENT_UNKNOWN;
+}
+
+enum nand_ecc_placement
+of_get_rawnand_ecc_placement_legacy(struct device_node *np)
+{
+	const char *pm;
+	int err;
+
 	err = of_property_read_string(np, "nand-ecc-mode", &pm);
 	if (!err) {
 		if (!strcasecmp(pm, "hw_syndrome"))
@@ -5130,10 +5143,14 @@ static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
 		}
 	}
 
-	/*
-	 * For backward compatibility we also read "nand-ecc-mode" checking
-	 * for some obsoleted values that were specifying ECC algorithm.
-	 */
+	return NAND_ECC_ALGO_UNKNOWN;
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
@@ -5163,6 +5180,41 @@ static int of_get_nand_ecc_strength(struct device_node *np)
 	return ret ? ret : val;
 }
 
+static void nand_ecc_read_user_conf(struct nand_chip *chip)
+{
+	struct device_node *dn = nand_get_flash_node(chip);
+	struct nand_device *nand = &chip->base;
+	int strength, size;
+
+	nand->ecc.user_conf.engine_type = of_get_nand_ecc_engine_type(dn);
+	nand->ecc.user_conf.algo = of_get_nand_ecc_algo(dn);
+	nand->ecc.user_conf.placement = of_get_nand_ecc_placement(dn);
+
+	strength = of_get_nand_ecc_strength(dn);
+	if (strength >= 0)
+		nand->ecc.user_conf.strength = strength;
+
+	size = of_get_nand_ecc_step_size(dn);
+	if (size >= 0)
+		nand->ecc.user_conf.step_size = size;
+}
+
+static void rawnand_ecc_read_legacy_user_conf(struct nand_chip *chip)
+{
+	struct device_node *dn = nand_get_flash_node(chip);
+	struct nand_device *nand = &chip->base;
+	struct nand_ecc_props *user_conf = &nand->ecc.user_conf;
+
+	if (user_conf->engine_type != NAND_ECC_ENGINE_TYPE_INVALID)
+		user_conf->engine_type = of_get_rawnand_ecc_engine_type_legacy(dn);
+
+	if (user_conf->algo != NAND_ECC_ALGO_UNKNOWN)
+		user_conf->algo = of_get_rawnand_ecc_algo_legacy(dn);
+
+	if (user_conf->placement != NAND_ECC_PLACEMENT_UNKNOWN)
+		user_conf->placement = of_get_rawnand_ecc_placement_legacy(dn);
+}
+
 static int of_get_nand_bus_width(struct device_node *np)
 {
 	u32 val;
@@ -5184,12 +5236,10 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
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
@@ -5203,27 +5253,33 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (of_get_nand_on_flash_bbt(dn))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	ecc_type = of_get_nand_ecc_engine_type(dn);
-	ecc_algo = of_get_nand_ecc_algo(dn);
-	chip->ecc.placement = of_get_nand_ecc_placement(dn);
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
 
+	nand_ecc_read_user_conf(chip);
+	rawnand_ecc_read_legacy_user_conf(chip);
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
 
@@ -5260,7 +5316,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	/* Enforce the right timings for reset/detection */
 	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
 
-	ret = nand_dt_init(chip);
+	ret = rawnand_dt_init(chip);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 106f3698875d..123d48edce67 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -80,18 +80,6 @@ struct nand_chip;
 
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
