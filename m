Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01EB606A689
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PrbtWPIq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nv887E1C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GeQPlYEvmObmXF/482kzRXCAblPR9Xo/RRCVWD/CVPs=; b=PrbtWPIqjDnsGpyknCjHVhfH6L
	ApE3T5ffNsUAjg4nhMpQNM7NyAAxLAC9K1Ui2vSOlm8cA8CrlXVOpVYv2bwUxh2NiuhrJQ+4toECa
	TeVHkH2fNu5bEg5HYfRfYS1bE+paG8C3J4bWASjMxafIOL29aq4wFHPenRMNLigmTyjfcMCsyq0iN
	0zJdCt0l2cDItgijjHqH3YEO0CGWfvQFrGvwPDSfpun4KLhLwclvPAnww4xV94iFRoZpTcuDxKc0k
	GeQS1q2rR/PO4H/KqVHPBt+AumEnNwMMjHdH2LlHgyWkR5br3WRFkzimqDklrghKacg4Ilf7A4pEb
	qQjAGyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdO-0000000GZPK-1b3t;
	Sat, 21 Nov 2026 01:11:18 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd3-0000000GZCq-2OPL
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:02 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4d198f1a591so1430834b6e.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223456; x=1795828256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRAIIk9U6fp4Kf8B545qVrRs6kaxTJjBXvTeCKe8iRc=;
        b=Nv887E1CTxQRaxn4zdENj1vM8QVR29Q2y3OBjiaBZub34Gb1v6oTVBh0YZJQHKsYSu
         bqODaM8BCrQD+sPCe1AH344OFG9+s2a+i+xUse/QSAf+jYQqDz+0jzoQjC2Bf/SggdxE
         PaXbop41NyNw6f396nS9eHsc8+ZXQDWVMbKR/MnPRRB2VXxtdi41oDpmzic7S1twAUru
         WiIcG+x32803HmEFDgflZ6TrvwsYONZQ7ZXmH0dz2zvWdsA3WBatpwdTPKB+4xbOHozq
         q7FdODV/mFOp2ydKzOWpM8HpZb7dD/9Ti9Isa6K8Gvtxgruy4+YCZZRDbQ6YLRd/Ddfc
         5K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223456; x=1795828256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRAIIk9U6fp4Kf8B545qVrRs6kaxTJjBXvTeCKe8iRc=;
        b=npZfFUoDqi9WXr/Vuhnorv0lnlssrvlhUH78J8EGXPEoW287SsCGhJSuU2w4jbQ87z
         u7UejqOpA9dDFjH5P3gnUiwD24KSafWChEjZFJ3oFCJ/psS4/vp2N6GDt2NswvzBt3DV
         Z5lG5z4EEs30ZT2AaydNMv0Usgo7ze3Qnjx4tRswx26Xim6fBYZggZK/sYM0NU4mwEx/
         NZiPon7krgLYv72dUgTrZoklJMpVrQ1qPJGt6GyYkOsC/19phOvRJGcdLqw9eoDIzqZm
         9RB1ZSeAC1WQJltbxPt0JViz8tdNItVcY0GiDPoVM3L7PCZgqndk9TNaSJ3a17BarKGu
         urHA==
X-Forwarded-Encrypted: i=1; AL+hErGZH0e70WoIcdteiQkv7Iw3CGHmzhWmFVzOrs3BraZL7TmET283sxAUmyFBfAc3pwsHNMFvF33KGxc=@lists.infradead.org
X-Gm-Message-State: APuU4Z8BWTmeIZFMszmR7HTi/+rTpndtgWrqpbchNIhTRd9I/37aYWdO
	8tS+Y4tNXNBnarnpyOVJZL5EdXw38QJKb6JRrxP7vQbX3qvXuWYz0w4p
X-Gm-Gg: AYBFou35FWtAUDv/ixPqQO0qh9NAzOFQtiI7KWt+G9K48wAvGp2BnRuOIreV7vzcb2B
	JGFmgLbR1cQtEbzOmjNDlXm1CX2cQGbaiIwhJUVYBMZjJSFwSbP6Ku5C8GzIy37Qgef98Vuz969
	dmFYQwBTrTxgXWfe1yyEKN+9PNINg9iHZ/K5QV6KskRx83z7M+kLU4jQS9fj/lHJ2R2GYwerlDW
	tscOV5RnfGPbVDz6VP/X9pX/iCgSzdjYZtqRcDrpXVabJni0uRfh8Hary/IjCtPTtrVHQyKTa9Z
	fH+0/Nem3UDPPMmSMh84adllfLS5a6GqGLDWqjOphLgzGiYhts+aVobTiQR1atAaM1qsQGmSM0s
	BmSH3mHxTY8tJw20EfzD662KgHT/HhFyfGfnHJui/Calst5l8UDlX5ZclJN2jaIsqlYeTLRB19h
	R8HvbzzJQcVooaw9zrFv56Xq75GV43l0SZZH/wMyMUZ33JgUio06Z4HzMQaeIQl/BKcWN9QqRIv
	aFF/C59WMg35ec9293K4X25gPimXKCcyLB2OpiUml5TS4kuPZnp2dcFz/AcfNvgpxytRBgKWJDe
	+0remsS6tnn7ck8faX2KSMLhAHwQ1YTHiNAhgKshjh5ympI4Kx3n4DHfd6QKdvnsQkA8MIZBfrR
	1syYyHtUPPl9kudfcnKHaIZrekc7eKimrD1/YtIVWDabHoHl/q3OWCAjyG3hIicfLWQ0J/vhc7/
	FmwP5A79PCLr2c8Kr8TdkjzzVF+LvXQyAugoNlXp+XWbP+rbetic8S
X-Received: by 2002:a05:6808:c12b:b0:4f6:5279:5c89 with SMTP id 5614622812f47-57a0b03f55bmr5137406b6e.47.1795223456322;
        Fri, 20 Nov 2026 17:10:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:24 -0700
Subject: [PATCH v11 01/26] mtd: rawnand: sunxi: select the protected OOB
 layout from match data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-1-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171059_290250_268B3535 
X-CRM114-Status: GOOD (  27.95  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ECC strength chosen at attach and the OOB layout used for page
transfers must reserve space for the same protected bytes. A10 and A23
store four bytes per step. Their strength calculation also reserves two
extra bytes for historical compatibility. H616 needs only one four-byte
word for the bad-block marker; after choosing the strength it can
distribute the remaining space among the steps.

Select the reservation and initialization together from controller
match data. Keep the fixed layout independent of the step count at
attach: the NAND core can subsequently choose a software ECC geometry.
The selected strengths and on-flash byte positions stay the same.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 98 ++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 66ce53850eef..c6001349266f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -293,6 +293,13 @@ struct sunxi_nfc_mdma_desc {
 	__le32 next;
 } __packed __aligned(4);
 
+struct sunxi_nfc_user_data_layout {
+	/* Space to reserve before choosing the ECC strength. */
+	unsigned int (*min_user_data)(int nsteps);
+	/* Optional setup after the step size and parity length are known. */
+	int (*init_user_data)(struct nand_chip *nand, int nsteps);
+};
+
 /*
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
@@ -302,8 +309,7 @@ struct sunxi_nfc_mdma_desc {
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
- * @legacy_max_strength:If the maximize strength function was off by 2 bytes
- *			NB: this should not be used in new controllers
+ * @layout: protected user-data layout for the controller
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -335,7 +341,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
-	bool legacy_max_strength;
+	const struct sunxi_nfc_user_data_layout *layout;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -2026,24 +2032,35 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_fixed_min_user_data(int nsteps)
+{
+	/* Preserve the ECC strength selected with the legacy BBM allowance. */
+	return nsteps * USER_DATA_SZ + 2;
+}
+
+static unsigned int sunxi_nfc_variable_min_user_data(int nsteps)
+{
+	/* The first protected word contains the bad-block marker. */
+	return USER_DATA_SZ;
+}
+
+static int sunxi_nfc_variable_init_user_data(struct nand_chip *nand, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct sunxi_nfc_caps *c = nfc->caps;
-	int remaining_bytes = oobsize - (ecc_bytes * nsectors);
+	int remaining_bytes = nand_to_mtd(nand)->oobsize - nand->ecc.bytes * nsteps;
 	int i, step;
 
-	if (nsectors <= 0)
+	if (nsteps <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
+	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsteps,
 						   GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
-	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
+	for (step = 0; (step < nsteps) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
 				break;
@@ -2059,12 +2076,21 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	return 0;
 }
 
+static const struct sunxi_nfc_user_data_layout sunxi_nfc_fixed_layout = {
+	.min_user_data = sunxi_nfc_fixed_min_user_data,
+};
+
+static const struct sunxi_nfc_user_data_layout sunxi_nfc_variable_layout = {
+	.min_user_data = sunxi_nfc_variable_min_user_data,
+	.init_user_data = sunxi_nfc_variable_init_user_data,
+};
+
 static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
-				       struct nand_ecc_ctrl *ecc,
-				       struct device_node *np)
+				       struct nand_ecc_ctrl *ecc)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	const struct sunxi_nfc_user_data_layout *layout = nfc->caps->layout;
 	const u8 *strengths = nfc->caps->ecc_strengths;
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
@@ -2083,33 +2109,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 
-		if (!nfc->caps->reg_user_data_len) {
-			/*
-			 * If there's a fixed user data length, subtract it before
-			 * computing the max ECC strength
-			 */
-
-			for (i = 0; i < nsectors; i++)
-				total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-			/*
-			 * The 2 BBM bytes should not be removed from the grand total,
-			 * because they are part of the USER_DATA_SZ.
-			 * But we can't modify that for older platform since it may
-			 * result in a stronger ECC at the end, and break the
-			 * compatibility.
-			 */
-			if (nfc->caps->legacy_max_strength)
-				bytes -= 2;
-
-			bytes -= total_user_data_sz;
-		} else {
-			/*
-			 * User-data lengths are encoded in four-byte units. Reserve
-			 * the first word because it contains the two BBM bytes.
-			 */
-			bytes -= USER_DATA_SZ;
-		}
+		bytes -= layout->min_user_data(nsectors);
 
 		/*
 		 * Once all user data has been subtracted, the rest can be used
@@ -2173,20 +2173,14 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		return -EINVAL;
 	}
 
-	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
-	 */
-	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+	if (layout->init_user_data) {
+		ret = layout->init_user_data(nand, nsectors);
 		if (ret)
 			return ret;
 	}
 
-	if (total_user_data_sz == 0)
-		for (i = 0; i < nsectors; i++)
-			total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+	for (i = 0; i < nsectors; i++)
+		total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
 
 	if (mtd->oobsize < (ecc->bytes * nsectors + total_user_data_sz))
 		return -EINVAL;
@@ -2233,7 +2227,6 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct device_node *np = nand_get_flash_node(nand);
 	int ret;
 
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
@@ -2254,7 +2247,7 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 
 	switch (ecc->engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		ret = sunxi_nand_hw_ecc_ctrl_init(nand, ecc, np);
+		ret = sunxi_nand_hw_ecc_ctrl_init(nand, ecc);
 		if (ret)
 			return ret;
 		break;
@@ -2725,7 +2718,7 @@ static const u8 sunxi_user_data_len_h6[] = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
-	.legacy_max_strength = true,
+	.layout = &sunxi_nfc_fixed_layout,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2748,7 +2741,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.has_ecc_block_512 = true,
-	.legacy_max_strength = true,
+	.layout = &sunxi_nfc_fixed_layout,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2769,6 +2762,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
+	.layout = &sunxi_nfc_variable_layout,
 	.has_mdma_desc = true,
 	.has_ecc_clk = true,
 	.has_mbus_clk = true,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
