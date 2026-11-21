Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087E606AA03
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPc2n/oW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uwn41ggx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5f2mv7CKxOm7X+KB4N4IDFbYLaXPkKGmHiaKQVE55ec=; b=kPc2n/oW4ybnZDSBFwIvlEfMiM
	hPczNsDBK1XYVZ8Iv6nF/mm1+ov6woTLP335hUuAAd732NUrU/z7FPSMS1R7WLNzdsiK65OuILn9o
	awNASI7M+zlzmTJwlY+HajPK70xD4Otq7TSU3HvqNeTBvzWJP8N81xRlMHGj8kOFfWZZRvsSY1oOV
	XRALsq0l56ntDlHPGCwAzq7cWDlRgcWnlhMf8CA+PKcX+fVX+TOgtH/jvSpMwi3sUg23VNF7ib/Mf
	BFJSpZaZstBJ89FCkCFOVD/TWyRyxE0+zaVmi8tI9Wz+1J3M1H3ROuQBpcbRVLD29+1tCBSRLDA5N
	5oKOWCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdb-0000000GZjD-3WgW;
	Sat, 21 Nov 2026 01:11:31 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdC-0000000GZHg-3jXQ
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:11 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4a451915d8aso1058766b6e.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223466; x=1795828266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
        b=Uwn41ggxbb+OGEWd7PlKULas7DStYO47rI2EJXheBGWwCwpXzmh5pKc0pXdBK3dkd0
         RsVaitOp+YR/LGPkPQWiVjYmImHtLAhKpSLwI25ZgGGva+nRVES8cYx9xmm5f+9Mf6J4
         TTjuP080H7o2yXPqlkVqtWoe7ALc4+3z8cRup+iWvpTgYs/rgYvLqbCk3bL0Jx9It+kG
         ADlkvaU1T1fpHxVVys2k0wnidMc2LoWU7Nh/TI3+5B3ecY8Gb0yzVkW2IdSBQPbo+zJ5
         SBxLyLJeIjISqYWdSCYNWcgjpUcpqmrUMsJfyXgkDeBqa0QhN1+CuxlWoptFzCPA0pTe
         M2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223466; x=1795828266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDxDnDKQmgOhb7t9CqFuoW8PN9zlg37X4nU+lrooV8U=;
        b=N0AIbbu72I1b1cwB8TLZNcCCocr5Z//geSWntb0FnMbhKGRSMCZBC4h0tvCN4r0Aq1
         gWO+ssIRVB2Tdv0IONcLvK3TnrBOx6+7eKxNbSVSFGytar42071keZ8u0gZinP8y8NSH
         AM+v+qa/dVZoZ4DpGUb84fNs9CqbrZLWjElBZmYWmiUcnNyjo5VitvthnEZKnl+4zCTI
         KkqP1dpStJE7fB6oq3Lq3SVyoOKjPfUvOTTk3icdM83qy+byP/pcTGJ2KD83opmjXEdS
         LnIG5JsVg/sKeZ0EulF1xLVL5mkgp7LgpadoS83xhzJc5H9bpHIkq08lkYeeQdwRrxzD
         GJCg==
X-Forwarded-Encrypted: i=1; AL+hErF06gnP6J+j44NAXZtVlimbgmJFNzDRFX067QHDzggj1acW8y1c29apUFgBTB3V9mVr76O8rH4vrJU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9xcK9MTucCALGBktAFeiWULpWFjcHDGQLN8B48wQlf6xSLkbjK
	NMVeLveChKt9H84totztmIc5IhtVUNIquA9r7qOI/5bnF7Q9y1QUYbgV
X-Gm-Gg: AYBFou0MuLYGZ0NAP4vvEi6PLgN5fQDR8+IcAtvpJCbE2Yk7pKzgrq5cDwTS3PiJPte
	WTgMZvoPxLbKdGTmbya5YyVMMgzJ26cq1873xRGYdRTB4I1GOp3PmVEhMuBzqofa2DJo0n4/FPF
	p9qwfUkl/BlbQ66FI71dEEkDOsRB7gTmwbtlr/8DoaQNqE/6jJxyCmoECO6ULXEmw3D5vvxKeKi
	twYC6fTLe8Y8nvQuar1qHR0dMk4AH/WgkxfOPmJ6OT9WexljjqCT4f32MGS62CN094XSJ7nQZMA
	a16F3QrQcmNunSsy1C3cln6HeF7rXdzwku20t77pVeL7CN7Z5mCpJF14Da6DJg/1iq9OBe2dQuU
	+m6l51d0jDTKJSnv/+zV+2Mmfk92H2+3cOKIW3AmIjHyvjSwzv2R+uqqBckMi7xr48pW9FqAoxs
	14Hz2dog3nqo07jzXukihL9uCtsATbHG3kSF+fjhQA8jAnGq9su1db88g9T1LLwpvQyeE3cfUZr
	VmYEDzmLpotb1g8BEq+g2ETkMhGOEtSFJzC7PhzlqaTD3ram8n5zSDjBeHeYe09FMzmh1+gpx8m
	On9XsNHNa/pRbUR1ApDkZhhTWoQdpf8GU0/ZdWfra+vawFLDHtFM9NdQkhBBDlyeTb3NLsGV39E
	mesVDR7ilthUlIVCvjCfz+D05+/WZyS1PMVuKGsrZRkiRHphaAzkX2xla6itiVP9V4hNmByww+0
	9DqRehHou9tU76YFpdlG7FSVzODra6Fjp9xFus1GVx6rBy5bqL2jCl
X-Received: by 2002:a05:6808:244c:b0:557:4340:4d47 with SMTP id 5614622812f47-57a09400d0amr6720622b6e.35.1795223465752;
        Fri, 20 Nov 2026 17:11:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:30 -0700
Subject: [PATCH v11 07/26] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-7-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171107_669844_49886CD9 
X-CRM114-Status: GOOD (  17.93  )
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

If the NAND read command or ready wait times out, an ECC read can report
success with stale data: the callbacks ignore the error from
nand_read_page_op() and continue with the page transfer. Return the
setup error before starting PIO or DMA.

After an ECC error, the driver checks the physical data and OOB for
an erased chunk. It rereads main data if scrambling was enabled and
always rereads OOB. If either reread fails, propagate that error
instead of checking stale data or counting a transport failure as an
ECC result. Leave uncorrectable media errors in the ECC statistics
for the NAND core's normal retry handling.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 45 ++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9d7e3e6f22b2..c5e429318de2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,11 +1120,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = sunxi_nfc_read_column(nand, read->page, data_off, data, ecc->size);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
-			      oob, oob_len);
+	ret = sunxi_nfc_read_column(nand, read->page, nand_to_mtd(nand)->writesize + oob_off,
+				    oob, oob_len);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1308,6 +1313,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1321,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1374,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nfc_oob_read_batch(nand, &read, status, pattern_found,
 				       0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
 
-	return sunxi_nfc_oob_finish_read(nand, &read, NULL);
+	ret = sunxi_nfc_oob_finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
+
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1453,7 +1471,9 @@ static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
 	};
 	int ret, step, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1461,10 +1481,11 @@ static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
 	for (step = first_step; step < end_step; step++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, step, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nfc_oob_finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1482,7 +1503,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1510,7 +1533,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
