Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B23C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:49:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C842070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5E7TWO5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SijS35aW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C842070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4NEK0H3NuPBVbvueyuFdKGSdljOdclW56Ofb4/e700=; b=b5E7TWO5KBY4Bh
	pZ2cIxjEtK8EHqBnVmjTjOaM9qbGtt4BunuD2JC8ZI7GaImSpqygubXaRl5Dzi5GZykTV6lnXIE5A
	QtlQyp3PAu7Z3y59MnPD4UH2TUrON5QDebeyHLYJK6m6snT/QF4dYuaomLk9rpEx3EzaDtIp3VQi/
	47uLsj7A+q66Fj7rObh/WWblSfF1O6NTV2eL0MbKGV4/auDNvIYZn8YAfVtEanr5m7+dc1VCiV4Gg
	YrSvLtzdoZjedZ/vRhr2Q6iZLdm43mMOclPMgWVKZC+XDDwf0miU8y8aMtmTSn7GQ12Il8pvSAP6b
	ZJaMCwVBB0tPs9hgXwFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wOt-0003ga-1T; Mon, 04 Mar 2019 22:49:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wMk-0000N8-F2; Mon, 04 Mar 2019 22:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7twpCMJQNKJ7PTkmpzXoR2DfYxn3YPau/EdhozYPQ9c=; b=SijS35aWtX2DMQsOvi97aBGjGD
 hSFmXExCh13PQsqPUK330Y5uzgauiRmyRPYdgKLVvtu/6cX11FqDHuneSNgY6BIgndv3/7LhC5b0m
 pNAGu6GEwp6k3/AbDfBgFTQXdDjN+jYSMmT59TZf317VONnDn6irz4+9O6fJzWGWax2pHLbAbcMlS
 nJAu6UZpHTlAHsKPG3ZqB5mT0cNOTvtAQcOep+pZTuTYtV3deZ9oRT7Nk7buKg6FYyWMJk+Tylfs0
 umVhWuZVqYs9XCrtr7tCxZkI6MHCiB7UMkZO0EjCAhQ6L0QA0UT8XssLuMEd4OnbnOQXkV+MttStI
 6KAykeXA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6B-00030o-On; Mon, 04 Mar 2019 22:30:18 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F3D09240004;
 Mon,  4 Mar 2019 22:29:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 13/36] mtd: nand: Move ECC specific functions to
 ecc/engine.c
Date: Mon,  4 Mar 2019 23:28:18 +0100
Message-Id: <20190304222841.13899-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_223015_846000_09CB00BB 
X-CRM114-Status: GOOD (  29.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move generic code that will benefit to be shared out of the raw NAND
subsystem.

While at it, remove the maximize option from the NAND chip structure
and move it into a user configuration flag.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/engine.c                | 156 ++++++++++++++++
 drivers/mtd/nand/raw/atmel/nand-controller.c |   3 +-
 drivers/mtd/nand/raw/denali.c                |   3 +
 drivers/mtd/nand/raw/denali_pci.c            |   1 -
 drivers/mtd/nand/raw/nand_base.c             | 176 +++----------------
 drivers/mtd/nand/raw/sunxi_nand.c            |   3 +-
 drivers/mtd/nand/raw/tegra_nand.c            |   3 +-
 include/linux/mtd/nand.h                     |  33 ++++
 include/linux/mtd/rawnand.h                  |  22 +--
 9 files changed, 226 insertions(+), 174 deletions(-)

diff --git a/drivers/mtd/nand/ecc/engine.c b/drivers/mtd/nand/ecc/engine.c
index f52ffce8e684..c6779acc936d 100644
--- a/drivers/mtd/nand/ecc/engine.c
+++ b/drivers/mtd/nand/ecc/engine.c
@@ -294,6 +294,162 @@ const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 };
 EXPORT_SYMBOL_GPL(nand_ooblayout_lp_hamming_ops);
 
+static const char * const nand_ecc_modes[] = {
+	[NAND_ECC_NONE]		= "none",
+	[NAND_ECC_SOFT]		= "soft",
+	[NAND_ECC_HW]		= "hw",
+	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
+	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
+	[NAND_ECC_ON_DIE]	= "on-die",
+};
+
+static int of_get_nand_ecc_provider(struct device_node *np)
+{
+	const char *pm;
+	int err, i;
+
+	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	if (err < 0)
+		return err;
+
+	for (i = NAND_ECC_NONE; i < ARRAY_SIZE(nand_ecc_modes); i++)
+		if (!strcasecmp(pm, nand_ecc_modes[i]))
+			return i;
+
+	/*
+	 * For backward compatibility we support few obsoleted values that don't
+	 * have their mappings into the nand_ecc_modes enumeration anymore (they
+	 * were merged with other enums).
+	 */
+	if (!strcasecmp(pm, "soft_bch"))
+		return NAND_ECC_SOFT;
+
+	return -ENODEV;
+}
+
+static const char * const nand_ecc_algos[] = {
+	[NAND_ECC_HAMMING]	= "hamming",
+	[NAND_ECC_BCH]		= "bch",
+	[NAND_ECC_RS]		= "rs",
+};
+
+static int of_get_nand_ecc_algo(struct device_node *np)
+{
+	const char *pm;
+	int err, i;
+
+	err = of_property_read_string(np, "nand-ecc-algo", &pm);
+	if (!err) {
+		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
+			if (!strcasecmp(pm, nand_ecc_algos[i]))
+				return i;
+		return -ENODEV;
+	}
+
+	/*
+	 * For backward compatibility we also read "nand-ecc-mode" checking
+	 * for some obsoleted values that were specifying ECC algorithm.
+	 */
+	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	if (err < 0)
+		return err;
+
+	if (!strcasecmp(pm, "soft"))
+		return NAND_ECC_HAMMING;
+	else if (!strcasecmp(pm, "soft_bch"))
+		return NAND_ECC_BCH;
+
+	return -ENODEV;
+}
+
+static int of_get_nand_ecc_step_size(struct device_node *np)
+{
+	int ret;
+	u32 val;
+
+	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
+	return ret ? ret : val;
+}
+
+static int of_get_nand_ecc_strength(struct device_node *np)
+{
+	int ret;
+	u32 val;
+
+	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
+	return ret ? ret : val;
+}
+
+static inline bool of_get_nand_ecc_maximize(struct device_node *np)
+{
+	return of_property_read_bool(np, "nand-ecc-maximize");
+}
+
+void nand_ecc_read_user_conf(struct nand_device *nand)
+{
+	struct device_node *dn = nanddev_get_flash_node(nand);
+	int provider, algo, strength, size;
+
+	provider = of_get_nand_ecc_provider(dn);
+	if (provider >= 0)
+		nand->ecc.user_conf.provider = provider;
+
+	algo = of_get_nand_ecc_algo(dn);
+	if (algo >= 0)
+		nand->ecc.user_conf.algo = algo;
+
+	strength = of_get_nand_ecc_strength(dn);
+	if (strength >= 0)
+		nand->ecc.user_conf.strength = strength;
+
+	size = of_get_nand_ecc_step_size(dn);
+	if (size >= 0)
+		nand->ecc.user_conf.step_size = size;
+
+	if (of_get_nand_ecc_maximize(dn))
+		nand->ecc.user_conf.flags |= NAND_ECC_MAXIMIZE;
+}
+EXPORT_SYMBOL(nand_ecc_read_user_conf);
+
+/**
+ * nand_ecc_correction_is_enough - Check if the chip configuration meets the
+ *                                 datasheet requirements.
+ *
+ * @nand: Device to check
+ *
+ * If our configuration corrects A bits per B bytes and the minimum
+ * required correction level is X bits per Y bytes, then we must ensure
+ * both of the following are true:
+ *
+ * (1) A / B >= X / Y
+ * (2) A >= X
+ *
+ * Requirement (1) ensures we can correct for the required bitflip density.
+ * Requirement (2) ensures we can correct even when all bitflips are clumped
+ * in the same sector.
+ */
+bool nand_ecc_correction_is_enough(struct nand_device *nand)
+{
+	struct nand_ecc_conf *reqs = &nand->ecc.requirements;
+	struct nand_ecc_conf *conf = &nand->ecc.ctx.conf;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int corr, ds_corr;
+
+	if (conf->step_size == 0 || reqs->step_size == 0)
+		/* Not enough information */
+		return true;
+
+	/*
+	 * We get the number of corrected bits per page to compare
+	 * the correction density.
+	 */
+	corr = (mtd->writesize * conf->strength) / conf->step_size;
+	ds_corr = (mtd->writesize * reqs->strength) / reqs->step_size;
+
+	return corr >= ds_corr && conf->strength >= reqs->strength;
+}
+EXPORT_SYMBOL(nand_ecc_correction_is_enough);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3dacaa352a58..9c14b4a01192 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1041,6 +1041,7 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 {
 	struct nand_ecc_conf *requirements = &chip->base.ecc.requirements;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_nand_controller *nc;
 	struct atmel_pmecc_user_req req;
@@ -1065,7 +1066,7 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 			chip->ecc.size = val;
 	}
 
-	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE)
 		req.ecc.strength = ATMEL_PMECC_MAXIMIZE_ECC_STRENGTH;
 	else if (chip->ecc.strength)
 		req.ecc.strength = chip->ecc.strength;
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 3ec0242b0aa2..706bd73708e7 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1284,6 +1284,7 @@ int denali_init(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
@@ -1329,6 +1330,8 @@ int denali_init(struct denali_nand_info *denali)
 	if (denali->clk_rate && denali->clk_x_rate)
 		chip->options |= NAND_KEEP_TIMINGS;
 
+	nanddev->ecc.user_conf.flags |= NAND_ECC_MAXIMIZE;
+
 	chip->legacy.dummy_controller.ops = &denali_controller_ops;
 	ret = nand_scan(chip, denali->max_banks);
 	if (ret)
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index 48e9ac54ad53..bf3cb7c0480f 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -64,7 +64,6 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	denali->dev = &dev->dev;
 	denali->irq = dev->irq;
 	denali->ecc_caps = &denali_pci_ecc_caps;
-	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
 	denali->clk_rate = 50000000;		/* 50 MHz */
 	denali->clk_x_rate = 200000000;		/* 200 MHz */
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 187e6b1fd84d..9efe3dd578b5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4698,92 +4698,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	return ret;
 }
 
-static const char * const nand_ecc_modes[] = {
-	[NAND_ECC_NONE]		= "none",
-	[NAND_ECC_SOFT]		= "soft",
-	[NAND_ECC_HW]		= "hw",
-	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
-	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
-	[NAND_ECC_ON_DIE]	= "on-die",
-};
-
-static int of_get_nand_ecc_mode(struct device_node *np)
-{
-	const char *pm;
-	int err, i;
-
-	err = of_property_read_string(np, "nand-ecc-mode", &pm);
-	if (err < 0)
-		return err;
-
-	for (i = NAND_ECC_NONE; i < ARRAY_SIZE(nand_ecc_modes); i++)
-		if (!strcasecmp(pm, nand_ecc_modes[i]))
-			return i;
-
-	/*
-	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into the nand_ecc_mode enum anymore (they were
-	 * merged with other enums).
-	 */
-	if (!strcasecmp(pm, "soft_bch"))
-		return NAND_ECC_SOFT;
-
-	return -ENODEV;
-}
-
-static const char * const nand_ecc_algos[] = {
-	[NAND_ECC_HAMMING]	= "hamming",
-	[NAND_ECC_BCH]		= "bch",
-	[NAND_ECC_RS]		= "rs",
-};
-
-static int of_get_nand_ecc_algo(struct device_node *np)
-{
-	const char *pm;
-	int err, i;
-
-	err = of_property_read_string(np, "nand-ecc-algo", &pm);
-	if (!err) {
-		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
-			if (!strcasecmp(pm, nand_ecc_algos[i]))
-				return i;
-		return -ENODEV;
-	}
-
-	/*
-	 * For backward compatibility we also read "nand-ecc-mode" checking
-	 * for some obsoleted values that were specifying ECC algorithm.
-	 */
-	err = of_property_read_string(np, "nand-ecc-mode", &pm);
-	if (err < 0)
-		return err;
-
-	if (!strcasecmp(pm, "soft"))
-		return NAND_ECC_HAMMING;
-	else if (!strcasecmp(pm, "soft_bch"))
-		return NAND_ECC_BCH;
-
-	return -ENODEV;
-}
-
-static int of_get_nand_ecc_step_size(struct device_node *np)
-{
-	int ret;
-	u32 val;
-
-	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
-	return ret ? ret : val;
-}
-
-static int of_get_nand_ecc_strength(struct device_node *np)
-{
-	int ret;
-	u32 val;
-
-	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
-	return ret ? ret : val;
-}
-
 static int of_get_nand_bus_width(struct device_node *np)
 {
 	u32 val;
@@ -4805,10 +4719,10 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
-static int nand_dt_init(struct nand_chip *chip)
+static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct device_node *dn = nand_get_flash_node(chip);
-	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
+	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
 
 	if (!dn)
 		return 0;
@@ -4822,25 +4736,21 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (of_get_nand_on_flash_bbt(dn))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	ecc_mode = of_get_nand_ecc_mode(dn);
-	ecc_algo = of_get_nand_ecc_algo(dn);
-	ecc_strength = of_get_nand_ecc_strength(dn);
-	ecc_step = of_get_nand_ecc_step_size(dn);
-
-	if (ecc_mode >= 0)
-		chip->ecc.mode = ecc_mode;
-
-	if (ecc_algo >= 0)
-		chip->ecc.algo = ecc_algo;
-
-	if (ecc_strength >= 0)
-		chip->ecc.strength = ecc_strength;
-
-	if (ecc_step > 0)
-		chip->ecc.size = ecc_step;
-
-	if (of_property_read_bool(dn, "nand-ecc-maximize"))
-		chip->ecc.options |= NAND_ECC_MAXIMIZE;
+	nand_ecc_read_user_conf(nand);
+
+	/*
+	 * Raw NAND default provider is "hardware" (can be changed by the
+	 * drivers in the ->attach() phase).
+	 */
+	nand->ecc.defaults.provider = NAND_ECC_HW;
+	if (!nand->ecc.user_conf.provider)
+		nand->ecc.user_conf.provider = nand->ecc.defaults.provider;
+
+	/* Legacy parameters */
+	chip->ecc.mode = nand->ecc.user_conf.provider;
+	chip->ecc.algo = nand->ecc.user_conf.algo;
+	chip->ecc.strength = nand->ecc.user_conf.strength;
+	chip->ecc.size = nand->ecc.user_conf.step_size;
 
 	return 0;
 }
@@ -4876,7 +4786,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	/* Enforce the right timings for reset/detection */
 	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
 
-	ret = nand_dt_init(chip);
+	ret = rawnand_dt_init(chip);
 	if (ret)
 		return ret;
 
@@ -4940,6 +4850,7 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
 	if (WARN_ON(ecc->mode != NAND_ECC_SOFT))
@@ -5011,7 +4922,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		 * used.
 		 */
 		if (mtd->ooblayout == &nand_ooblayout_lp_ops &&
-		    ecc->options & NAND_ECC_MAXIMIZE) {
+		    nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE) {
 			int steps, bytes;
 
 			/* Always prefer 1k blocks over 512bytes ones */
@@ -5249,11 +5160,12 @@ nand_maximize_ecc(struct nand_chip *chip,
  * @caps: ECC engine caps info structure
  * @oobavail: OOB size that the ECC engine can use
  *
- * Choose the ECC configuration according to following logic
+ * Choose the ECC configuration according to following logic.
  *
  * 1. If both ECC step size and ECC strength are already set (usually by DT)
  *    then check if it is supported by this controller.
- * 2. If NAND_ECC_MAXIMIZE is set, then select maximum ECC strength.
+ * 2. If the user provided the nand-ecc-maximize property, then select maximum
+ *    ECC strength.
  * 3. Otherwise, try to match the ECC step size and ECC strength closest
  *    to the chip's requirement. If available OOB size can't fit the chip
  *    requirement then fallback to the maximum ECC step size and ECC strength.
@@ -5264,6 +5176,7 @@ int nand_ecc_choose_conf(struct nand_chip *chip,
 			 const struct nand_ecc_caps *caps, int oobavail)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 
 	if (WARN_ON(oobavail < 0 || oobavail > mtd->oobsize))
 		return -EINVAL;
@@ -5271,7 +5184,7 @@ int nand_ecc_choose_conf(struct nand_chip *chip,
 	if (chip->ecc.size && chip->ecc.strength)
 		return nand_check_ecc_caps(chip, caps, oobavail);
 
-	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE)
 		return nand_maximize_ecc(chip, caps, oobavail);
 
 	if (!nand_match_ecc_req(chip, caps, oobavail))
@@ -5281,42 +5194,6 @@ int nand_ecc_choose_conf(struct nand_chip *chip,
 }
 EXPORT_SYMBOL_GPL(nand_ecc_choose_conf);
 
-/*
- * Check if the chip configuration meet the datasheet requirements.
-
- * If our configuration corrects A bits per B bytes and the minimum
- * required correction level is X bits per Y bytes, then we must ensure
- * both of the following are true:
- *
- * (1) A / B >= X / Y
- * (2) A >= X
- *
- * Requirement (1) ensures we can correct for the required bitflip density.
- * Requirement (2) ensures we can correct even when all bitflips are clumped
- * in the same sector.
- */
-static bool nand_ecc_strength_good(struct nand_chip *chip)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	struct nand_ecc_conf *requirements = &chip->base.ecc.requirements;
-	int corr, ds_corr;
-
-	if (ecc->size == 0 || requirements->step_size == 0)
-		/* Not enough information */
-		return true;
-
-	/*
-	 * We get the number of corrected bits per page to compare
-	 * the correction density.
-	 */
-	corr = (mtd->writesize * ecc->strength) / ecc->size;
-	ds_corr = (mtd->writesize * requirements->strength) /
-		  requirements->step_size;
-
-	return corr >= ds_corr && ecc->strength >= requirements->strength;
-}
-
 static int rawnand_erase(struct nand_device *nand, const struct nand_pos *pos)
 {
 	struct nand_chip *chip = container_of(nand, struct nand_chip,
@@ -5372,6 +5249,7 @@ static const struct nand_ops rawnand_ops = {
 static int nand_scan_tail(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	int ret, i;
 
@@ -5594,7 +5472,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	mtd->oobavail = ret;
 
 	/* ECC sanity check: warn if it's too weak */
-	if (!nand_ecc_strength_good(chip))
+	if (!nand_ecc_correction_is_enough(nanddev))
 		pr_warn("WARNING: %s: the ECC used on your system is too weak compared to the one required by the NAND chip\n",
 			mtd->name);
 
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 43b22564da10..bff30a42f270 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1681,6 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 				       struct device_node *np)
 {
 	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
+	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -1689,7 +1690,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 	int ret;
 	int i;
 
-	if (ecc->options & NAND_ECC_MAXIMIZE) {
+	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE) {
 		int bytes;
 
 		ecc->size = 1024;
diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 31d547d96795..d3a4dd5cc945 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -838,7 +838,8 @@ static int tegra_nand_get_strength(struct nand_chip *chip, const int *strength,
 				   int strength_len, int bits_per_step,
 				   int oobsize)
 {
-	bool maximize = chip->ecc.options & NAND_ECC_MAXIMIZE;
+	struct nand_device *nanddev = mtd_to_nanddev(nand_to_mtd(chip));
+	bool maximize = nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE;
 	int i;
 
 	/*
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 277c0cf822b9..5db24fa073f2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -126,6 +126,23 @@ extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
 extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
 extern const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops;
 
+enum nand_ecc_mode {
+	NAND_ECC_INVALID = 0,
+	NAND_ECC_NONE,
+	NAND_ECC_SOFT,
+	NAND_ECC_HW,
+	NAND_ECC_HW_SYNDROME,
+	NAND_ECC_HW_OOB_FIRST,
+	NAND_ECC_ON_DIE,
+};
+
+enum nand_ecc_algo {
+	NAND_ECC_UNKNOWN = 0,
+	NAND_ECC_HAMMING,
+	NAND_ECC_BCH,
+	NAND_ECC_RS,
+};
+
 /**
  * struct nand_ecc_conf - NAND ECC configuration
  * @provider: ECC engine provider type
@@ -144,6 +161,9 @@ struct nand_ecc_conf {
 
 #define NAND_ECCREQ(str, stp) { .strength = (str), .step_size = (stp) }
 
+/* NAND ECC misc flags */
+#define NAND_ECC_MAXIMIZE BIT(0)
+
 /**
  * struct nand_bbt - bad block table object
  * @cache: in memory BBT cache
@@ -217,12 +237,14 @@ struct nand_ecc_engine {
 	struct nand_ecc_engine_ops *ops;
 };
 
+void nand_ecc_read_user_conf(struct nand_device *nand);
 int nand_ecc_init_ctx(struct nand_device *nand);
 void nand_ecc_cleanup_ctx(struct nand_device *nand);
 int nand_ecc_prepare_io_req(struct nand_device *nand,
 			    struct nand_page_io_req *req, void *oobbuf);
 int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req, void *oobbuf);
+bool nand_ecc_correction_is_enough(struct nand_device *nand);
 
 /**
  * struct nand_ecc - High-level ECC object
@@ -310,6 +332,17 @@ static inline struct mtd_info *nanddev_to_mtd(struct nand_device *nand)
 	return &nand->mtd;
 }
 
+/**
+ * nanddev_get_flash_node() - Get the device node attached to a NAND device
+ * @nand: NAND device
+ *
+ * Return: the device node linked to @nand.
+ */
+static inline struct device_node *nanddev_get_flash_node(struct nand_device *nand)
+{
+	return mtd_get_of_node(nanddev_to_mtd(nand));
+}
+
 /*
  * nanddev_bits_per_cell() - Get the number of bits per cell
  * @nand: NAND device
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 0c2beb6fcf0b..c5fdab30cf96 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -19,6 +19,7 @@
 #include <linux/wait.h>
 #include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/bbm.h>
 #include <linux/mtd/jedec.h>
@@ -84,26 +85,6 @@ struct nand_chip;
 
 #define NAND_DATA_IFACE_CHECK_ONLY	-1
 
-/*
- * Constants for ECC_MODES
- */
-enum nand_ecc_mode {
-	NAND_ECC_INVALID = 0,
-	NAND_ECC_NONE,
-	NAND_ECC_SOFT,
-	NAND_ECC_HW,
-	NAND_ECC_HW_SYNDROME,
-	NAND_ECC_HW_OOB_FIRST,
-	NAND_ECC_ON_DIE,
-};
-
-enum nand_ecc_algo {
-	NAND_ECC_UNKNOWN = 0,
-	NAND_ECC_HAMMING,
-	NAND_ECC_BCH,
-	NAND_ECC_RS,
-};
-
 /*
  * Constants for Hardware ECC
  */
@@ -121,7 +102,6 @@ enum nand_ecc_algo {
  * pages and you want to rely on the default implementation.
  */
 #define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
-#define NAND_ECC_MAXIMIZE		BIT(1)
 
 /*
  * When using software implementation of Hamming, we can specify which byte
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
