Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A31C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDInDxVVgleKiHwZQEvm37odONswQ9pao5pExl1IxDA=; b=In/uaWc1jLke9b
	8Zv3hy8FkAwoGw64lo9OHnRoRkHsznsyhHq5y1NylsiWVY/HAg5tDdxuQBh/OKlWJ/vdeduUt/i6F
	hCTl74femwmFITx/JjD9DcGcbE4L3eNMKqocj/cdm4X1cY4T2D+RyZhF5atNw1zBOGLatVBDtVYMe
	bpP0UDr1N3AwJYR659zcuC9sCyza9qY7f267vrQ+YqsfAlQxHOlInNGuz4Vp81EqjqnQcoCHvGM1O
	KyCJj/ijb8UlYGh7gsFGvY297mZJg0V40il5BC+GuQLfE7RLA74gO5cMdf1SVYKQdjF/gnom3LxAj
	kt3qDc/3nO2gJXSjCblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxA-00000002Cr5-3TUm;
	Mon, 14 Sep 2026 03:01:56 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx1-00000002Cf2-1b38
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:49 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7f4e729368fso2938122a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354906; x=1789959706; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2vD4BC1COzN8qzLeVpRCLcx09AvVc6YiLKflTDkdf0=;
        b=QfrB2utxy1ToQ93qZCl0tzVlMIm7dKzwH1znvO+R/7MsIrbbs5Vw9+4Soo1qcW5zY7
         eki39hy1vX1PlsfKFfLVFKhZi4Jc9gfFja2y6eKBs5r2WfZhtIdXaayJ1tt8L3E2BCia
         FMhw2SrntSR+M0FQzpWxVXUPYClohGuT9+fHPtDXvXYiiWeXUIkwU86LXoEHEP819glz
         fjKPT4/ocLLZ2OrTwTQKEXCxhdpfJbPFrZSgkcyikkE/y1QMHEKaeAQ2yFRJdQ62DW6q
         ybykyqGjFQY0K5p0SWxpAdTaKeWIwZBQxZ6P+UCvko2oDqh+Tp68rZu6UL4f6daZZk24
         fPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354906; x=1789959706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2vD4BC1COzN8qzLeVpRCLcx09AvVc6YiLKflTDkdf0=;
        b=WrVl+hN63G4o9NZEhXRB4IqJV/HHVcYmByYnqKo5W4Lj2lYRH9Rub0ZXG4ZlwkNg6Q
         6XFIVd34S5kj97P6ayfO6aYAyqUMbxwgeusuGcdK551zl1cAFj62ExKjtu1p+f+cE0rn
         2NtcIgsLrm/4Ksqyqynpsa1BvYWHJSi4SWTgOUzS6sdU2q1iY8OKJD3pWhb2/kAVPM9f
         EcTR5lzSl7YAyOJmcs5u06TGpHlQjaJBH75zdcGENsoYIBkx+KazkyIL+Ih0h95PVnrM
         PyVCQuvVKGPIXZKMVB/yTa4w9UQRiB8HzeNalLg9e2OHPY7lGD5g0/2pLMyz9rsL7PSO
         06aQ==
X-Gm-Message-State: AFuF++lczV6cJsAcHzQ8ogzog6bu1u2eYY/flwJYvBGWL49hZ/9r+5Bs
	GNlPSNngxQVbh85jnEK2tKpEWDJawEv6fC2Sq5Q/Brv0eTQwYl8imKCN
X-Gm-Gg: AYBFou1ZBAnRme080srh/F1fsB5Tqsi+SmxEPZvPvcZh6gVk6f0ADYKtFc0odVLJj3Z
	2z5l2muqpQMqI/Pz4nl+4j59DxS+weQlz4F8HRFtmKXGBX9ciboEEdlZNW0xytOziD/VHXvmzfv
	pt3KTqcBoXHW80fBN4ZUSfLDa/O/psUlmMEYi8MBC7xBkRY0XcGgxPZA9x5ZL2sVXzgZDMf8aOX
	kkHmFIjHVrO+/1vlKH+q8Gu9MJG+6XwQ0nmtev0xP8Q+AW4voqNRbn6NrSqGsHe+9wX2aSmOewy
	BZiqvsFAu2APfKPW1X2rBbdMF3J383BJBq/qnmhGkglGX+YNtJddRh7SMEszFmQKA0+4n/SolCA
	TPqtAfZo6kpIKS9IgXwv9srbMTDv0CBn/oXWDqXBbMNg4tkQ6DEMYEfVr9yxXMo5wA1DO3r8lhQ
	xJSysCFmaw/bMOTbF77jaVnfxkJtv8LaCGAeGEwBbJt10gAG/hAJlTqLIzWZeB5tnwoYpE5cupo
	1nKQAkYFcwg5ltpHU7mU3x7Z3jBf15z67h9SlHU7ZqcQyb/NiQAdqnt+cRxw7ZhwdeCgdSMG+5h
	7sEiQkO+bk06fI2tGO2HJ+pgBhr2/eH13PRqDVmRjb5NqPj0aYApZHdnm+QgwI5Z7x+dY38jSh4
	3DM9Kw1jSWLH48qwVuucs3/eaHiZLkQ==
X-Received: by 2002:a05:6830:3886:b0:7fa:ac4f:790 with SMTP id 46e09a7af769-8089a150dcamr251581a34.28.1789354906207;
        Sun, 13 Sep 2026 20:01:46 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:12 -0600
Subject: [PATCH v5 06/18] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-6-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200147_494940_9D509BF2 
X-CRM114-Status: GOOD (  19.66  )
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

The PIO buffer helpers stop on a FIFO or completion timeout but return no
status. Their hardware-ECC callers also ignore column-change failures,
including the extra-OOB paths used after DMA. A read can therefore report
success with incomplete data, and a write can issue PAGEPROG after a
failed transfer.

Return transfer errors through the randomizer and OOB helpers to the
page callbacks. Always disable the randomizer after a buffer transfer,
and let the existing page error exits disable ECC and skip program-end.
Only advance the extra-OOB cursor after a successful transfer.

Keep the corrected-bit count separate from transport status so successful
OOB reads do not overwrite it. If any legacy DMA OOB read fails, discard
the ECC statistics from that attempt before the caller retries in PIO.
Leave the successful transfer sequence and OOB representation unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 220 ++++++++++++++++++++++++--------------
 1 file changed, 141 insertions(+), 79 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3f506d0666a1..72b79f893e29 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -644,7 +644,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -660,7 +660,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -672,17 +672,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
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
@@ -698,7 +700,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -712,10 +714,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
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
@@ -865,23 +869,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
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
@@ -1152,17 +1164,25 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	bool bbm = !step;
 	bool erased;
-	int ret;
+	int ret, bitflips;
 	/* From the controller point of view, we are at step 0 */
 	const int nfc_step = 0;
 
-	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+	if (*cur_off != data_off) {
+		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	ret = sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+	if (ret)
+		return ret;
 
-	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+	if (data_off + ecc->size != oob_off) {
+		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		if (ret)
+			return ret;
+	}
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -1184,13 +1204,13 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, user_data_sz, &erased);
+	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
+					    nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+					    pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
-	if (ret < 0) {
+	if (bitflips < 0) {
 		if (!(nand->options & NAND_NEED_SCRAMBLING))
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
 				      ecc->size);
@@ -1202,17 +1222,22 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
 		if (oob_required) {
-			nand_change_read_column_op(nand, oob_off, NULL, 0,
-						   false);
-			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + user_data_sz,
-						      true, page);
+			ret = nand_change_read_column_op(nand, oob_off, NULL, 0,
+							 false);
+			if (ret)
+				return ret;
+			ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+							    ecc->bytes + user_data_sz,
+							    true, page);
+			if (ret)
+				return ret;
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
 							    bbm, page, user_data_sz);
 		}
 	}
 
-	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, bitflips);
 
 	return 0;
 }
@@ -1245,31 +1270,39 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
 		sunxi_nfc_user_data_sz(sunxi_nand, step);
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
-		nand_change_read_column_op(nand, mtd->writesize + offset,
-					   NULL, 0, false);
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
+		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
+						 NULL, 0, false);
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
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
@@ -1340,21 +1373,24 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		u8 *data = buf + data_off;
 		u8 *oob = nand->oob_poi + oob_off;
 		bool erased;
+		int bitflips;
 
-		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
-					       oob_required ? oob : NULL,
-					       i, status, pattern_found,
-					       user_data_sz, &erased);
+		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
+						    oob_required ? oob : NULL,
+						    i, status, pattern_found,
+						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
-		if (ret < 0)
+		if (bitflips < 0)
 			continue;
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
+			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							 oob, ecc->bytes + user_data_sz,
+							 false);
+			if (ret)
+				goto err_stats;
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
 							    page, user_data_sz);
@@ -1363,7 +1399,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		if (erased)
 			raw_mode = 1;
 
-		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
+		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
@@ -1381,23 +1417,27 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 							  mtd->writesize + oob_off,
 							  user_data_sz,
 							  &max_bitflips);
-			if (ret < 0) {
-				/* The caller retries the whole read in PIO mode. */
-				mtd->ecc_stats.corrected = corrected;
-				mtd->ecc_stats.failed = failed;
-				return ret;
-			}
+			if (ret < 0)
+				goto err_stats;
 			if (ret)
 				raw_mode = 1;
 		}
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						NULL, !raw_mode,
-						page);
+	if (oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
+						      NULL, !raw_mode, page);
+		if (ret)
+			goto err_stats;
+	}
 
 	return max_bitflips;
+
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1415,13 +1455,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
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
@@ -1447,27 +1495,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
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
+	if (!cur_off || *cur_off != offset) {
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
 
 static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
@@ -1506,9 +1562,12 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 			raw_mode = true;
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						!raw_mode, page);
+	if (oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
+						      !raw_mode, page);
+		if (ret)
+			goto out;
+	}
 
 	ret = max_bitflips;
 out:
@@ -1635,8 +1694,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1759,10 +1818,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
