Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E34606A33E
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ik3BWb8b;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T5mBh1hU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q1OtjKzqP/CGxb04/FW94AgUq7pSd17v4bqiEV4wlUc=; b=ik3BWb8bp0PlLJVdEIx0sTrjq4
	sgtqu6bW9S8aR7E667W5l4r5VaQOhIpqq+VZABioJP/aCF7C/2DcYuhAoOnMfptp93E0XZFqUoN0g
	lL5MeWYpOyrFufzpgdVO2bG2+ylRDWfi/OTOPSYO4JCdBv6v4wsuupxsxSlZP4/r/XbQuiMq/M9tX
	e2lf3aa0XTky9MhvfYAGmVbAdAfqYsWtj+Q+m4hEprQq8Pnwu3nmTGxPIsRGZcmWwyGw2mkPJBmMr
	MLRkBg0c/Guj8rG1cdgkH0JhLKVO0kVrfqFQD82AR/Sr97n3Wr2+4oJDr4f7u8yNcRNn2DdsuJ/EP
	kS8bhZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZgo-0000000Gc1l-19MZ;
	Sat, 21 Nov 2026 01:14:50 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdc-0000000GZir-0dDT
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:55 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-4911df1e196so894500fac.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223491; x=1795828291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
        b=T5mBh1hUaqll+4Hra0TTcEKnyBU+RMG4eBD43/to+t8cdbfHzvhfdYu0IgywqwEnt5
         q6YHBuuYpka7OmqiihZW95R4B+6owOjWy4OWbQebZYps79IB9b54coyinXdUyiz7/msC
         ox7MElp9z0Z5AO7KOTopo61R918hibHiKIBncTUR7ejYpbFxa1DF+vCHmO6qQ57mC+8S
         bnRu06pkugG2HJ1yJ+pJvjZawk0Tt+EjXygPHe7Jk9BvXMK5XqOAnrd5FQB+4hjkGfGu
         lqHU9MIdtaYIhQyOdhe9rOV6Neq3nmOKZfjBc1rZVKin/gf6am6bRIU5RvnlYQiY0YQt
         WBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223491; x=1795828291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6dsf3PUVYR2e83j22FZDt4Y383GBQ5T4kYYqbMeWQw=;
        b=AP4DaLqO6YJZS73VpKdodhqfMHwYjVk6H+MGrlXUkISxsVz/DkuCclZvaHejIwlvHr
         o0gV7sqFhYfqhwQRznPkzzeElpGLxw0Zg77A233egTAZTeONXA4YPNff0BmoNoqISzND
         q58PhImQoHPzRj7V9gkvvpK/Og+e2sMrRry09Jk8NdcbpKW5V/oW+VAqupyOlenWLmPQ
         WKxkwi2gJeggWiMyqWicwZp/5ndPkdmdE6lYp91Sy5kCxBWXtgB+0UkO9Yo0S5N1kuq2
         g44yMOpuSbjDf0nEaASUFUnKd3jcNcSR0MZeeBVSGpreR0T0zmhOw7jxVzVODj3ghI4d
         6BeA==
X-Forwarded-Encrypted: i=1; AL+hErEONU1BjCt799YveYio9ZwnmiZAmpVqzXOtJlwR3Xo0Tk7boH/IRQkWovc31QnUdZIXVLWqyktkMu0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+iAnYasFxy4JQfhw+kxsvPYA+sicWNRSiKur18Tk8Zwd3TgUWq
	XdI4UVpE3E/LO84CFwBBIMo0aS4bVQz83l4s/CRLdigkWTkOmBsT2bDS
X-Gm-Gg: AYBFou0R5DOmSW7NiAFRPMIwkMELhNmDJtjSJfiQoRG1+kbPZ3Y8Lv4iRaW2Cl1loje
	kalKh5EVSDwa01uKlAb3Q6Pevv1dwfgMvyKyqC+Fn7liBDEc0BPFheVFcXaLTeY7bFZOfqiQISC
	C/eEsRda/s00p1wC+DNYgw5ZVLNUBLdO7d2n5EiJQwrHjiOFYuoOB/pZwh/0eaIlEb4+IRvPjEs
	sMpEH9vwj/XI1Vwh/4c9bCV7040cU83cnif03zxYTt7PZcVL86rSF0aL3W7HT2n+e2pkCeKJBqY
	sL0fwNCchBclQ5jIL0dp6mWsFi2wDatRfhbMS/TZya3Y0HJJfoe77F9kIar4zTnwuAwbSo+olEf
	bSAU5MnEemjbu79tJaIkgdJ4IN9TdV/hrJHF+i1PcPgaOnHt30tuVgJLRVQO0fUr3QzKS/cvi1L
	SELeLgGJ4sE6QCG4BWXavQqyNKDSy/fI0BG4MwXwgs924KiRnG5GpMWuTqZLHzjHLulTXJCKd2A
	nlxIjSp2GTSd5P/mIavT2JVaksj7rZuCE1sSjfCRIXU3uA4IKpNgmiWzNhitAU7ETMlw+VZhuou
	IXyqqadVP8kVWFjnDu2iyzNbyjj9lcG4wqO7v0TPPB66jKWFFgGdeKS6+aDwMcUqB/aBUpedgvV
	9lUlSKeKc9wmyIC/ETctkh9ZlrKTDQ4fh0X+svPobtf8PMwrwQOpuFCvxtwnJFgAGNbdKHGY/up
	0YKsLtrPp6xgZg2+zXqfYQJzumisKBUglMIk5Y1DP04bHKBvYizEE90NZ7BplwLeo1sbzkZSsTi
	w==
X-Received: by 2002:a05:6808:f07:b0:571:846e:6f08 with SMTP id 5614622812f47-57a06c1b05bmr5537864b6e.5.1795223490849;
        Fri, 20 Nov 2026 17:11:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:48 -0700
Subject: [PATCH v11 25/26] mtd: rawnand: sunxi: reuse ECC status within
 each transfer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-25-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171132_304270_58F4B9C8 
X-CRM114-Status: GOOD (  21.11  )
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

The pattern ID register describes all slots in a completed transfer,
but the driver rereads it for each matching step. Four consecutive
hardware slots also share one correction-counter register, which the
driver rereads for each ordinary step in that group.

Take a fresh snapshot for each PIO step or DMA batch. When the
controller places the pattern-found bits in the ECC status register,
use the same read for both. Read the pattern ID at most once per batch
if any slot reports a pattern without an ECC error. Read each packed
counter word only when a slot needs it and reuse it for the other slots
in that group of four. Consume the results before starting the next
ECC transfer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 87 ++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a722636f2e15..37f01801cf48 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1166,12 +1166,56 @@ struct sunxi_nfc_ecc_read {
 	bool read_raw_bbm;
 };
 
-static unsigned int sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand, int slot)
+/*
+ * Transfer-local ECC results. Consume the pattern ID and correction counts
+ * before issuing another ECC transfer.
+ */
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+};
+
+static void sunxi_nfc_hw_ecc_read_pattern_id(struct nand_chip *nand,
+					     struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+}
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int slot)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u32 count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, slot));
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, slot);
 
-	return NFC_ECC_ERR_CNT(slot, count);
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(slot, snapshot->count);
 }
 
 /*
@@ -1275,7 +1319,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1286,6 +1330,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	unsigned int reg_index = 0, user_data_sz;
 	int slot, ret;
 
+	if (snapshot->pattern_found & ~snapshot->status)
+		sunxi_nfc_hw_ecc_read_pattern_id(nand, snapshot);
+
 	for (slot = 0; slot < nsteps; slot++, reg_index += user_data_sz / 4) {
 		int step = first_step + slot;
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
@@ -1297,16 +1344,15 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (step < read->first_req_step)
 			continue;
 
-		if (status & NFC_ECC_ERR(slot)) {
+		if (snapshot->status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
 				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 			continue;
 		}
 
-		if (pattern_found & BIT(slot)) {
-			u32 pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
-			u8 pattern = pattern_id & BIT(slot) ? 0xff : 0;
+		if (snapshot->pattern_found & BIT(slot)) {
+			u8 pattern = snapshot->pattern_id & BIT(slot) ? 0xff : 0;
 
 			if (!read->dma || randomized)
 				memset(data, pattern, ecc->size);
@@ -1320,7 +1366,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		bitflips = sunxi_nfc_hw_ecc_read_count(nand, slot);
+		bitflips = sunxi_nfc_hw_ecc_read_count(nand, snapshot, slot);
 
 		if (!read->dma)
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
@@ -1353,14 +1399,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(snapshot->status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1402,10 +1448,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	int data_off = step * ecc->size;
 	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
 	int page = read->page;
-	u32 pattern_found;
 	int ret;
 
 	if (*cur_off != data_off) {
@@ -1441,12 +1487,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nfc_oob_read_batch(nand, read,
-					readl(nfc->regs + NFC_REG_ECC_ST),
-					pattern_found, step, 1);
+	return sunxi_nfc_oob_read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1457,10 +1500,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
 	int ret, i;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1522,12 +1566,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nfc_oob_read_batch(nand, read, status, pattern_found,
-					first_step, nchunks);
+	return sunxi_nfc_oob_read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
