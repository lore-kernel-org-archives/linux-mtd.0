Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F235606A33C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wFCItCpW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=neeGVTDd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP164xhW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LlMoG+u4N/ySLu60vOoIIl1U9xZ9pigXhynHlJNeYks=; b=wFCItCpW+UrWh/AdKX2pyua+xu
	kReV3Gb4ZA3qy9/Z1ukvGk69EsW5ESYek/Jx29MNbCq3tdfZ3E+WA3rtcLOklRWsWX6wbRnkEpkPo
	q6QfEkiGrBMGr68H+cSVtVRom5p3XbSBgq30mW+CjtbQv5RS3gprLkXH0yL7bmzdcxIvHaryhQrFi
	ir0YcHnh4NJTYI5q/yaUU3HnN/egWNPojJbj5Rr69fozgjxhlUDIJkq7/JF5tQAA4f2JmHMHJH+x9
	TUvqSEV+NB5d5pC2R7N/8JyyeCdGP+s8Q1y7iB6Al3G0H7PltPdF4IZi8oVWzDj3wPkYbqDB+dmaI
	2vRXe6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2gx-0000000AG6L-2A8n;
	Thu, 05 Nov 2026 19:00:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d7-0000000ADc7-1Oxf
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=; b=neeGVTDdqlbJZTQpzHuYHM5mob
	TAPto90JJT/r1UzjZ9L2z7ZGBMgl+IBfRPgE9E79B5+oPpxWFnEmY1O/qnNbw0EK7Ie48VbgRPm0j
	laFE8KtIQwGRNkXYsDOrfQ3g2MNSCAsrTeC3OdgxfE1+We8pQSxsS0l03XF4YxCtLpTVV2Ld2x9ig
	q5g/p+OvaXlKkiq6rN4yXToVKPA8mBiZsLMYtsaRi6hsT+ol7n6KaRLV1ZS32WPGLskuxTclghvLF
	WEMgvxpYxydWsO54ky+LagBz8SdNhTLMYZFOj1SZy7nU0djCH5LPu+BZiy23gfYCI4Aqu9XA7P0v+
	p8Vipvbw==;
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d4-00000003R60-35BV
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:08 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6b1afdf5196so932924eaf.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904965; x=1794509765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
        b=kP164xhWEoCo3IMsFtb8quGC6KHx+Zbdjq9MFFvvDDQlXc0LsvXANQsBry9N7BM9Fu
         pYUjq/62J7bH4zaDZ0V9kFksBonnYcPUbTkJ2Fe05inH8vcu10RaKgcHxjmXT25z94DL
         Mnevg7bDr8zNE+CQXAPywlxcm7j8hrG/VJIW++glzdVFO3HUJYwW26TOTIMkWFG4FI41
         bK3vstsZ4nDoIRbu8hrYSeo5OpDZktkuRUWlBpVCkMs1JEua5+dml+tweDezQXRnsl1E
         z4sOwmhQKWMH0pbi/ZVWScSQIGf+TGwwtXnGmPv/e8s6691KEAXmNYSJI+gc5f+8+MlW
         r1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904965; x=1794509765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQAy4dqYs7TjtXxWS4cbH8B9UiQeX+sxPX5st3d37Tg=;
        b=BvmQzfhXh5FPQ4ufZHo+7qeUhudpljDjZNNTlywUDYUaSqZ2f0fX4JuiB/5Nh03rMz
         PVoDCiVj0uZYmtvQP1Xqaphgd8lXnR8hsj7isRHC/x2dLWX6mTw8GepD419bPo4cSI99
         pQ2k4+lSiz9p+Y6U6MgtStNal/RHhaTPn8zuion8pc6kAg+DqnPq/zhY7FQJUnif3s5b
         Ya68hC8W42a84Zc2NBCpUtMHrtepEDet7FUf54mdKL3eerhGV2ctVyiN7frjK6DHFeMe
         HTe/jdSdDF5RygmIv5MRRHa0l6hNCOXpWw5Uet5lkMt5JbWwAkXwwHdHicnXFQB59fbL
         +1aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIAZWdVHHhZzJXhUAKiGln5Pdmx9BE6MzKXhRYy+J5xQhNICWrslMS/779ZLJ5C24nhGdBBEnwPv0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8HmVPI8srel6ZTqOUXi92uJl2rPB3BvjQQnN0ewcqACNzA+EvV
	y0q1DCxv0CkEEzDYmekuXM46rcyoBi3SWNIuCLt6sOyaywyGUNabdLkL
X-Gm-Gg: AYBFou1evXWa8YHOslv/ChW6ZSyiKQQPdsFgC1MXfpM2MPQcCHlDsJ/YUsu+Dpx9fL2
	A7zEE2vBW5grqme9jj6pN0/14WEgf6H/erOnznLxswUP+u3ctiO7bz+IhTcPxiMuMUKeaJWZUdA
	WDtofpmNQzvmaLwPzrRYon2Lz0eDTochi37LzuBPUR15l5t7MBW4Q77JlemMJEzU/TQ3dzEGgoB
	ofh8Wn4UuL1G005LPNKnnbof2ZcxmvpyCDfwz5Mv5PS6N+ZFmN4CcWDbQcjqG+/uNjEJlTGOGnW
	QLAqEFLxOsP5jSYpJ0UVQDkyBZp9exMxXBqX0kl8OUzYYdX0mFAQJlfqLhNFkkpCpZ9HnaT4Wtf
	WyB1fMntotqAJaaJUdxKQ6ijZYwo8A0kmN+UdgT+lzS33fCbLM2/D6PsfcvtfSrZEZZdrE2FPra
	ugIIF8zMbBkCvxixQF6akNdYiCHbl3rTyqjBU/iAlydjg3YZ803bB4rSvXK72+EQ4EzbGwC3FQn
	ac/NNVt5/gz7mnFNtdVIkxWD7Q8N42sEJqkHXn5JEl9ZvnwIjZqx0qL9JDpelhpN/vDp+notb7R
	Dj2eAfjeVCjGfQpHMcKcpH1rRewsWIts4IkC7MjH1chiH7L8XTNz799slT8+7C964mWRFmMsMR9
	6rsK1+gmzfqmosuC2Xjs0oTB2N41weh0XnmI/+lpGpAcc3vPhS62xaoA+tmIV3FR2h8/BVfD9JE
	Z7WTV6pPYkwRkHQL2xDfaJvKtG8fHpYhBrN4TBNL5bP6PAT8zkw3D1
X-Received: by 2002:a05:6820:340b:10b0:716:d710:3f2f with SMTP id 006d021491bc7-716e79b789cmr261602eaf.64.1793904964805;
        Thu, 05 Nov 2026 10:56:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:38 -0700
Subject: [PATCH v10 22/26] mtd: rawnand: sunxi: reuse ECC status within
 each transfer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-22-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_185606_781794_9876C062 
X-CRM114-Status: GOOD (  22.85  )
X-Spam-Score: 0.1 (/)
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

A completed DMA batch leaves one ECC status bitmap and one pattern
bitmap for all its steps. Four consecutive steps also share a packed
correction-counter register. Reading the pattern ID for every matching
step and the counter word for every corrected step repeats MMIO accesses
to the same completed result.

Snapshot status and pattern information once per completed transfer.
Reuse the status read when the controller places pattern-found bits in
the same register, and read the pattern ID only when a non-error step
needs it. Use a cached accessor so a reader can request pattern IDs
without knowing whether the initial snapshot already fetched them.
Cache each packed counter word while consuming its steps.

Keep the snapshot local to a single transfer and invalidate the cached
counter before processing it. Consume lazily read fields before starting
another ECC transfer; each PIO step and DMA batch gets a fresh snapshot.
The ECC decisions and returned correction counts are unchanged, as is
the page layout; only redundant register reads are removed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 108 ++++++++++++++++++++++++++++----------
 1 file changed, 80 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e8286dc360ac..11fdc10c7f14 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -261,6 +261,7 @@ struct sunxi_nfc_timings {
 };
 
 struct sunxi_nfc_ecc_read;
+struct sunxi_nfc_ecc_snapshot;
 
 /* OOB geometry and interpretation; callbacks may issue supplementary reads. */
 struct sunxi_nfc_oob_ops {
@@ -276,7 +277,7 @@ struct sunxi_nfc_oob_ops {
 	 * Return zero on success or a negative I/O error.
 	 */
 	int (*read_batch)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
-			  u32 status, u32 pattern_found, int first_step, int nsteps);
+			  struct sunxi_nfc_ecc_snapshot *snapshot, int first_step, int nsteps);
 	/*
 	 * Finish remaining OOB; return max bitflips or a negative I/O error.
 	 * cur_off is an absolute NAND column, or NULL if unknown.
@@ -1212,23 +1213,82 @@ struct sunxi_nfc_ecc_read {
 	bool has_erased_chunk;
 };
 
+/*
+ * Transfer-local ECC result cache. Pattern IDs and correction counts may be
+ * read lazily, so finish consuming them before the next ECC transfer.
+ */
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+	bool pattern_id_valid;
+};
+
+static void sunxi_nfc_hw_ecc_read_pattern_id(struct nand_chip *nand,
+					     struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	/* Zero is a valid pattern ID, so track whether it has been read. */
+	if (snapshot->pattern_id_valid)
+		return;
+
+	snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	snapshot->pattern_id_valid = true;
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
+	snapshot->pattern_id_valid = false;
+	if (snapshot->pattern_found & ~snapshot->status)
+		sunxi_nfc_hw_ecc_read_pattern_id(nand, snapshot);
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(step, snapshot->count);
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (snapshot->status & NFC_ECC_ERR(step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (snapshot->pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1244,9 +1304,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
-
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, step);
 }
 
 /*
@@ -1315,7 +1373,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1338,8 +1396,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found,
-						    user_data_sz, &erased);
+						    i, snapshot, user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1348,7 +1405,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		}
 
 		/* Both patterns are already filled; only all-ones is erased. */
-		if (pattern_found & BIT(i)) {
+		if (snapshot->pattern_found & BIT(i)) {
 			read->has_erased_chunk |= erased;
 			continue;
 		}
@@ -1384,7 +1441,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
@@ -1392,7 +1449,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int step = first_step + i;
 		int data_off, oob_off;
 
-		if (!(status & NFC_ECC_ERR(i)))
+		if (!(snapshot->status & NFC_ECC_ERR(i)))
 			continue;
 
 		data_off = step * ecc->size;
@@ -1434,10 +1491,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
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
@@ -1473,12 +1530,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read,
-					     readl(nfc->regs + NFC_REG_ECC_ST),
-					     pattern_found, step, 1);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1489,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
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
@@ -1554,12 +1609,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read, status, pattern_found,
-					     first_step, nchunks);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
