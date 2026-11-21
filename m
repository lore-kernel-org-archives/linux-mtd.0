Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A068E60A3808
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vu1TG//M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xA8FNlsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SjOsxr8QbA7GQg8Z8oTqr0XJmULLiKBw8vggYIewZ6s=; b=vu1TG//Mlgdn1+FM5HnL+QrY6y
	5GIt3wW0oBDbX0tYkOauu+loRZVnixXyKQiNgppd1AB4+Hy8vD8/KhuhC5kuT0uj0IdoiNRSCcx7F
	rgAKIZVG0UfbjAfnfm2aJWo0U18kLlJHElGhvAvfavcG0iptf+4k6KHGUUjd1ZSI6GSc/H7rtysTT
	ArP/Y1gBb9DnDNw/QT9eA37WcWvRM0PiGcl9RrpLTyCM/FbmljbXw59MQbbFJWLGeZohZ3cvhf9r0
	pSHJl9Fb6tTcaJXOF/Ly19CU/5k3FFE4weqJxlWKk0IfiWsFGlWmaEqCUsT73kACYbhBD1PyZzgdT
	PmhCIDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdS-0000000GZSz-2VR7;
	Sat, 21 Nov 2026 01:11:22 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd6-0000000GZE5-2Mnv
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:02 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-862b98b2e47so603906a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223460; x=1795828260; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSA/8+JIJhXyIE6wPAaPD1PdPonBWuUoA8eu4aZnEWs=;
        b=xA8FNlsEaXI+YUz+9MxfXuHR8w76sZq8SEnmqn2EEk1rnTygSW87BA7rgwHRiKz0K0
         Gbt52NTSaNMg3kEKAuDbC17bEExo/TLrP6OxYS/k0dhHunyG7d/8ii7DWvudM9U3SNTi
         w7+OSkVQIlV66lZarLqO4BaE+bgGoH6qlRGrckXgrW6WZhNb7ZwL6RlAth1AUcVFZJr6
         bVCHm23MjC4tgcF2yUW4Gew2LCvYWpgOzw7+imMpRKcqZ0j8ZExJoFcTcXpveJZSdZwO
         /WXIwgsSZOUq/PBoXvJ3b5CgfHkUuiHCXWzAE7euVcsILCAAaOWfwiizijKcPHuR+jEr
         OlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223460; x=1795828260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSA/8+JIJhXyIE6wPAaPD1PdPonBWuUoA8eu4aZnEWs=;
        b=vqvPLKqoXlaH6ZlzR+S+8S9sq1va7TmSG0Jr2PsCWTSsIsU+oVD53AxBKWnvOrOaV+
         5PNxtHSdFJ0mJBjm1FoYS1CpGT2jATuvx177jCJpyBnS7zvOcWs98EHwd/TwRuzZnYh+
         O2m3zyg3f+aJWHa0cMYi7j9M0xi2BJoIkc36HXUrLPH/f5ytsAQAs3fE7vV+MhFrrGGb
         hzCHqCMzw5vVxOfC7FN2hYwB7YlUkSXCNv8oPO1BfY5UC/VRBK5BKuhJfE/sywSYjL9x
         2Jv4xiiDxBpqXP2149wGda3BjQAVdQY/Hlvoo6Pjd/B1KcBy0gYJwwzdi3VbGf7ctWE6
         /Rdw==
X-Forwarded-Encrypted: i=1; AL+hErHcHvEU8r7DeOgLDypemD5NohmQVL2CH+QQUACqzN/ZSbOmEWYa3paq66qcgkWylMP5SSQwr2oZH1Y=@lists.infradead.org
X-Gm-Message-State: APuU4Z/WA7eDibLhg+Bxq2mDcHLh47TYbSVlOpXTZfLdQ3CnzAQJFXqP
	qKeqmL+5aNevI7V7/Iuq+jRDtC3HIy2SRbuvUwOjOVcSqPPbXUI7dbj8bmMf0l7M
X-Gm-Gg: AYBFou149Djzsfp+vgFzvm/0U93L4ExkC5fAMOSJM1Xzo9HcZMLfZkNLUfivTrVBXH9
	W7fpbVVodlRJbXv360FpKXhUzZEHASu+FbJfWDIKojJvE6b2l8YBXXHjMpGU/bCdMUPmYEk+dV3
	5zMxq5PWjoGplkw2z3UMg9adzbaVuav2THT37DAbrYSPZS6iMCJUng5o6zHc/AdKOQu8l5YJbER
	IMGQ9OMK/grqBhtc/YSrKxJg4xkW0oZ12xwR7S/fYqenh9bhGLwhtb4c1XZAmYf4PUqA+bgBb6/
	zMkKuOG/aUnRitoRoctbNIMgL5A8WuHLprp08gliLrdxrRuI0TDCfTTh3QbpUnpnrwxrXHYYYw+
	e0AZS31AAgftGpCwxPc/UccqXcLeSXBa9XzT+dTrgS4UZlKb37ddXFpP3+1OvdaWA9JuBduQ6EL
	AJJI+qZtCjEbztiw7VfrZA1gbC/M9W6AKkBkFIIM6/pEEJH7qBVGf63I6UkCtOH2WfmJZ1sCwH+
	G74WKmLw2utsjDYMFvcCvcsc+9o4A9/+5+5KdSaoQ0cv6417Dw3gE9wQrvJQjZPvHj1cpohmmLm
	qSys8tZMLbJ3xZzaJL9hU49pBa0NBrlee8SjWkDhuDVw6otqEOQUOhuylyQu1U5NW6uqniviLen
	lta/NU9aNJOiQwBcLwc+C7vEWuhpN8KFKFqq12NBnHec4taOXSXaB9yn6Q9O1VhQMMvrztENoZT
	f5jx1etPZnaluAaSUp2HhUkC19oMR3SiXkmx8WrhEy+pxuFN4OQ9J7
X-Received: by 2002:a05:6808:3503:b0:4f5:eaac:5151 with SMTP id 5614622812f47-57a0b0414a8mr5815721b6e.39.1795223459632;
        Fri, 20 Nov 2026 17:10:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:26 -0700
Subject: [PATCH v11 03/26] mtd: rawnand: sunxi: share ECC read handling
 between PIO and DMA
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-3-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171100_723245_456DA201 
X-CRM114-Status: GOOD (  23.51  )
X-Spam-Score: -1.8 (-)
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
	SPF_PASS,TVD_PH_BODY_ACCOUNTS_PRE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a full-page read, the caller should get the same corrected data,
protected OOB and ECC statistics whether the controller uses PIO or
DMA. Each path currently implements its own pattern handling and
erased-chunk checks.

Use one PIO loop for a full page or the requested steps of a subpage.
Pass each PIO step or completed DMA batch to the same ECC reader. An
erased-step check derives its data and OOB positions from the logical
step, even when the controller reports its result in slot zero.

Keep the page buffer, correction count and erased-chunk state until
the read is finished. DMA must collect corrected OOB before any raw
reread, which can overwrite the controller registers. Keep that order
and let each transfer path issue its own commands.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 446 ++++++++++++++++++--------------------
 1 file changed, 216 insertions(+), 230 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f57184927fe9..8c5aed1fdfb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -925,6 +925,7 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	       sunxi_nfc_user_data_before(sunxi_nand, step);
 }
 
+/* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						int step, bool bbm, int page,
 						unsigned int user_data_sz)
@@ -1073,6 +1074,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+/* Shared across a read's transfers; buf remains the full-page buffer base. */
+struct sunxi_nfc_ecc_read {
+	u8 *buf;
+	int page;
+	unsigned int max_bitflips;
+	bool oob_required;
+	bool dma;
+	bool has_erased_chunk;
+};
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
 				    bool *erased)
@@ -1112,98 +1123,6 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	return NFC_ECC_ERR_CNT(step, tmp);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
-				       u8 *data, int data_off,
-				       u8 *oob, int oob_off,
-				       int *cur_off,
-				       unsigned int *max_bitflips,
-				       int step, bool oob_required, int page)
-{
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int raw_mode = 0;
-	u32 pattern_found;
-	bool bbm = !step;
-	bool erased;
-	int ret;
-	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
-
-	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
-
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
-
-	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
-
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
-
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
-	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
-	       nfc->regs + NFC_REG_CMD);
-
-	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	sunxi_nfc_randomizer_disable(nand);
-	if (ret)
-		return ret;
-
-	*cur_off = oob_off + ecc->bytes + user_data_sz;
-
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
-
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
-	if (erased)
-		return 1;
-
-	if (ret < 0) {
-		/*
-		 * Re-read the data with the randomizer disabled to identify
-		 * bitflips in erased pages.
-		 */
-		if (nand->options & NAND_NEED_SCRAMBLING)
-			nand_change_read_column_op(nand, data_off, data,
-						   ecc->size, false);
-		else
-			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
-				      ecc->size);
-
-		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + user_data_sz, false);
-
-		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + user_data_sz,
-						  NULL, 0, ecc->strength);
-		if (ret >= 0)
-			raw_mode = 1;
-	} else {
-		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
-
-		if (oob_required) {
-			nand_change_read_column_op(nand, oob_off, NULL, 0,
-						   false);
-			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + user_data_sz,
-						      true, page);
-
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
-							    bbm, page, user_data_sz);
-		}
-	}
-
-	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
-
-	return raw_mode;
-}
-
 /*
  * Returns the offset of the OOB for each step.
  * (it includes the user data before the ECC data.)
@@ -1225,6 +1144,37 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 	return step * ecc->bytes + sunxi_nfc_user_data_before(sunxi_nand, step + 1);
 }
 
+/* Account for the ECC result and record erased chunks. */
+static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
+				       struct sunxi_nfc_ecc_read *read, int step)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int data_off = step * ecc->size;
+	int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+	unsigned int oob_len = ecc->bytes + sunxi_nfc_user_data_sz(sunxi_nand, step);
+	u8 *data = read->buf + data_off;
+	u8 *oob = nand->oob_poi + oob_off;
+	int ret;
+
+	/* Check the physical representation for bitflips in erased pages. */
+	if (nand->options & NAND_NEED_SCRAMBLING)
+		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+
+	nand_change_read_column_op(nand, nand_to_mtd(nand)->writesize + oob_off,
+				   oob, oob_len, false);
+
+	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
+					  ecc->strength);
+
+	sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, ret);
+
+	if (ret >= 0)
+		read->has_erased_chunk = true;
+
+	return 0;
+}
+
 static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 					    u8 *oob, int *cur_off,
 					    bool randomize, int page)
@@ -1252,18 +1202,157 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
-					    int oob_required, int page,
-					    int nchunks)
+/* Interpret one PIO step or a completed DMA batch before reusing its status. */
+static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
+				    struct sunxi_nfc_ecc_read *read,
+				    u32 status, u32 pattern_found,
+				    int first_step, int nsteps)
 {
-	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int max_bitflips = 0;
-	int ret, i, raw_mode = 0;
+	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
+	unsigned int user_data_sz;
+	int i, ret;
+
+	for (i = 0; i < nsteps; i++) {
+		int step = first_step + i;
+		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+		u8 *data = read->buf + step * ecc->size;
+		u8 *oob = nand->oob_poi + oob_off;
+		bool erased;
+		int bitflips;
+
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		bitflips = sunxi_nfc_hw_ecc_correct(nand,
+						    !read->dma || randomized ? data : NULL,
+						    read->oob_required ? oob : NULL,
+						    i, status, pattern_found, &erased);
+		if (bitflips < 0) {
+			/* Preserve PIO data before the raw erased-page check. */
+			if (!read->dma && !randomized)
+				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+			continue;
+		}
+
+		if (erased) {
+			read->has_erased_chunk = true;
+			continue;
+		}
+
+		if (!read->dma)
+			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+
+		if (read->oob_required) {
+			/* Keep the existing PIO and DMA representations of parity. */
+			if (read->dma) {
+				nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							   oob, ecc->bytes + user_data_sz, false);
+			} else {
+				nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							   NULL, 0, false);
+				sunxi_nfc_randomizer_read_buf(nand, oob,
+							      ecc->bytes + user_data_sz,
+							      true, read->page);
+			}
+
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+							    read->page, user_data_sz);
+		}
+
+		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
+	}
+
+	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+		return 0;
+
+	/* Finish consuming the batch's corrected OOB before raw error rereads. */
+	for (i = 0; i < nsteps; i++) {
+		int step = first_step + i;
+
+		if (!(status & NFC_ECC_ERR(i)))
+			continue;
+
+		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
+				     struct sunxi_nfc_ecc_read *read, int *cur_off)
+{
+	if (read->oob_required)
+		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						!read->has_erased_chunk, read->page);
+
+	return read->max_bitflips;
+}
+
+static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
+				       struct sunxi_nfc_ecc_read *read,
+				       int step, int *cur_off)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int data_off = step * ecc->size;
+	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
+	int page = read->page;
+	u32 pattern_found;
+	int ret;
+
+	if (*cur_off != data_off)
+		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+
+	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+
+	if (data_off + ecc->size != oob_off)
+		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+
+	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+	if (ret)
+		return ret;
+
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_randomizer_config(nand, page, false);
+	sunxi_nfc_randomizer_enable(nand);
+	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
+	       nfc->regs + NFC_REG_CMD);
+
+	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
+	sunxi_nfc_randomizer_disable(nand);
+	if (ret)
+		return ret;
+
+	*cur_off = oob_off + ecc->bytes + user_data_sz;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+
+	return sunxi_nfc_oob_read_batch(nand, read,
+					readl(nfc->regs + NFC_REG_ECC_ST),
+					pattern_found, step, 1);
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+		.dma = true,
+	};
 	struct scatterlist sg;
+	int ret, i;
 	u32 status, pattern_found, wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
@@ -1310,83 +1399,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	ret = sunxi_nfc_oob_read_batch(nand, &read, status, pattern_found,
+				       0, nchunks);
+	if (ret)
+		return ret;
 
-	for (i = 0; i < nchunks; i++) {
-		int data_off = i * ecc->size;
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = buf + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-		bool erased;
-
-		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
-					       oob_required ? oob : NULL,
-					       i, status, pattern_found,
-					       &erased);
-
-		/* ECC errors are handled in the second loop. */
-		if (ret < 0)
-			continue;
-
-		if (oob_required && !erased) {
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
-							    page, user_data_sz);
-		}
-
-		if (erased)
-			raw_mode = 1;
-
-		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
-	}
-
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
-		for (i = 0; i < nchunks; i++) {
-			int data_off = i * ecc->size;
-			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-			u8 *data = buf + data_off;
-			u8 *oob = nand->oob_poi + oob_off;
-
-			if (!(status & NFC_ECC_ERR(i)))
-				continue;
-
-			/*
-			 * Re-read the data with the randomizer disabled to
-			 * identify bitflips in erased pages.
-			 * TODO: use DMA to read page in raw mode
-			 */
-			if (randomized)
-				nand_change_read_column_op(nand, data_off,
-							   data, ecc->size,
-							   false);
-
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + user_data_sz,
-							  NULL, 0,
-							  ecc->strength);
-			if (ret >= 0)
-				raw_mode = 1;
-
-			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
-		}
-	}
-
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						NULL, !raw_mode,
-						page);
-
-	return max_bitflips;
+	return sunxi_nfc_oob_finish_read(nand, &read, NULL);
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1458,45 +1476,40 @@ static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
-				      int oob_required, int page)
+static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page,
+					    int first_step, int end_step)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct mtd_info *mtd = nand_to_mtd(nand);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int max_bitflips = 0;
-	int ret, i, cur_off = 0;
-	bool raw_mode = false;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+	};
+	int ret, step, cur_off = 0;
 
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
 	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < ecc->steps; i++) {
-		int data_off = i * ecc->size;
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = buf + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-
-		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
-						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips,
-						  i, oob_required, page);
+	for (step = first_step; step < end_step; step++) {
+		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, step, &cur_off);
 		if (ret < 0)
 			return ret;
-		else if (ret)
-			raw_mode = true;
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						!raw_mode, page);
-
+	ret = sunxi_nfc_oob_finish_read(nand, &read, &cur_off);
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
+}
+
+static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, u8 *buf,
+				      int oob_required, int page)
+{
+	return sunxi_nfc_hw_ecc_read_chunks_pio(nand, buf, oob_required, page, 0,
+						nand->ecc.steps);
 }
 
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
@@ -1517,39 +1530,12 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 					 u32 data_offs, u32 readlen,
-					 u8 *bufpoi, int page)
+					 u8 *buf, int page)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct mtd_info *mtd = nand_to_mtd(nand);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
-	unsigned int max_bitflips = 0;
-
-	nand_read_page_op(nand, page, 0, NULL, 0);
-
-	sunxi_nfc_hw_ecc_enable(nand);
-
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = data_offs / ecc->size;
-	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
-		int data_off = i * ecc->size;
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = bufpoi + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-
-		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off,
-						  oob,
-						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips, i,
-						  false, page);
-		if (ret < 0)
-			return ret;
-	}
-
-	sunxi_nfc_hw_ecc_disable(nand);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 
-	return max_bitflips;
+	return sunxi_nfc_hw_ecc_read_chunks_pio(nand, buf, false, page, first_step, end_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
