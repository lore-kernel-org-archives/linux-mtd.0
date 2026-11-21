Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3518606A682
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cFcrmiZn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ij0mCMTs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9loNX1127NBEd4L0iP2iZ0omc1UuPh3DAF+eAKWWkLw=; b=cFcrmiZncsnlwlyJ5u9dcUXeZF
	Cp0y4m696VK8RE28ZW6rYY5L/RTovL41Zb+QzNuY0hSnOncE8BA415ZnC2Rz+/3pDVX+BaZcml+fj
	mc2+6r4Hwcc4LNY0dfdbPxaIZgomszzkWB45+36t51wqRxz/XCFnutoynjRYGek32DSygyzRGMddW
	L6blDP61TZU+17CFrg+waEo1KBqGhZtwiSw+VK+Hj1iaBbT5gBppZqffLvD+4+/hWXQb6gIyeVkCY
	lCEyx+pSt5cWc3uagQtFxdhOnD98BX6181ft94d+E570xF31pHYegPRxHyXP1Ohb7Gug9+WoY4c9h
	eS/UM6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZgo-0000000Gc2C-1pCT;
	Sat, 21 Nov 2026 01:14:50 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdd-0000000GZlX-1Dl3
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:58 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-57297329b3eso894808b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223492; x=1795828292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
        b=Ij0mCMTsQvF+uaJFo+1Z/plfs7VFWdWLnk1dMGq34PRKeBiR5QYZBjNfWpmKkISbsQ
         59lVNCXZrlGvHFXC44ukULLvuXF1vLv5MtLX4JPpw5vrGz7izVGVisgZG1W5aH+q+xbR
         +j2JgddCzV/iZXAhXy7SBwfNG0JdjfmUrPBczut12PoxRqm971fwq6mZPCNWRD/wSVlr
         0KJhSTfT3avXZq42PVCCb0ibZKS5sBYkAy3+e+ieawNcEgvzOzmzv8CO6l0nq2ZaCjqb
         DIHdBYofVmdWKCqTPMEFxGx2h/Gkj+NKDTd+Hb5niBhwkDGBau+QONSVFL1T68GINolU
         8QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223492; x=1795828292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n0HsVfrCilvrywczliXObPQ3Hlxg0mpvZCNssFAoKg=;
        b=EyCv0QC0vVGERXi6dJdTfDbK2/pz1AMBJUIwV86qjoxjhJOL4yKh29W5hC5dobq5hK
         22qoborZysZAFGbfxnCLEGXKJSX0d6mS7z3AsPQZ/37qybRldSC2BRcDKU9S4qDp3Qge
         DrgBpifQQhfGfHtL0Qf7egNuIidMgjZ7vK74KYsfMJduLwat5h5j3Wc1Osfl0lFTspFJ
         +Sp89m9ZVRONCZ5v6xvYhNW+I3fL917SG66+nf2tDvK1iJ9hvRwxn2RaWA38z0g/Rw6Z
         uCeSd3Yo4uSAwnC/BXRuts62506g0gqf/sFYLthAVEudb9ClXvFMWH8IFqDoHCUPJsED
         j4zA==
X-Forwarded-Encrypted: i=1; AL+hErErR21z5gn9teAjHkONTBtfXSeVcYHk40LTXeogrIzl/U3Y2JoXQAOVL12nDzYOjWCTucXafqEkbks=@lists.infradead.org
X-Gm-Message-State: APuU4Z+VbogYdaqFQ9jjOKIDJAs0lIftuazQevhPtFl5tlRgOE68wWSa
	DBxwY5p38xPlotuk/jqbO+GDKu9lmViCp9qgV/ABN2hJY8EaOgXDx345
X-Gm-Gg: AYBFou3XTGMrrslvSnJAxoE3DPsiKxXYKyzn51jfTCV/54I19xVg0dNNxlOCBI5/uci
	nT4UDkX3c93zHmVDmIp4YN+MrTBVDsRuYcteYB2y+vP3p72DP1c5ikQCcYh6vpOeBSQZhLGzQrd
	hjMyEBNdK3bv3DVeTQKdMGNQdU81+V+LXOpqP9Hw1IH/p6OHUxDUTmXA+CVcu7dQblMuV84mFbt
	9beoyaZjT3keuT2oAl45Rg6ikhU1mMMcON1c9sNWdtRRbpuk6XnoOeu4cibXyFF7+6PmHSkqPPE
	7vp7u4gcDhNByy+FXP0J41rBxnYnK5mKMJLIOtLmLepwwIP6RSJxOdeqxSwVpusB/6MmAWVndev
	oxsD93VPJjZpfOxwZ7+iAH2XF/hHZy8d3Rr7VkxvFplfEsTG+8xvFWS87YYQWPe2znCpdxT51Xt
	0Xf39D2FLJu7jCFPe9G8R9i9K+BC3Alxt0IR4m4AA88C0lsK0qSwo6MQNRGJOWTJgP4tnkQjqoO
	mYEaYSoS7ADKuXuiQ8XfOnfCBq8HqS/MtovAKNAw9HQED+m1zAuS/2+F7WjRg3Bdb8upHxWuysy
	CxLGglEvMy95KHEQtNkLsMFfiptauGMXtIEkXIqgiJ6CCpNa9EX2Ezz1K1uGYlpy8LGsBhDNiN1
	/oTGh8OGvwF1TLjLejDIhVV1WBXHchBVKFso+HPEWe0thCWLLgLol4LuqQnjJwXEMabw7LP+Pck
	FFFpIIg2G3b75Yco91hImDZOQmVskXtWfg9TVDZK6gx9Ue5qrzP/1g
X-Received: by 2002:a05:6808:508f:b0:576:1161:cfeb with SMTP id 5614622812f47-57a0d4ed405mr6123275b6e.66.1795223492380;
        Fri, 20 Nov 2026 17:11:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:49 -0700
Subject: [PATCH v11 26/26] mtd: rawnand: sunxi: reduce user-data length
 register accesses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-26-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171136_752331_5D47BCF4 
X-CRM114-Status: GOOD (  19.80  )
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Each code counts four-byte words; zero means no user data.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Use the same encoder for PIO. Each step writes the first packed word
with only slot zero set, so page setup only needs to clear the other
words. This also clears stale DMA slots before PIO uses the registers.
The lengths and on-flash layout do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 59 ++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37f01801cf48..31f995a1f5d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1061,10 +1061,7 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
-/*
- * On H6/H6 the user_data length has to be set in specific registers
- * before writing.
- */
+/* The first PIO step overwrites the first packed word; clear the rest. */
 static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 {
 	int loop_step = NFC_REG_USER_DATA_LEN_CAPACITY;
@@ -1073,7 +1070,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (int i = 0; i < nfc->caps->max_ecc_steps; i += loop_step)
+	for (int i = loop_step; i < nfc->caps->max_ecc_steps; i += loop_step)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
@@ -1088,10 +1085,8 @@ static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 	return len / USER_DATA_SZ;
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
 {
-	u32 val;
 	int code;
 
 	/* not all SoCs have this register */
@@ -1102,11 +1097,35 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 	if (code < 0)
 		return;
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses only slot zero. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1474,7 +1493,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1503,7 +1522,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1524,10 +1543,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1645,7 +1661,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1900,7 +1916,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1908,7 +1924,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
