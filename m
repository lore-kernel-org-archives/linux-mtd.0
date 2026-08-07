Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660E2C5ACD1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wVQkUOo3lQT3fQCrHfEuKpd/AXOnVBT7k+HXhANLbE=; b=IbgeGg/rZFOsJS
	V3uRW+IMGSlPvPhsuTD+2qdNbGzuWepmX8jhb/gf6xqGminoZ1gklw1SCbcNP2uj0ToP23OglkIyM
	1iNw5OqIWJ4dA4tSSL3XTUVknvUhRNhJz/XCTswV9FPtGyOaXgDAZf6clnsHsl35VCZ8tqOpC7ygG
	7sSlpolNtSzxeRQfijc5PjnX8DEshrRSIqT9u7IXOl19w/untpr9jjpo2fnRhZjUzL/juNKxuQUHv
	X8WEwpshcJDmZXEsOzFF2Wf8sb9pC8vITuQZ00syVhI2tQu/oU6pW2CvkDaX6rTvDBStIoSEuhnRZ
	UyC3pmbFpJNH+jZEhmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfC-00000008M29-3DA5;
	Fri, 07 Aug 2026 15:39:14 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfA-00000008Lzo-0RVz
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:13 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-4569e871502so1051735fac.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117151; x=1786721951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=;
        b=koMLZmWk8W4+o9W29pnf5M+yDRfwN9WRFOgOIQRep1mPLX3Qv+j47q35zq2OKt2xFy
         FBPBVi1mK9CH7Eogoe9FpBjd4lKJq+ztLZkRsxuByiaXZ0VVkGyxCRz0nHOuZrquDdos
         DcfejYT0vjUG13P54TBYJ10trWqaUBY43zAq14jezp/IV1YxeQh4+G5d807ywM8RXEul
         rD4Z82YzEVxBiEqkueh5572gumJaSjHp2RezYugfFoYaLIEtgDhthwSvUaC4ZIcPND0I
         3zlcr+5p6EU5N6+XRMYmuQ0eKmfWyQMCZz5kQrnp6l+Q9S7Ow7k1a6lRk+z0bg3qn/GW
         WJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117151; x=1786721951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=;
        b=AP7WLv/tvgsYbRNvnnw+oOmmEkt0NaL4k1i9mSPCdB8pT7o6aD3GV6m+6jang51W8A
         MMj2ncCEZEpHh2CE/7u+Vp/fvKJ6ptvsVzmHhAAgltRaFEhHIeBDbt1Hpc7Bj4iy8qOZ
         5/dhzgCcMaHHcZUSNNGUGoj+jvuCnzCC2xN/+Dcuu6LOOGHtbWl0htTaa00/+29RdI1o
         Yv2mYQDA73AgfafyEVWycaSLnwhG2OZ4V/pDuSJw4djC40P9cavaKhysWgBnTXcH49bV
         47lShPrPZWnzI9/8qBX7VtIAQa+y4MB1bKoRC9u1/1l3o+/Ha49qyUiOYgkblNm28Clz
         eRbg==
X-Gm-Message-State: AOJu0YxlOG+DnkefgX34aV5OA1I3X+T0dbooAopMuC0J/XHKIhqNMt4G
	YFBFnEcXEU9aQEsFvQWftzh6StDKVHS+DisX/WvXPZuq7QGeJtzKBrv0aqEEPW4u
X-Gm-Gg: AR+sD12do02yF/hyQ4EHZTS/hnA1iiED6eMgmoAQBMldxeBZGHZJ6/7I+gb0nfNuNYK
	bjrBLUpfJNRjk7XEVdhjK8puX6ZeASIEQOPI3BEJb0dXf93pG0XfH//Wezcb+uJ6YPF9O6fZdRi
	NtAmnC7Css6grg/gxZsuNqhPMIx0EimiKzmB0PkitrGHspm6GPZIDInTuJVNxYJ0i2UlIYYvn5H
	32VseNbhPucq8m7eZQJJg4r9Vh58f11n6twPOzKZwwFEa8P7dnmr/u44jfJoqd6isvmPQKenFCG
	dar3G1bvn7FjTKD4TYBJR1Z7jFRNb8S79kQOBF427k0Lv6pDStHfTqXdF0fRxK1oYy5yuTObObO
	Io9nFzdgV6wzKsVWoy2mqUh+BEYOQ7kIBuAdjknW0+af4biAfSSSufRHYdkclCt04HrZbiqYUJV
	BDH6Y9nLWlZZ3eVD3nK2wnW44FwNDtcctFxQop7z4nr0J8OnS83cO1qRa2+0Hr1MtQPc1jVc9zx
	z7jm1AyAVSC766nGqF0f1MMQBOlSdry7Ded/jOd5d2W2ub0HA7tbOuq/GAwPJVcEL7g/DIfcMoR
	6SNQumv1O9gKdtOk/S7Vd6YZ+yKCOG6CZEQgog4zVZ9ly/8/jh6E5Mt3gRrGQH12vxjqmxK+54F
	t5nOZZVYWjYC7Qo9m
X-Received: by 2002:a05:6808:c1ba:b0:48a:ddd4:d36f with SMTP id 5614622812f47-4afadf16e3fmr12514228b6e.8.1786117150933;
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:39:00 -0600
Subject: [PATCH v3 2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
MIME-Version: 1.0
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-2-91287b543f41@gmail.com>
References: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
In-Reply-To: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083912_181762_0B57E5D0 
X-CRM114-Status: GOOD (  13.36  )
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

The tADL and tWHR timing fields use four encoded delays, but the driver
currently derives their values with a shift. This hides the actual
controller timing characteristics and lets the clock solver select a
32-cycle delay that the fields cannot encode.

Describe the legacy 7, 15, 23 and 31 cycle thresholds explicitly and use
the tables for both clock selection and field lookup. This prepares the
driver for controllers with different encodings.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9885248c9b85..df52501c1285 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -242,6 +242,8 @@ struct sunxi_nand_hw_ecc {
 /* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
 struct sunxi_nfc_timings {
 	s32 tWB[SUNXI_NFC_TIMING_STEPS];
+	s32 tADL[SUNXI_NFC_TIMING_STEPS];
+	s32 tWHR[SUNXI_NFC_TIMING_STEPS];
 	s32 tRHW[SUNXI_NFC_TIMING_STEPS];
 };
 
@@ -1679,6 +1681,8 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
 	.tWB = { 6, 12, 16, 20 },
+	.tADL = { 7, 15, 23, 31 },
+	.tWHR = { 7, 15, 23, 31 },
 	.tRHW = { 4, 8, 12, 20 },
 };
 
@@ -1781,11 +1785,15 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tWB_max,
 					      nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tADL_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
+	if (timings->tADL_min >
+	    (min_clk_period * nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tADL_min,
+					      nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+	if (timings->tWHR_min >
+	    (min_clk_period * nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min,
+					      nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	if (timings->tRHW_min >
 	    (min_clk_period * nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]))
@@ -1813,16 +1821,18 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return tWB;
 	}
 
-	tADL = DIV_ROUND_UP(timings->tADL_min, min_clk_period) >> 3;
-	if (tADL > 3) {
+	tADL = sunxi_nand_lookup_timing(nfc_timings->tADL,
+					timings->tADL_min, min_clk_period);
+	if (tADL < 0) {
 		dev_err(nfc->dev, "unsupported tADL\n");
-		return -EINVAL;
+		return tADL;
 	}
 
-	tWHR = DIV_ROUND_UP(timings->tWHR_min, min_clk_period) >> 3;
-	if (tWHR > 3) {
+	tWHR = sunxi_nand_lookup_timing(nfc_timings->tWHR,
+					timings->tWHR_min, min_clk_period);
+	if (tWHR < 0) {
 		dev_err(nfc->dev, "unsupported tWHR\n");
-		return -EINVAL;
+		return tWHR;
 	}
 
 	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
