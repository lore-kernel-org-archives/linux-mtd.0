Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE66E20721
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ClEommli"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE66E20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQqyH5+mczSp7jc0vC8HAmr1x/6Igq23RSRpiZLW8YI=; b=ClEommliLm7ntx
	N0Y0nd+qAwa+0v5mbZEp9POcuQvq+NtG0BBOAG/q1OZQrAOZJO/E97xEmihzZ2DYYD5ZH45MaZJkN
	A+zO+BIIjdPhoaKID6J0Ao0AS5inZGq2Cc8W6qEYOp3Xz01tGuP13fg/exlkCcNQxvG8e40EjeZFN
	87hP4MAMh6aeuZ4kBK/TvArHjj0iORfHyxum3wNGNwMnkd6+t1Ku4qV/qxgf7waKXS32DBZ49swQX
	9jAM7qXyRhNPHPsxbumTPZ3xcPecbxbKGs+PMGEeQw4UJ7jsS5e7/tyMkaC5RpFNnZedtjOA1EspC
	ztTx0X9fy0zJSNxe8Q6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeRtP-0007lF-Ef; Thu, 28 May 2020 23:24:55 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeRle-0006WV-7R
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 23:17:01 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 755E3240009;
 Thu, 28 May 2020 23:16:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v6 30/30] mtd: rawnand: Allocate the best interface
 configuration dynamically
Date: Fri, 29 May 2020 01:16:12 +0200
Message-Id: <20200528231612.8958-31-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528231612.8958-1-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_161654_550000_5C90EB24 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Instead of manipulating the statically allocated structure and copy
timings around, allocate one at identification time and save it in the
nand_chip structure once it has been initialized.

Use a second pointer to always have a reference on the currently
applied interface configuration.

This way, either there is a "best interface configuration" and the
requested timings will be these, or there is none and the default set
will be used, statically defined in the core, shared across all NAND
chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 56 +++++++++++++++++++++++---------
 include/linux/mtd/rawnand.h      | 11 +++++--
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 2f913ce8328f..13fee17cd411 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -928,7 +928,9 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
 	 * timings to timing mode 0.
 	 */
 
-	ret = ops->setup_interface(chip, chipnr, nand_get_reset_interface());
+	chip->current_interface_config = nand_get_reset_interface();
+	ret = ops->setup_interface(chip, chipnr,
+				   chip->current_interface_config);
 	if (ret)
 		pr_err("Failed to configure data interface to SDR timing mode 0\n");
 
@@ -947,7 +949,8 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
  */
 static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
-	u8 mode = chip->interface_config.timings.mode;
+	const struct nand_controller_ops *ops = chip->controller->ops;
+	u8 mode = chip->best_interface_config->timings.mode;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
 	int ret;
 
@@ -965,14 +968,13 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	}
 
 	/* Change the mode on the controller side */
-	ret = chip->controller->ops->setup_interface(chip, chipnr,
-						     &chip->interface_config);
+	ret = ops->setup_interface(chip, chipnr, chip->best_interface_config);
 	if (ret)
 		return ret;
 
 	/* Check the mode has been accepted by the chip, if supported */
 	if (!nand_supports_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE))
-		return 0;
+		goto update_interface_config;
 
 	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
 	nand_select_target(chip, chipnr);
@@ -988,6 +990,9 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 		goto err_reset_chip;
 	}
 
+update_interface_config:
+	chip->current_interface_config = chip->best_interface_config;
+
 	return 0;
 
 err_reset_chip:
@@ -1029,8 +1034,10 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 		/* Verify the controller supports the requested interface */
 		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
 					   iface);
-		if (!ret)
+		if (!ret) {
+			chip->best_interface_config = iface;
 			return ret;
+		}
 
 		/* Fallback to slower modes */
 		best_mode = iface->timings.mode;
@@ -1044,9 +1051,11 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
 					   iface);
 		if (!ret)
-			return 0;
+			break;
 	}
 
+	chip->best_interface_config = iface;
+
 	return 0;
 }
 
@@ -1065,15 +1074,25 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
  */
 static int nand_choose_interface(struct nand_chip *chip)
 {
+	struct nand_interface_config *iface;
+	int ret;
+
 	if (!nand_controller_can_setup_interface(chip))
 		return 0;
 
+	iface = kzalloc(sizeof(*iface), GFP_KERNEL);
+	if (!iface)
+		return -ENOMEM;
+
 	if (chip->ops.choose_interface)
-		return chip->ops.choose_interface(chip,
-						  &chip->interface_config);
+		ret = chip->ops.choose_interface(chip, iface);
+	else
+		ret = nand_choose_best_sdr_timings(chip, iface, NULL);
 
-	return nand_choose_best_sdr_timings(chip, &chip->interface_config,
-					    NULL);
+	if (ret)
+		kfree(iface);
+
+	return ret;
 }
 
 /**
@@ -2523,8 +2542,8 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	 * nand_setup_interface() uses ->set/get_features() which would
 	 * fail anyway as the parameter page is not available yet.
 	 */
-	if (!memcmp(&chip->interface_config, nand_get_reset_interface(),
-		    sizeof(chip->interface_config)))
+	if (!chip->best_interface_config ||
+	    chip->best_interface_config == nand_get_reset_interface())
 		return 0;
 
 	ret = nand_setup_interface(chip, chipnr);
@@ -5194,7 +5213,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	mutex_init(&chip->lock);
 
 	/* Enforce the right timings for reset/detection */
-	onfi_fill_interface_config(chip, &chip->interface_config, NAND_SDR_IFACE, 0);
+	chip->current_interface_config = nand_get_reset_interface();
 
 	ret = nand_dt_init(chip);
 	if (ret)
@@ -5990,7 +6009,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	for (i = 0; i < nanddev_ntargets(&chip->base); i++) {
 		ret = nand_setup_interface(chip, i);
 		if (ret)
-			goto err_nanddev_cleanup;
+			goto err_free_interface_config;
 	}
 
 	/* Check, if we should skip the bad block table scan */
@@ -6000,10 +6019,12 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* Build bad block table */
 	ret = nand_create_bbt(chip);
 	if (ret)
-		goto err_nanddev_cleanup;
+		goto err_free_interface_config;
 
 	return 0;
 
+err_free_interface_config:
+	kfree(chip->best_interface_config);
 
 err_nanddev_cleanup:
 	nanddev_cleanup(&chip->base);
@@ -6097,6 +6118,9 @@ void nand_cleanup(struct nand_chip *chip)
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
 
+	/* Free the data interface */
+	kfree(chip->best_interface_config);
+
 	/* Free manufacturer priv data. */
 	nand_manufacturer_cleanup(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 7b7db2d91a9a..50ea4b825324 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1069,7 +1069,11 @@ struct nand_manufacturer {
  * @options: Various chip options. They can partly be set to inform nand_scan
  *           about special functionality. See the defines for further
  *           explanation.
- * @interface_config: NAND interface timing information
+ * @current_interface_config: The currently used NAND interface configuration
+ * @best_interface_config: The best NAND interface configuration which fits both
+ *                         the NAND chip and NAND controller constraints. If
+ *                         unset, the default reset interface configuration must
+ *                         be used.
  * @bbt_erase_shift: Number of address bits in a bbt entry
  * @bbt_options: Bad block table specific options. All options used here must
  *               come from bbm.h. By default, these options will be copied to
@@ -1116,7 +1120,8 @@ struct nand_chip {
 	unsigned int options;
 
 	/* Data interface */
-	struct nand_interface_config interface_config;
+	const struct nand_interface_config *current_interface_config;
+	struct nand_interface_config *best_interface_config;
 
 	/* Bad block information */
 	unsigned int bbt_erase_shift;
@@ -1212,7 +1217,7 @@ const struct nand_interface_config *nand_get_reset_interface(void);
 static inline const struct nand_interface_config *
 nand_get_interface_config(struct nand_chip *chip)
 {
-	return &chip->interface_config;
+	return chip->current_interface_config;
 }
 
 /*
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
