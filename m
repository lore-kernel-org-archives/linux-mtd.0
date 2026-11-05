Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F8606A33C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FpNJopQM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZYKEiuQy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5RzRVtC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6FnMd49jh9sHrzpqhJ6QH+9vk7txbButcE5az+S3gRk=; b=FpNJopQMTXUYB/Kzr4wkRU1G1R
	9UehzztA2wl3wyo9ZRU3jCNhFAkmhIDUPUZHwydc+O9IoBjp89YQuvFlCWQDyer3F558lF4oLjODM
	dI08ODFSCz9umMypYiAFz9qUMYWfjlWfuAMcDXGsxrE/AQZLQZpTWFp0kITOztVg5v2nPEmHJYrIs
	vRYwNFYXdbqVejMBDpHdM9IXNfa+IaYIbU4JSJ9apLCmFKiPkDuBmz3N462TZJC00/PO/xWSIbISH
	vaB1ZAHvqz/9CMl8KK1T/0vmi6bIYD13FA0FyVUmf1cIsfxy84Lw4lx1Sw5JOP5HEsRWL05QOW7uA
	TXW+V2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2fv-0000000AFJr-14LO;
	Thu, 05 Nov 2026 18:59:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d0-0000000ADTU-1EpF
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=; b=ZYKEiuQymC3KgdGa4PYYrugFQl
	vzv9FXJcSDvwC+EZR5INkI0EsfOY/j8dlN4YuGO3AIZ3oyCxkG3qmo9aeggRjy0Dy66LDXaPSkzbp
	EjfRPIKKEsGzVP/SDmNrBY0iqKxrSxZr2+wFvJx6JvbmujrabNbd5w5DgKpbvfEpvrXGUZzCkQ29r
	4NosYobvqNp6b2nJ+iyEIjazyKj2eHoH7MTmcHR/EkbYTgX7speCmx/eIFn+Wtqp5bGvbm7OVDl5r
	yy45gnd6QpnTTmrYIrvTr3HKIhDM1s68aWUqGOOewePPq6v2kYgnnO/dmAkbGCTgscsUd2hempr5H
	b7Ug6lrA==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cx-00000003R1r-2Iyc
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:01 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso921276eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904957; x=1794509757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=b5RzRVtCKIa4GtS5ctEQq6YwjBh9i45uRFzCimu/K0ZXHQAl1J2f3FIqhAyRPoDNZ8
         iHynhgNNR+QIO1NDvwCFBdn1moWJqL5L9n5LX5Hc52Y3PEu8UxvxqDNmnL+KP2DdKjGk
         up/Pnvf/7cq9kYipdnWL5mnR+AttjnV3WRmx16+W7rXDfketkYIXgEuFO8o7SY+gLPgo
         8Zu7dXtW5ipTzQ5UkeRWQV/w/bqkpsbYCV+Y5x6TkgAvLEMFAF7jaP+tjzEzoaQs/t4H
         RAD3kF4L9WS52UkolELIIOj9Q1mVjC8fJmE7I1tkEP1p7o5XLq0++nYGut7MTmcUobWc
         Qcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904957; x=1794509757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=kJrIOXdFiVBRcoeOKMMa17m2kPN+WJpGXOjagj+adQzIyLc2/elWgwiHCafRRWJ1rU
         Bhmjp1ILpMOLsJBB/8RYq7W932ukNQ+u9XwM0nIkQ9RPXwoV9uSoRtEC3YOharPQ/buO
         uAreZgmQKu9sBoYnxBwTGTi+JFrfuB0X8kEgVvxUc4NGMPgYjWUJmKDSSvSztWydAaRZ
         APMlLnSmT63UyUkhOb9uLrONOZsKFphwHtoJyTRwkrrIAdy9HjEwSAfrMDZ2Rm7AYYhF
         Nw6rDSahQQ42pqwpij0s/fIX0qVo/iEIl+vFjhq+GnPbHvZnP9ICmW279MoPqRNB4aeq
         E3xQ==
X-Forwarded-Encrypted: i=1; AKwUvBw11Zz3sXfW4vHUf+Q/gBTTckuAde9IN87Fr60TYGjHX+/OcSp2sCjQ1uek9UaoBLoGKongOXxDrIQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8t7yi6fSG94vfaKyWr27xSV9y8cNSE0DzzrBwAyBx/uv7YNvL3
	aazYgTwJuDwBQsxtqBP7EOeExlqqZ9oA904ip37S4BFCd4kDE/euXJPj
X-Gm-Gg: AYBFou3CDMTyShWeg2Bm47xkLcisEDXOr7fc3vLMpRn52NVC77Mga9J186bB4GtgBUB
	5lWvltCtERERbCOYNCpfN+ZdwGKZ+w7yD0svpRiewziFy3rFv/5Kf3cyvDEzbBMGp/Ga270otb6
	6nvWbZ0ek9SFcrUvcUjEXTyxqMwB/L01We+k01VXaKYxrV1ZzwSRhJ5we1PpnheCui1uchVfEl5
	saq11LOrBbW9iRk2n4QoX6PKlR0qpbysgyigvJLy7u8XKoWbh2AtK/0USUi9w69ZvuBF2gurqhP
	5bFIMJz8rMgkSAobKbCqxoYQ4wlALj9J3mWZ+Fxu9hxQ0xRAHvAJZuA2hqIVbw60gQILxH4BQv1
	ZC9/1NhKHgWdxTJKqWzaLLjZedsti6pSb0JBX4im0ObVasCBxIjsdBbV/W2QcYeX8bd9meyHUGb
	EdM+YpSpSnufu8DR6eBsRPAzdn05iArtOBRQsgw4PngVx4dJJgH+hoGXYVv7vs/ff5ECICjOlo2
	T1Ymvz9SWvdWzhofW4IIjSagamdr/MRE35d+h/1oVNpGzov4aHqDGdPWpvCCl3WFI8KqKvv6H+w
	Zc2p1dzynvpWL+cNoyYwM/2fMsEwD1RiTjQdYuN5j+mXeUMolY0arZceOx2wNhszVdtKqkDD0TP
	VqKwTBE9xhEXvweNWBnjLvH/0nf/sqbomfjAryrsLrjbNA2ge1To1XbOBnFXECDxnBIsTzvdpKR
	H5dlhoMzA6dQNGWQF8aaw2AYgqAx9zAcNwvHiRnSFP8lLtVnWVZsVN
X-Received: by 2002:a05:6820:a513:20b0:6fc:4051:d2d7 with SMTP id 006d021491bc7-716e78ed246mr305545eaf.38.1793904957427;
        Thu, 05 Nov 2026 10:55:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:32 -0700
Subject: [PATCH v10 16/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-16-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_185559_524470_F32CF105 
X-CRM114-Status: GOOD (  17.49  )
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

Chip selection ignores clk_set_rate() failures and caches the requested
rate anyway. It then installs timing registers calculated for that rate
and proceeds with the NAND operation. Subsequent selections do not retry
the rate change because the cache already matches the requested rate.

Return the clock error before changing the controller configuration and
update the cached rate only after a successful clock change. Propagate
the error through exec_op() and the DMA page-write path so neither issues
a command with timings for a clock rate that was not installed.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b92bbe19c0a..7c80f52c517d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -651,16 +651,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -672,14 +681,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1824,7 +1830,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2627,9 +2635,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
