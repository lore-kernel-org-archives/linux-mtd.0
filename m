Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E7CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFgfS4oAvl1yhM2WwR3VgCAskZ5EHap0hl12N/RYEio=; b=KfzGj6mrCTKvpK
	p+g+K5u5Y0kVrDSIxtKWYH7otz4YokyGX3Mzl45WFaei8wVHTfBLaJhVOAs4adlEookyTDiEvhMDL
	Xum/s50qKppGVMgC/h7D4r8sU4cz78r2KrUvJhPVOPy6gtZ1thWTa/zmk8+x11VJv7lzz+Kt7M6y9
	Iux8+EyqywD4yDD2uJMjosacbrpEyWAop5lpqqnVPjxkj1oCaSw82PMvO/1f43HnNyl0+/D7519Uk
	t/abTMhweOwvTMj7zPnbDoy3ggu0fgXu0lxd/FKDiQAkvS3LaTTQMc/4ntYMpacUYbpWaIYhTiKhT
	bGp+eL2E4CU385nGh+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMY-0000000GYKJ-1RMS;
	Thu, 15 Oct 2026 01:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMQ-0000000GYBs-3slZ
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=; b=etJykaP8qhhdhnMpl61I/h+Ay6
	qPdog2u2KFUlKNbAatCr6DIGqLtJ5CObAHLDPUIjWatiR2MRqdBqxw01wbRIb11rnAJiKyWCFmrBT
	bYiZUEZfpPJoOAMDVGJsYKYv8gte6gbiqIUehFClsOJGrk3Rn9r57KqfaH4+ps7QHYjqRbMlybPcP
	n69Vc/GPD6Px0OOYLFNGAb9RIpJovzjgmrpWK2xOVXftwyns5Pnj3lPGKilklHxi8QzVzPRhvU6HW
	gzhgM9SiU8l53lvLYCR9TXJLlf4R+ZdvB6zMh3MQA3ew/R0fLRTX6qwqmDQbdf40ob4mTvBtikf9U
	gYILJSvQ==;
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMM-0000000HLVk-1O0O
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:20 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-49e5f85ce89so2072913fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028056; x=1792632856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=ASRx9S3MfXH6ludb3+FXZr/Lh4lyg0k9CFWng6W6nRHZupTN3OmP5vTTjELW1ksXtL
         JylQP+LmpPrW5bZ6AIcKAJoMvcb6BKbQtmhEeQ5vDey54ZmixHdoM3Mk5qTTTUK5veZf
         uOA8iFaNv1nyfxcRKFgJPmss8PnT5cjUFE0UEuECqttAxzxCY0TC8rVXXt6hzCd+Q4WE
         PlHE3pbUQtfdIgR5lmTcoGbWwr0ZOsp79ZUqN0RtDS6LWtmrISUMCDFci4Cf8eS+UCWU
         Z/R9qiRCtUoQpW18kF41uL+lT1jpM2uoYEoN/QIjAZG/pmFK6yat//WPtgqeyZFQXxEu
         1a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028056; x=1792632856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=gFWAJM6/Z2b19l/Uq+Jw4MMYofMfJWU6jGLrHoLvPIKWvumAttVb1XxGyDv/rcvmaC
         znRZB5oCBzuRuiEjSMiaWES5Q0hWlV/ag/BUkHG+FMXTXurrKNnVpt6U7Dx27zSeq58R
         zCRXgHg3ArK5oulK7x6R/5eMZkHUtarm/MutO1OGwgvwFDD+QiuwceTjYlctQ2S+785w
         YTZtrc5LEx1z8SEoP1bPySCJKtoa+Sf8fc8d+D4mii5alQkQ0Ifytl8aZO8Jq07I5tcT
         tHz5PpQ3BgP4zwFOui4nSnIVLUvK1Fb9Jy+O93LQ7wL2MlFNMYenu0nhFcY7unMkJ/MY
         zf2g==
X-Forwarded-Encrypted: i=1; AKwUvByDjNpR0cfgRL4su/UQrBqGI7R2H4qCCFQ/e7z7D3LGZO+Gc0OGZom5eta80KjeKweyLxcRAs0pmT0=@lists.infradead.org
X-Gm-Message-State: AFq9FYKqkIM2kYtczEp4Z1pfQ0Y5jveLJK0BT2kzJfdUd3rLMOdoT8eO
	mwLsRH1a7GOpJx8nFCJ7kC8Om1S6YXXkzWkZoYLRhkK3sFrdN7d27DW6
X-Gm-Gg: AYBFou3VmRgTvuWsyV6fV2juk5ejVNufq6rCVsxTAxN4/3jDLetcKtz8j17SkwvX5ju
	CBlSQsVz0ZnhYiktwpHyYjcUSqvumHE85fsjqSDqaZ08IVqSivHL/aYo33hYz0djlwXLD3ojxlH
	l64Ap2TYzQuxSQkCsYsRYSnmDVmaFTsoiX0VvEhAqryIR0y2Zg28UTVbTJB1yz6s17tiQ/o8eG4
	AFp3U2pGNpdIc2nHViDBlBTFZeJmHMwyMWmF9BbIQglh56xdgBWQt0szi7zMmhNPhh0EemIlS6Y
	rTwIieRfFUpsPm/Z+dFrWsngt1hyf0yozUetnyQjNwn/mfneZevAiClTrZhygZ7CzcQzZhnJ7Qn
	5TrbvvoTKVoTN6CWBc2JT9Xqa77d4wytkiB9aJY6367HfwaV2Q74DCtjq2so1KA3p3jgGjp726d
	pvko1zr3znhPIu5IZAsar2jM4LtY4sKy1n7SK5kg4gsadik/tSeE0o/v+1JAEt+jHC0nGcHY86r
	gTdwf42ume1oVesX3V/EF8IuIjhmARs9pkBpk3IO0MkdGR4ajYMFbLnRazbO+mzcBXIgGIdgJW9
	9dBBRe17fHpH/fXt94ttAGPGDHKXoeqJhHMxV8TQb9ebdzM61ZSHWj0z55jVU35zYEwiNsvpjFD
	bSyaRQoV3XzWO5b2Er1VJ
X-Received: by 2002:a05:6808:251a:b0:4cb:818f:d56e with SMTP id 5614622812f47-50c4c7a2fbdmr18782064b6e.22.1792028055832;
        Wed, 14 Oct 2026 18:34:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:50 -0600
Subject: [PATCH v7 03/16] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-3-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_023418_659576_0B9D75E4 
X-CRM114-Status: GOOD (  20.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c2e97b8656f7..6c0d3e2d2be2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1030,7 +1030,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1042,10 +1045,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1308,6 +1317,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1325,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1378,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1456,7 +1478,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1464,10 +1488,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1480,7 +1505,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1505,7 +1532,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1514,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1532,7 +1562,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
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
