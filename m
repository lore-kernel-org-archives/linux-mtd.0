Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A4606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R2gfFE1g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mU0Klqe0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jx1rAEAMcJROWxc+52/ybF8/QFnS2e1s/WtQrotl910=; b=R2gfFE1gdi5BY3NEauOF5idRZx
	FRVOM9t0ZeXpsTe43M6oS/oIQ/J9LKmxrwPabBiE0wzUIYV3erFncP6C9LTd72ijJqYTPvZgBaXuT
	iP/+eVG3rN26VEOWXb3EqfaoPHC69nYlYXtKLOfTNYAUSwXqHsdvLOCSPJJk3J3Dp0CLZInD4Zq79
	9U5jRHV66UOKm1LGIJf4E7E5H0ap3bH/9UixJetSpmakrKQ+Cq91YRfzzFsRPIvbI8aZt2K1zh3BL
	U2p/EVep70hfNQ5Zeq6WXW13UzznRKm96DGnf32umHZwDqIRV6PSMqKgA2L9ZFmdwd04G0h29Os+G
	IZaLKQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2dg-0000000ADuk-48lM;
	Thu, 05 Nov 2026 18:56:46 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cd-0000000ADFA-0TwD
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:45 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6ddef424972so1842257eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904938; x=1794509738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riAAQMfBLq8mpLK4f+nQf7CL76Wru2zCVjChEptNvYo=;
        b=mU0Klqe04/+5YA/PKy7jh0lsu2yWLYOpopmP+7DBqmZnbB2qB92qvL+YrclYXnAhNw
         EfkUs70UsvD2H3eqKkzw7pqxoeKB93RMzVOvh38hIIeNRfZBB2xIfHcV5EZfgZTL0gvH
         5YXwJahhsIx8hz915NttKTV3piIe20qQsIQ6BJznpcVCCRzHuBcjJN/3HMRLQDpPpNQx
         3zmf4hYQA+tf03f1T3md9lIXMEmL/NNrleDu4ngOz5Pj+tvcmZzR+op3CZ7yH8FAnWOa
         97pp/RuJZtL9i4U+kQwwWoikwmsqH4mjhScvWAcWNzL75bnpQRjjMol2IaXfj5sWyhZn
         LWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904938; x=1794509738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riAAQMfBLq8mpLK4f+nQf7CL76Wru2zCVjChEptNvYo=;
        b=Udg5SxWo8ltpV/55Sq4qJVDj6INbX+hjw3l2v1TMdhbU1i1FwNcnLCJIR+b7mv9p6p
         HquP7WLwYmxRPS3ZVubmdfLn93qkGHFRVaN7ZjQ5OePL65bxA9LkXh8FJbgdGV1d5Vrt
         i2fJ8Ls2GihpOir6R78qYAqR4NqDwfCTRPsUg2ysHlAD706r11P4KmsOiUw0zZb/MrOy
         wgA06kI+jhlh7zPvoJ4hBtHLDYThqdBY4lJLGZLN6rKWZAt9Rkv2XcW3G+mfY5B+jkkJ
         Vbo+81z1LAHWfNauvCEY+hiVe1i2NxSimvyAycFk9xHxla4dbB+ft7QC0WEV0qgZWE8e
         zxSw==
X-Forwarded-Encrypted: i=1; AKwUvBxdZmyVjVpRXlMTS5obWNeJ3Gq545Uy6G86mmMOLXuzIl15SR8zQOeh/WRD446pNoos1W0ou+EiB00=@lists.infradead.org
X-Gm-Message-State: APuU4Z99k+EbvKwBqnwGeloPM+lyVO113dAcMcVdum4MiG2uhItaIAG2
	ddV8VTAVVjoMh2vwV6Nt1PC4cNV1YvDgJurvOMmtCTzIb4dlFPMToMks
X-Gm-Gg: AYBFou0Mg8ElEDbFXgKHyzPo4YTDLWUA6uQSpij4ojMsckBP6Oy0Q8HOkYuBbYl0KZb
	oqWXok6RltrszmXUEYSHMmg4LNkdnmp0KRGtG4xEG4D2UCR8XYpgYPJprTKaH4XxuKqfBSjYatm
	T64rhBszKbYgUoT50zVcPpgZ/3OHkqSOF5BAbzvyELqdE1xskBrwAEO35sdtI1sey0hTlmBhUeQ
	pEwQtx6+iN0bNv1iqfF7xU1ja6xvheihbBVgOfyT0HwOWNIO19GI7pgCn0UbWWzj2MyAisjjnXu
	wnUFj2ihlGpMSeQzKPWSXDYPix3y5FCgVTE8h0GQ7RaShvHXqD3JVclhUj7KLcRqyCHlC4mwiYc
	+vf+mZv+LSIuvzkP4sm9SKSet04JMGM6EFwMg53MikLq4kSi3AmZq0M7arTEuK+gkGfTM+ls4XV
	MKmNjOVeJuwZCS76zZkBOmAx0ML+HgFbQaxBpiYK6nukacyqauneV47awZ5Ta10tFds3n3ec7JH
	h6tpQu+sTK8D+6m/Qo3U0JqkrVPswGx1lbohVw0aOozakub+m2CzDDY25PGnVcYSPWKjEZKxXSI
	ceQpO0oNdxVVhPINzLO1tVEl8wJJe+k+zNVdtszhjYlk5TCARkC08MZTQ/gzSNrrwQFLR2N/kH7
	j7OE8PYPPpBQyV2CxQp3savTqED+lQeyNQE1EqJiov3gKBM6u+KkF3yS+nWf/3GhYmaH2QnkIJj
	CDewlSF3Sf65RjUb8Ky1j4ZNX2/EpoqoCFIJcVjGq9hsAsBRJPstRD
X-Received: by 2002:a05:6820:2484:b0:716:bb14:b806 with SMTP id 006d021491bc7-716e7abb94fmr268521eaf.75.1793904938216;
        Thu, 05 Nov 2026 10:55:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:21 -0700
Subject: [PATCH v10 05/26] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-5-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105541_216313_B2A9F19B 
X-CRM114-Status: GOOD (  22.28  )
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

PIO transfers each logical ECC step through hardware slot zero. On
H6/H616, user-data lengths can differ between logical steps: step zero
can have 32 bytes while a later step has only 16 or none.

sunxi_nfc_hw_ecc_correct() uses the hardware slot to select that length
when filling pattern data. A pattern detected in a later PIO step can
therefore overwrite the following OOB region with step zero's longer
length. The protected-OOB write helper makes the same mistake when
loading slot zero, reading bytes beyond the current step's user data.

Pass the logical step's user-data length explicitly to both helpers.
Separate that length from the user-data register offset: PIO always
starts at register zero, while DMA advances by each preceding step's
length in four-byte words. Update both DMA callers with the helper
contract so variable-length steps continue to use the same registers.
Fixed four-byte layouts and the on-flash geometry are unchanged.

The mismatched logical and hardware indices were found by code inspection
while consolidating the PIO and DMA OOB paths.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 106 ++++++++++++--------------------------
 1 file changed, 32 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1a61f608ad91..ae18a7fbca77 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -942,45 +942,22 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 
 /* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
 {
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 user_data;
+	unsigned int i;
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
-		sunxi_nfc_user_data_to_buf(user_data, oob);
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		unsigned int reg_off;
-		u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
-			user_data = readl(nfc->regs + reg_off);
-			sunxi_nfc_user_data_to_buf(user_data, ptr);
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
+		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm)
-		sunxi_nand->oob_ops->transform_bbm(nand, page, oob);
+	/* Undo hardware de-randomization of the plain on-flash BBM. */
+	if (bbm && ops->transform_bbm)
+		ops->transform_bbm(nand, page, oob);
 }
 
 /*
@@ -1031,48 +1008,26 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
-						const u8 *oob, int step,
-						bool bbm, int page)
+						const u8 *oob, unsigned int reg_index,
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
+	const struct sunxi_nfc_oob_ops *ops = to_sunxi_nand(nand)->oob_ops;
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
+	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && sunxi_nand->oob_ops->transform_bbm) {
+	/* Compensate hardware randomization so the BBM stays plain on flash. */
+	if (bbm && ops->transform_bbm) {
 		memcpy(user_data, oob, user_data_sz);
-		sunxi_nand->oob_ops->transform_bbm(nand, page, user_data);
+		ops->transform_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
-	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
-	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
-		const u8 *ptr = oob;
-		unsigned int i;
-
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
-		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
-		}
+	for (i = 0; i < user_data_sz / 4; i++) {
+		writel(sunxi_nfc_buf_to_user_data(oob + i * 4),
+		       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1125,11 +1080,9 @@ struct sunxi_nfc_ecc_read {
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1228,10 +1181,10 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
-	unsigned int user_data_sz;
+	unsigned int reg_index = 0, user_data_sz;
 	int i, ret;
 
-	for (i = 0; i < nsteps; i++) {
+	for (i = 0; i < nsteps; i++, reg_index += user_data_sz / 4) {
 		int step = first_step + i;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
 		u8 *data = read->buf + step * ecc->size;
@@ -1243,7 +1196,8 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found, &erased);
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1272,7 +1226,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 							      true, read->page);
 			}
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
 							    read->page, user_data_sz);
 		}
 
@@ -1461,7 +1415,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1675,6 +1630,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	unsigned int reg_index = 0;
 	u32 wait;
 	int ret, i;
 
@@ -1695,8 +1651,10 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
+		reg_index += user_data_sz / 4;
 	}
 
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
