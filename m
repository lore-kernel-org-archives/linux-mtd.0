Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9537ACCA46D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNQVnTJmwSKgso5VpczbrZX5QqpPSNInxUt252auYxA=; b=YWNxrsOgn7Bv4k
	s/k+Yct6ee74s+xNA1UOXW2p+B1TtAlXrho2uGBeprnpIQPjlgE1rzam5qrXdn0Uv5jI+4sxJlzYf
	wxRo9oQUBs/7c9bk73eFMjN5vm1lvJBoPIkp136S3JNuN7Axlyri9Sfzbh9JL9dtn/iys9YqxZEcQ
	ITGNX8vAkApyhQxaQZFY8oMMzxWx/sDjWGwUEWTnimNXKs1hjEYGInscDVbQlSe7oFoWzvFC0yPnw
	z3Nu7z1f6tObKz19PELq7Mv/KLZpbseGiqQmNNtVuWrvVFqgaL33+3Mzo5YGWJeZyILP6vnV1qH7Q
	tMC+CqaVgZGjGSivQ7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtK-00000001sn3-1Hi9;
	Fri, 16 Oct 2026 03:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt9-00000001sUG-1TfR
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jq/NuCCaL8gKhO+mvfil1XtSoT7M57C6sxsBn3oDvGc=; b=iULH4jqxnsK9e0oZRPuvpFFLHd
	eZWcI1rsfHfrWKSNAonvGPbVwpSQ+saqqwaRZTWZQseEYpp4VQKN1d4LtuloD4JOxJlLgJxbydrdE
	CToxVC4LYQHZXz7MTY7Ed/bxu6gLg+TdayscrEEnRZZT7UudE5JR3IU2Jka4REVPbLU8bO5EYpJYe
	gxblWo4NH3NFOcqQBlsiZPMHCM7B6BHx/6dh0RO69W1SyyOVCAPha0yn4UfuX6iyMl+y0eMUUsPOf
	ALY6jTUbjwYzF9iNDIpxAByF395Dg/UTRB5+xZOyhBuVPfs3Q7wOGvr4u6YKrQbijbX2D40F11fMt
	pnlVdINQ==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYt4-0000000144B-341L
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:45 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-823e4047037so4571214a34.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122341; x=1792727141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq/NuCCaL8gKhO+mvfil1XtSoT7M57C6sxsBn3oDvGc=;
        b=TGp4pX80e35jZFjvxw+tM48DvEmY6iBMHL1YYPvwLERS2/BYFlJK3gri+8D0rDtWIX
         q9LuTagXh1fmIy6Fqv+EGEmpi3KmplcmgBX7KcbHFEpbOLFXzHUjGgGuXdiRtLP+gLu4
         QSGkBzATdpl94U+MJPcjoKI1JQH5nvB8pl6w+MWcS6/IPquUjUvkSYIzI5t/uqu3Ahpc
         fC5hmBb450+pxOoTb5kt1xQfrIYAWPzMy1LKYUHwsbFAjaks6XS1gAEdo+S/dOZAFF1f
         Urzgf0/hHw73gL0Q1aXlMvSOAfR/8bjsO+3cLLxyrXIq2COnS8dDIzyU3kav1ettU0Zd
         t7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122341; x=1792727141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq/NuCCaL8gKhO+mvfil1XtSoT7M57C6sxsBn3oDvGc=;
        b=ZcqsJ3NkE906oCld8EvD1ElNWbUOmUm6BuQR0HzFYoakdbFmS48etr6F++xMdKfftn
         tuacui4KjOjRt1anbDYYnCsCKYUZETvbZDskFqJQHWgdzy9gvstYXW6Zl0NW2Bq9qC9a
         vaI9l6sOCqVSm5aIBOVih8PTpC0drhzF5y4PRp1cfG+J65PsoarWlIpXCrF5nF3msRW6
         qMfLJRvU3JCV7rYPEq5k7FvoxCMOOOnZHi9+k7f4uBSCERoKcfpkYC6gKhyqh/UDqGun
         s1rbeA6llz6UWiFmiM+83lg5HH0PuAx6MvTdFPe3pWz/9fVNJzK1wbhHJ9QH7uW4akpY
         kokw==
X-Forwarded-Encrypted: i=1; AKwUvBxDKpXFoNGYP2fEd770+S0EgZSPigvEzR7tIPNiDgCgGeZeEgq4QRQpAfEp8mZ4tcx+nqUWxf/NtvI=@lists.infradead.org
X-Gm-Message-State: AFq9FYJdQq06PENppGTgmfeUretpA7CQv7zraqi6w3Sf5pQ28JFms53k
	dsWBY/tOTTahilGw0iJdLjU86Pn/TWNVHSWb18lGNPyl9PrIdmHwOU7/
X-Gm-Gg: AYBFou2vg1Rh9F2DRykRN3sEOCMv2fhVpjETrx+Tf5j14hAVTGSLcB0RI41TjO7IeKw
	dWNTpghVUZi11u6FuRth6qpzWqsM7ymeUHc/zf/l3SKYKthr3XDyrAdBn+YmxwiN2bPS/OBrXZW
	i25HqJJCZb5i6RCaHwZoUGZxNWqKE76CbT3iR4K2T7QbeI9kVZdtxVkIm5qORjiz23UlCLtwNN+
	QHPHmCqGbrlh0w53iF2fWMTANw9+EeOHj0AQm/SZByiZ8rD8KT9XxoZO+a7ZOP1lyoRRiIj17WW
	ylXq4D1quUZ6+2v2vmS5C0zjL5Z24ZN/a12pCbOvR/49L1ym7+p/syBGtE3MKmjwnrezCX+S7hP
	dPDKHta78vcmCqeYh1U/cl8u4BlnB88+vCqTpz9lE9w9y+qK/f7m0+mZjxHqz57AgJhw+PZzPAt
	z1GYlDiA3YMrGFJ3PvD4ggDPZp23gAYN5NZ+m4BV+z93Lev5YVSY04dPbto2o6F04OoX7g5v/uP
	sy7T0WoA7SM9BYE+YeyWtw9FC4cBRZYV5WYl9yQU0toOPZYEwz+YNJObdtvlwnYhQ+xDOKxBf/2
	1O1Upb4nJv4nwT+ekVNOuDWGZAe7QiQNSZI+isODfO/DUKWNOHb3W06WwlkjZiC7VYyWxIM+/f4
	MiR0ARZeUugnjAaF0RfFU9Q==
X-Received: by 2002:a05:6830:2b23:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-83090e20c67mr20939261a34.1.1792122340590;
        Thu, 15 Oct 2026 20:45:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:23 -0600
Subject: [PATCH v8 08/17] mtd: rawnand: sunxi: propagate buffer and column
 transfer errors
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-8-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261016_044543_543244_784F11BF 
X-CRM114-Status: GOOD (  19.45  )
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

sunxi_nfc_read_buf() and sunxi_nfc_write_buf() move data through
controller SRAM, waiting for FIFO space and transfer completion. On
timeout they stop their loop but return void, so their callers cannot
distinguish a complete transfer from a partial one. The hardware-ECC
paths also ignore some NAND column-change errors, including extra-OOB
transfers performed after DMA. Reads can thus succeed with incomplete
data or bytes from the wrong column; writes can issue PAGEPROG after
failing to transfer all the intended bytes.

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
Leave successful command sequences and the returned OOB representation
unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 170 +++++++++++++++++++++++++-------------
 1 file changed, 113 insertions(+), 57 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a244d2158d76..fcb017f048db 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -670,7 +670,7 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
-static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
+static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
@@ -686,7 +686,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		tmp = NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
@@ -698,17 +698,19 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 
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
@@ -724,7 +726,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
-			break;
+			return ret;
 
 		writel(cnt, nfc->regs + NFC_REG_CNT);
 		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
@@ -738,10 +740,12 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 
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
@@ -891,23 +895,31 @@ static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
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
@@ -1157,31 +1169,39 @@ static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
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
 
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
@@ -1230,15 +1250,19 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
-			nand_change_read_column_op(nand, mtd->writesize + oob_off,
-						   read->dma ? oob : NULL,
-						   read->dma ? ecc->bytes + user_data_sz : 0,
-						   false);
+			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							 read->dma ? oob : NULL,
+							 read->dma ? ecc->bytes + user_data_sz : 0,
+							 false);
+			if (ret)
+				return ret;
 
 			if (!read->dma) {
-				sunxi_nfc_randomizer_read_buf(nand, oob,
-							      ecc->bytes + user_data_sz,
-							      true, read->page);
+				ret = sunxi_nfc_randomizer_read_buf(nand, oob,
+								    ecc->bytes + user_data_sz,
+								    true, read->page);
+				if (ret)
+					return ret;
 			}
 
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !step,
@@ -1278,9 +1302,14 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
@@ -1299,13 +1328,21 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	int ret;
 
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
@@ -1428,13 +1465,21 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
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
@@ -1460,27 +1505,35 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
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
@@ -1628,8 +1681,8 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
-						 &cur_off, page);
+		ret = sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
+						       &cur_off, page);
 
 out:
 	sunxi_nfc_hw_ecc_disable(nand);
@@ -1754,10 +1807,13 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
