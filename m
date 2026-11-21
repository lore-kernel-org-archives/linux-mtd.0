Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76217606A6A4
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUnmQJaO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9NzU5oD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uMk2ewWqlNg0j7sci4aHsdHqT3Z84QHcQz7Blifv2tY=; b=xUnmQJaO/UgOiFGZrdvl7ViVr6
	VfS+Rqz0vNIdjzzKnipOA6SEUIu6FB40ooZ9THyLocFEvHUCjQUmE4Wq+pFxhSqq8BJWPzsxFf6Cb
	gMa9sq9fECl12w4+u7SxhJVBPbPZ24RWtA7DfRknmkHcXXbK2/iEkwxO+XXJm1MpppBlpsSazbmdi
	YdaUnmqN0zEG0EtT3yKzY8z2Jt/oDKMM6HoFkUffjLpPCJKdIYJTy2DMEquWsPNlOoq+pprMFx0Wj
	zpw4CgMfB+iFeFSeJNvKNyY+EdAYW6jeFfIKcCDxOG7a1VARYesJGaFkqKwT5HnjgyOP2gvckZvXA
	SNG3xGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfH-0000000Gb1J-0BuN;
	Sat, 21 Nov 2026 01:13:15 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdP-0000000GZSE-2cbf
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:27 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-53ec2cc397aso981316b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223478; x=1795828278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=B9NzU5oD4kYb2O02X5H2T6jEOWwG3DoovTuZg56EDjnDuH2MSM+wXJfwtJSvyLq5n4
         w/gH6yIPOmWYLL6LgW2AVdUkWKylbC5NQNYovu8nREYVuYh2m8UIQqzwZyHugK+34ZlX
         HNglSntCsC9EQlqd9c944QZxQH7xTo4jGVv+wLWDjwQ38veBzU5E90icEfHPSv7DSlhB
         K6oG7imXrxULN1QwvWCxLQxeYVy+AhFBfc5JLr2cADi36PRKaRApKdiEAtZm+9KBf3Hf
         JyukcuVfRv6Ky57A5qddYoAAzYmSr+n67+/qKm2UOXP/EKUtdFhtXmq0SKcY38rG6D1c
         4UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223478; x=1795828278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EEb5bdabVEoMSRLLJqgNbBs659DuSJGBxR5aYGgxzc=;
        b=d8UhwL+bFYXLQx0Z/Gb8Iqcb2WZyk4zn91avXAJiAKAIBQmYGJwwMhonf6w61Esola
         enBfurr2lcOOlQ6wfHwp8f3V7iZaVTE6w0MpoF0dN9a7TARqhRcYtayzR149smxFypGA
         hIG6NICzMV6XXDl7F8cnM97ybQnAnFFaE/sD8o6twP34E1Lgo9Fw3oHlr5S2KNCML6IX
         UaFk9Pli25eiDwtyzT4Hrg4eFvtQeRvadnGSbfdQucwP0NgqfNgFzslwhmMT7l292N3D
         w0DV4bNpplj7OjbIfCHhtkS8XxLhRg9xHrGhC42MDNeBg38fu1ODFsGLNHR+6n/t2Q/y
         4HtQ==
X-Forwarded-Encrypted: i=1; AL+hErH8VZVUqAPVDiU4ZdD4MfTZ+e7C/Zd6X+5UK1w+u8PIyl+5UzLh7/uw7W97sBhdWtofgRF3v1FfOE8=@lists.infradead.org
X-Gm-Message-State: APuU4Z8NXjhm/4454MweCKgkuXRYIS+o6ERxxAeYVOYTqVK0zO748MFw
	Aj+RfV/zoIVLPtrHpQrpyk0Aqh7mIhFynKGWHosJCw3mxwNOZvU7l8ju
X-Gm-Gg: AYBFou1lym7XNpQCndJ7gB9S7Rln5IucgtbROA6jcyzAC/v6LWTC//5qRn9wNmtlOET
	arHpUmJ54Iz7VU2uRrGzopxddTngP6wQFDLuhUd33InWhgY4VE2t3jRkEHxSAcQeKtU9dR2GdNv
	lK0sLW7h0hhSkORwVHEKFVY0mwCLNprwxEmjyK2d2vlBfe+ZgDR5ieSwpgUwXUUb8ZfgL8GBLrM
	xdrRwjjAwRPfSAj953S+e2etDMqrxWkCwVfXgdW40qc490/BUXSgOj93WZm/lgjcxecsz8a0Cl7
	H8Shq+p+As3mj7eSaq6OsxenHPDtlq/Ml1AUYmSAYfowQnp0L2Q7KhMXYOLk3BqQ1BcFsUH9pxJ
	kWnmkjiU4DqKuRMnVLLbnMfEQMAxNqSOVsLM4LqZB50k9D8qQmdIEf7ASedc40rQ1vJ6MXpmqhr
	CYTrz7AY4SUqHWEG+Wi5BL14plQBX2ow/nOo+5LUk6mGIOW3uK+95Hu1C3No2N8lL1W1jYWqvnL
	lVLRAZq0ISmPynOQPjcQ/kVctBxp7o80TjA6RIX1tOGE6Al60b6lrLhfZYGNGx7myYWxAUJsiiz
	x6Qtdy9SHf8stfWW9J7mQkhLUNkwf+EOMaYVRfYclkEL4rbk2x4MbZ5lVKYuHN+VCvk/0QFz/8K
	Oqo0imTL0vyd8PvjsAVlShfaV1xtHYGQqpoUmTtQngDfuKJ+bIGuKVD+qPvWGuKvHFbXsF0u+c7
	MJI4/LMUfVp1PrU/DuC7X1MQ/OMgQMOaPWMOUr7D18pKihpsx5Fa1s
X-Received: by 2002:a05:6808:4f06:b0:53a:9d3c:caad with SMTP id 5614622812f47-57a0a4079a5mr6188187b6e.25.1795223478418;
        Fri, 20 Nov 2026 17:11:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:39 -0700
Subject: [PATCH v11 16/26] mtd: rawnand: sunxi: limit DMA subpage ECC
 results to the requested range
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-16-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171122_473940_FE0752D1 
X-CRM114-Status: GOOD (  17.44  )
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

A read of part of a NAND page can return -EBADMSG even when every ECC
step covering the requested bytes is readable. The DMA path transfers
from the start of the page and accounts for errors in that entire
prefix. An uncorrectable error in an earlier step therefore increments
the failure count that the NAND core checks for this read. Corrections
in earlier steps can likewise inflate the reported bitflip count.

Keep the DMA transfer unchanged, but only process ECC results and
perform raw erased-chunk checks for steps overlapping the request.
Keep hardware slots and user-data register indices relative to the start
of each transferred batch.

Fixes: 2de85e733601 ("mtd: nand: sunxi: Actually use DMA for subpage reads")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7f93ce226f24..5415ac6960b4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1106,6 +1106,7 @@ static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
 struct sunxi_nfc_ecc_read {
 	u8 *buf;
 	int page;
+	int first_req_step;
 	unsigned int max_bitflips;
 	bool oob_required;
 	bool dma;
@@ -1234,6 +1235,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int bitflips;
 
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		if (step < read->first_req_step)
+			continue;
+
 		if (status & NFC_ECC_ERR(slot)) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1294,7 +1298,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 	for (slot = 0; slot < nsteps; slot++) {
 		int step = first_step + slot;
 
-		if (!(status & NFC_ECC_ERR(slot)))
+		if (step < read->first_req_step || !(status & NFC_ECC_ERR(slot)))
 			continue;
 
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read, step);
@@ -1451,12 +1455,14 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+					    int oob_required, int page,
+					    int first_req_step, int end_step)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
 		.page = page,
+		.first_req_step = first_req_step,
 		.oob_required = oob_required,
 		.dma = true,
 	};
@@ -1464,8 +1470,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int failed = mtd->ecc_stats.failed;
 	int first_step, batch_steps, ret;
 
-	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
-		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+	/* PAGE_OP transfers a prefix; only the requested steps contribute ECC results. */
+	for (first_step = 0; first_step < end_step; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, end_step);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
 		if (ret)
 			goto err_stats;
@@ -1618,7 +1625,7 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page, 0,
 					       nand->ecc.steps);
 	if (ret >= 0)
 		return ret;
@@ -1641,14 +1648,15 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 					     u32 data_offs, u32 readlen,
 					     u8 *buf, int page)
 {
-	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
+	int first_step = data_offs / nand->ecc.size;
+	int end_step = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
+	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, first_step, end_step);
 	if (ret >= 0)
 		return ret;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
