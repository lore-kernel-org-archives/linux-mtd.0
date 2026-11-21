Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFFC606A32C
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKBsopuu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXYiqB+r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0v/j/gKhZMt75VXOjyxCQjgn8fgmkWYy0K4yMlPxMxQ=; b=QKBsopuuQ+rUqwBounrU4SSM6q
	6yFS/IdAR30K0egHnR57kqAIzTnmN3G/UJKNLC02qQ96wHXZjeQ74ZHjjVhjym6kU5jt00mhaZYSF
	OCmvpbwLZzzcvq0Qsay5V2ntrUinJ1enOFAZELJHZr1Hsu4S0zqLb7Ao/Mamux2/6PMzNcuF112XT
	JxcAo29DZWs7tFa/bGNAg2fkiYA6lb83TFlEwg0+kkL8XMmDSs5fzjN1pzeKFZ000sM42rzDtkKmU
	x6uPX3liNNl1GAVRKKJuZLa53085QxLX9KHEcaatqAtJzMtWD3xH0WCVzLIpawIGznar0ZXnnYkLs
	v9Is2lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZed-0000000GaX5-3Kws;
	Sat, 21 Nov 2026 01:12:37 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdL-0000000GZNJ-01Li
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:19 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-571eb508edaso714183b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223474; x=1795828274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
        b=FXYiqB+rMXweFsjd1x7B+NowYPvk5l0aLycq+561btWXBG7IMcrCWRtZdCJ/uqZK64
         QLQxX8NUGF+1BWxRx6opeRyRBGPaTKnjQ+IuhP1nkzNcdXDJh3JUGjZYB5q/e+L8DgnR
         xhMLO0y1GRRl/4YYLi6hC585Shm6EW32jT+Oj9JqAVFt6rwKCcxJS+6Hbl/qFarbn08s
         Yu06+WpotBAmmE3CsE821U89T6zSecqkwMW1OWYOtQ877zwAhnUrrdGaROeNDu8jNwHm
         djXhCkUehKDCm1PCidbAycQyiIW0cHrOiUxAtmrESj8s3PL1y1P53Rz7HzfLGbLimoM5
         Gb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223474; x=1795828274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/ZOEZdBIX9Ht5ZtaAIcNRRvXcoTuAbgmishigtjssc=;
        b=gRL+SNt/MYYO+TLtpuKY+XNMttwta79CdssXwkb+FS6who44DlbwW2ouA2wgS1GjMm
         sm5sS7TDAk5By8+vaoR/6sL7uawCCEsbWLJFaUMiWtIi5zhRa32roEIOMRFIww8O7T4Y
         yiyjU+ZlTY+8B53cAiw4cXU5cpa8yg4uveluyLlK+v2mJeYdtC+hretrK4Jaoqqgw5IU
         kd7z3vfEJWy5UgH+jLfX7jy71H1/lq8OIOrXV7yUybjWNw6n8DYw2e1xkJQjp4hdIZmk
         en4DtCheY8HiY8z8iqSE4CDstkJAQqOdc0o8BhuFmm3Q3l0Z8PfokvfH1GJhjWUCftFg
         pzYw==
X-Forwarded-Encrypted: i=1; AL+hErEiE8736Y3LNF/yOVHVaXJozI9iPI2ffnZgpo1Yc0osC8klc1X4Xy/zqcTOk+fPVSpruxMRK8n4rVI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9SOhOmvXTsWdRsd1NJ1KMWpXTOYvXIlb+YYSkzz3TOeKAfRBGt
	r4rhjST5s/0TdRSLQ72/VfmYVZfnh8XguzQQUwIVNlFHvv45HXSpA68e
X-Gm-Gg: AYBFou0MEZSaufabdU9RKd47BWhFJB5HvZpwYZrJ/nIKv4nLeIzPJCW0Bp2mGdCDaZ/
	RHfUd2Nx+gWKVO/54S/Q3dg3RjMQyaBpgWrsE+9WcjU0lq28Cres0bRU21OCQ2I3TCXjtu6stvh
	JVGGrFwBcs77cNXxCgwOcRwzLOg+Q9pfGKp4iALI1bqRBqQVxezrRLELSmX9A+isLJM1UGBbZGe
	rjhwm4y0ABC9njMdV2/huJ8OPxQbrhmZ9ynlZ4tWKoJin9t/ISwWNkuX76gQ1VFFQkdqk76CBiA
	xTOqOM2cPen227YvqZdUb8Nn+Ym3WYB5qjn1zy4PbGwbVaG54EHZ/qCzXBXYBnnE1Ari4s9RZYT
	f8LZteWBzCi88g9FASxzpl3KNKanxoimOwYzLOwy7rRitvUcPbm0pb053JvjzY31n00yxlambBP
	BEwYL/bog7tEc1eDiaCTQmDJ2juZN2xpLEiYqr0LI9lgrtbC76x1MhGHQG2Bc86XRSqzlvWwyi2
	qiUcOIrT/2qvAF1FOX6N1Z0fNt5B2vzu5LkLbvc6xy/DWCUjsKPyaaGQ6/KoVNq1CMJELhPx0F0
	d9W4hRjYE7QLh4IBRBUZ8k/BefhntQJpSf1Kfjf1lHqm7lKOYVfrIyiAWEKt46zolRWtQHsgCGk
	K0keOyFhqzC/XY2PvwGKkqphMqAX5B8C+yiOPmfx9vhS0N0w3aH87TINIuyzP/IZwhkiOYziSE5
	wVcdF55NDcIBsitM4d/Sw3AF6HFvo/Ba6KmaDbaZBlQE/bhUBF/n2g
X-Received: by 2002:a05:6808:130a:b0:573:7a6b:f32c with SMTP id 5614622812f47-57a0c4b923bmr5275123b6e.50.1795223474187;
        Fri, 20 Nov 2026 17:11:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:36 -0700
Subject: [PATCH v11 13/26] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-13-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171115_266136_972BCD62 
X-CRM114-Status: GOOD (  19.12  )
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

A NAND read can report success with missing bytes or bytes from the
wrong column. A write can send PAGEPROG after transferring only part
of the intended data. The SRAM transfer helpers stop on a FIFO or
completion timeout but return no status, and the hardware-ECC paths
ignore some column-change errors, including when fetching OOB after
DMA.

Return the transfer status through the randomizer and OOB helpers to the
page callbacks. A read with a NULL destination still fills controller
SRAM for ECC and must report errors even though it does not copy to
memory. Disable the randomizer after either transfer outcome, and use
the page callbacks' error exits to disable ECC and skip program-end.
Update a tracked OOB column only after the requested transfer succeeds.

Keep transport status separate from the maximum corrected-bit count:
zero from a successful OOB read must not erase a positive correction
result. If an OOB read after DMA fails, restore that attempt's
corrected/failed counters before the caller retries the page in PIO.
Compare the tracked write column against the absolute column of the
OOB tail. Otherwise a small-page PIO write that has already reached the
right column would now fail on an unnecessary change-column command.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 175 +++++++++++++++++++++++++-------------
 1 file changed, 117 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e76f7cc67081..712648864407 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -663,7 +663,7 @@ static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 	return min(len, nfc->caps->sram_size);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -679,7 +679,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -691,17 +691,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		if (buf)
 			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
 				      cnt);
 		offs += cnt;
 	}
+
+	return 0;
 }
 
-static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
-				int len)
+static int sunxi_nfc_write_buf(struct nand_chip *nand, const u8 *buf,
+			       int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -717,7 +719,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -731,10 +733,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, poll, 0);
 		if (ret)
-			break;
+			return ret;
 
 		offs += cnt;
 	}
+
+	return 0;
 }
 
 /* These seed values have been extracted from Allwinner's BSP */
@@ -884,23 +888,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
 	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
 }
 
-static void sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
-					   const uint8_t *buf, int len,
-					   bool ecc, int page)
+static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
+					  const u8 *buf, int len,
+					  bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_write_buf(nand, buf, len);
+	ret = sunxi_nfc_write_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
-static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
-					  int len, bool ecc, int page)
+static int sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, u8 *buf,
+					 int len, bool ecc, int page)
 {
+	int ret;
+
 	sunxi_nfc_randomizer_config(nand, page, ecc);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_read_buf(nand, buf, len);
+	ret = sunxi_nfc_read_buf(nand, buf, len);
 	sunxi_nfc_randomizer_disable(nand);
+
+	return ret;
 }
 
 static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
@@ -1135,31 +1147,39 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
-					    u8 *oob, int *cur_off,
-					    bool randomize, int page)
+static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
+					   u8 *oob, int *cur_off,
+					   bool randomize, int page)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != (offset + mtd->writesize))
-		sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
-				      NULL, 0);
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	if (!randomize)
-		sunxi_nfc_read_buf(nand, oob + offset, len);
+		ret = sunxi_nfc_read_buf(nand, oob + offset, len);
 	else
-		sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
-					      false, page);
+		ret = sunxi_nfc_randomizer_read_buf(nand, oob + offset, len,
+						    false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
@@ -1212,15 +1232,22 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
 			if (read->dma) {
-				sunxi_nfc_read_column(nand, read->page,
-						      mtd->writesize + oob_off,
-						      oob, ecc->bytes + user_data_sz);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off,
+							    oob, ecc->bytes + user_data_sz);
+				if (ret)
+					return ret;
 			} else {
-				sunxi_nfc_read_column(nand, read->page,
-						      mtd->writesize + oob_off, NULL, 0);
-				sunxi_nfc_randomizer_read_buf(nand, oob,
-							      ecc->bytes + user_data_sz,
-							      true, read->page);
+				ret = sunxi_nfc_read_column(nand, read->page,
+							    mtd->writesize + oob_off, NULL, 0);
+				if (ret)
+					return ret;
+
+				ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+								    ecc->bytes + user_data_sz,
+								    true, read->page);
+				if (ret)
+					return ret;
 			}
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
@@ -1251,9 +1278,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
 				     struct sunxi_nfc_ecc_read *read, int *cur_off)
 {
-	if (read->oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
-						!read->has_erased_chunk, read->page);
+	int ret;
+
+	if (read->oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						      !read->has_erased_chunk, read->page);
+		if (ret)
+			return ret;
+	}
 
 	return read->max_bitflips;
 }
@@ -1272,13 +1304,21 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	int ret;
 
-	if (*cur_off != data_off)
-		sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
+	if (*cur_off != data_off) {
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
+	if (data_off + ecc->size != oob_off) {
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1401,13 +1441,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (data_off != *cur_off)
-		nand_change_write_column_op(nand, data_off, NULL, 0, false);
+	if (data_off != *cur_off) {
+		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, data, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_write_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1433,27 +1481,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	return 0;
 }
 
-static void sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
-					     u8 *oob, int *cur_off,
-					     int page)
+static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
+					    u8 *oob, int *cur_off,
+					    int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int offset = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	int len = mtd->oobsize - offset;
+	int ret;
 
 	if (len <= 0)
-		return;
+		return 0;
 
-	if (!cur_off || *cur_off != offset)
-		nand_change_write_column_op(nand, offset + mtd->writesize,
-					    NULL, 0, false);
+	if (!cur_off || *cur_off != offset + mtd->writesize) {
+		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
+						  NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	ret = sunxi_nfc_randomizer_write_buf(nand, oob + offset, len, false, page);
+	if (ret)
+		return ret;
 
 	if (cur_off)
 		*cur_off = mtd->oobsize + mtd->writesize;
+
+	return 0;
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_pio(struct nand_chip *nand, u8 *buf,
@@ -1574,8 +1630,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1698,10 +1754,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
+	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 NULL, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       NULL, page);
+		if (ret)
+			return ret;
+	}
 
 	return nand_prog_page_end_op(nand);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
