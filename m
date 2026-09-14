Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24AFC88E73
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDInDxVVgleKiHwZQEvm37odONswQ9pao5pExl1IxDA=; b=MLYFo5nc2Kxy8C
	j4UQZWqE+Omy3f/Dhg335verBX4UykdT1fHI4mNoNfmDOug/CVRaYZhtu+Gd3tZOX1q7N7cRAQZu/
	AodG+E596h7OB0h1tdv8sN/B6ibjGmnBec4B8o+d9nHS/7NswJX0j/Ag2S4Dq6eVCc0X9W1+G0ZDd
	odEdFZe56GljBcA8uzyhz7o2cXD1WbK6ED+oIj2WRg69AynZLL/E8ICFfRIbt+YBFG4SRrkos8dNS
	F7+i21UAp4fR+4ovIT8MjfE3e9sNRtcAgUdkEWEISCHV20XcYj45v5tqKWOHBiJ9KvDoPgEexuwYN
	5pOezKEgM3dCvpRuCWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwZ-00000004fuW-1rUc;
	Mon, 14 Sep 2026 21:10:27 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwC-00000004fSX-1d7U
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:06 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6f1637so626706eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420203; x=1790025003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2vD4BC1COzN8qzLeVpRCLcx09AvVc6YiLKflTDkdf0=;
        b=P1MJkpB4Bz2Puk4yFUL2RrASyvEcY6ipox4VmcyZBbVhMg0giKnDh52xjtv29ecIp6
         zIhNp1VS8qqmygf9ufQEjoyJYZ/nI/8VoVcipynnfS+FhmCRsjscIp6Yl7VA18kGCgpI
         QwP0ZjyQ2rUFNHpspBZZJDGqrCMD3z3rnN6KN/DQN61e0u3tNg+KO543FrG0KVdtqtSH
         l8ZhETyZ3SnNaCK1aZlAobeb8cPz8IU4Gpgcd9aWtHruv6oi0pP9+RDGLdeCWdAKmYR+
         2Yx+i2kCqgNNzUIr9g6x07b+Z1WOZQQfUBjjUHNB1djZWqbhFQiUQumepk2yLY/rI4bk
         dr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420203; x=1790025003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2vD4BC1COzN8qzLeVpRCLcx09AvVc6YiLKflTDkdf0=;
        b=0S/4iW8DHOtBaCVv3XklIwmXEaI2whquQ1maSos2sGKjjZOyhRozjP13gqmzRL0Y/h
         7RGNoY25lVexWceGdRS+OVHCVOAvyUHIZmO3n4FH56XXRFBYn/ypT0dP2TpUitCzs/8T
         ZEUqvKR8lE4UFaTBJuISR6P3aR2Y0c4MEIQEnP2R64zqKRjn9Qy0As/6ME5olRDvPTlz
         NUxukYipq6wYMR1zjrh03+L3sPwau05mBzMnMYFy+ZHG9f0HIWn9P8BcLXjGoTyG0rs0
         SWtqcP7IhKVHzmsrM+7epyKy21m+Hnyam3AoXufEey/2Qlgal1vBbHMXom4s5lpeazwQ
         MQiw==
X-Gm-Message-State: AFuF++mtJnKimio2MLwHxceshs/88CVsCn0vDBHvQW7MV/p86z+gTePB
	f1UmqKWlzcrskcctk7KrWCEToygG7yXKauOOKISONHq3fFwKJ/X8IKH/
X-Gm-Gg: AYBFou057vzf+qNrip+QF23MH/cFDSSOiNy+2fRaebL7n+/R6nUMSaDSsf+ca/J55of
	0o8KlkG5HKN2E6pKpkd3NLZhEF6mqiEE4fiLA1srL5KN16Y75JoGd+cjUMOnMpdxGrQQMP97g8M
	3w/HqL9xyB7aRGthxGisaAx1p+PaEcb/vZ+BW7TbMEvPNXsMz62Gg+aTn1cvJvB77LEZ8pOaCtg
	bUSB18Fi3Cdlr8mvwvWts8mQmiewg1xkcUXz5/LI/1VuxLOxHDiSCfaU8whbYrzCgUSwCtmXZVk
	uYJMYdeKaVH5bUUwrzjS5YLNVXH02ON6eqU5N3IJzLTHKPbNU9dqs8Dxzwck7Blh1szVj7XqbZl
	k8e2CU4X7U8JxjCXEg5CjFI1twdJMsf+TveygoVAlgGCdtZYujp8elqwsjiC8c+oM6fsq6fQnN6
	7I/L5ETZxev2tw3os3fDGr+IyYOUWJ/PfoJ8ctxPY0IjRN5WZn+0KNSe6IrRtcTJs11aMyq97tB
	hhm5hXC9ULic1eh74I+GgOvQ6RCH85vM2Zyc8l0gFNlprLvdBwgKINLaBUwErgUkc8y3RG2F9Dh
	XYv3tSgpQfYJjTQBWaBz+IR2Krif0KHt/jbiF4qZstE78HBqvPOwGHRbWIQruxZVOlTdt5flYoP
	YKoyinoZ+8PpQDEbslPX8w/h9V91D
X-Received: by 2002:a05:6820:4cc1:b0:6bd:cb3f:5896 with SMTP id 006d021491bc7-6c53f558284mr2536286eaf.30.1789420203605;
        Mon, 14 Sep 2026 14:10:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:52 -0600
Subject: [PATCH v6 06/18] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-6-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141004_846692_DEB44D54 
X-CRM114-Status: GOOD (  19.92  )
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
