Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A54CC4451C
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2KhdxgUR+D1n59/PLPMIUZMs+uv9OImJensadgCuz0=; b=rbq4VeQJYjnj8u
	Y1Rm2zFExa1Rtc4XDB9ynAnlVnxI5EdT1NxN3710/bLt8oLm0A43VJSmhRVmAlM66z53kDtZagH4A
	UyOzrXaeZTRHiwVBi7HyOGsjuh7Hk+kTvQ9bN81gI1B0KXuk9eLo8kZfG75UEJGeIj8TiNorC8pvX
	UwyFIeR+USmrEqA/U3SAI47+HlHimUyGu3MDVYQDb2ySXOQvYeAcnsjcRWIbr171e1XqFqsHRunD5
	uNBbZmowlvHJ6AvhcKLJk5dstHCtDD2cS2auo8nZrjzdQ9TWTdTrBYEo170v9bi+MCJUBejUpd6lj
	vcwQOM+YvPFVnkEPqNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSJ-00000002tkP-3SRp;
	Fri, 17 Jul 2026 17:34:35 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSG-00000002tgF-1mQN
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 17:34:34 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7eb61bbeb25so2791933a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309671; x=1784914471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBTwbiP2C8OFdHLB83ZBc1RdHRd7b7uHmQhCjRYWMAk=;
        b=K6t8CjEjimW/0154Saa0kltLr5eZdgsKpjdZ4R3AkdxXV00DCaR/YMD70ZEdGxpmrq
         GzRiA+PtHF4uvEuSB2b85HsaNoyY7yC32vdCANdKUFSFhX8ZjhOAzMy5J6GC5eGGUNJo
         CmKv50ZyqQIjvgzkuZMyU/YDNeCPZQytX3yHYUq39SD0DKq+hxFk6UCNzur8hEMEG2SX
         F/kgKBIVcA5ZjevJbUClUGwlie6ROhc9TOBDobV0WbvOohBKpYPU32BT/W0nLxuMMv/B
         9Hx2oao/xZDu8EltuXIssXO8H5sPyqlVUfxEWvIMP16xQSism5xjnbs16w8d+HKZq9Em
         8B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309671; x=1784914471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBTwbiP2C8OFdHLB83ZBc1RdHRd7b7uHmQhCjRYWMAk=;
        b=s7G8DkAico7JIUnXQpFzc8Qv7rPpAo4pEu28FVJq/Xsy/V8IbjbzHp2OuIIRlpXMNm
         E9VOqa77GtUvJp8JOJ0mRL/JG0W7N+KqnCalI2JuQ9VLNjtH3ec+UGWPya68vmBTA19p
         XbBWhBM+nF21JjtFfOn6HOwrBTEKbhBFjPFzJpfewp2f2ph0FPaDwInXNxbhhUNRgmVI
         8E0w3+vPuLMjJkKoOHZP/OZ+qhZRh06xRajuaI1yc1MdBPOgRjYhyHA0HP5t6ZdK4EA6
         kGWc1s/dOCOYJCSlbhtxnyiLo0Z3imesBkntryVVAURCz5KMCjtVc70lVIxBpIsPqprT
         pgWw==
X-Gm-Message-State: AOJu0YwzA+G8Irf+OMo3kAnRfv4Fl41dTIkE1UVIFVLj5wfbNyxZxQHy
	IaCQw8SIRT0TYSoZ1qI+E8e/NQ8EtQ12wTJJW7JBx8DPf3LH05IXBL/5
X-Gm-Gg: AfdE7cnSoBXIMF2YWYckQ7C2JqJ/6kVrH/LClfm+SoGqpV1SgFb2Hww8b+zuSl44omX
	rumwoZpmQRVnmV1SPVd0G6SmK10ODD8s7pllMJoKgTFmIvpNuP2pHLZfzezD+t6gZC9qZdGil4F
	+OzazinZ9BXTJSeyQJ4UcEHQ8ipq79RNP/nR+/Zy5v1pj40dJk3ZWnUD1WaLRZJMBK1yGZM8LqF
	f9qxeCcrlUtinNutkmj1/cgORI3NWyiXBTHiOvFZcw82MwQA3KhafBWQOQaNP/UYTgF7byIxTXn
	fqkTHWc/cG6bHYBqP08hJgawCqatIddLJHEiWEXDmKeS/XMr44k43kVw9rFRozulIVg9iaeloiZ
	E6wCQz+XSuCOuJwUEQCrusobUFO9WOUV8kbtQyFv3C4/HBFmyF6PyhJcAM6ve2jG1O8UL66Ac8h
	qQDkvIlmSA1cW5Z+k3rmBsb4qDX+8fxNZYqlw2D7bfvQxVLpTVmIxgQJi3HBamI8UVIzmS6o8zb
	rTNigKiEf7WUVPUA1zhSPWeSYZOaG1PZ86vlIbs+Ul8EWTjZ4vuZA==
X-Received: by 2002:a05:6830:2a0e:b0:7e7:571:114e with SMTP id 46e09a7af769-7eda08eb88cmr1835909a34.20.1784309671288;
        Fri, 17 Jul 2026 10:34:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:59 -0600
Subject: [PATCH v2 3/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
MIME-Version: 1.0
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-3-225515107640@gmail.com>
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
In-Reply-To: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
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
X-CRM114-CacheID: sfid-20260717_103432_468687_D8EB2E40 
X-CRM114-Status: GOOD (  14.22  )
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

The NAND timing calculation assumes that command and address setup and
hold intervals T1-T4, T7 and T11 each take one controller clock. It also
uses the original A10 delay encodings for tWB, tADL, tWHR and tRHW.

The H6/H616 NDFC defines the setup and hold intervals as two internal
clock cycles and uses different delay encodings. Add the H616 timing
characteristics and select them through the controller capability data so
the clock solver and timing fields match the hardware.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 791f495f6e82..3d91533a9f13 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -241,6 +241,8 @@ struct sunxi_nand_hw_ecc {
 
 /* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
 struct sunxi_nfc_timings {
+	/* Internal clock cycles used by T1-T4, T7 and T11. */
+	u8 setup_cycles;
 	s32 tWB[SUNXI_NFC_TIMING_STEPS];
 	s32 tADL[SUNXI_NFC_TIMING_STEPS];
 	s32 tWHR[SUNXI_NFC_TIMING_STEPS];
@@ -1680,12 +1682,21 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.setup_cycles = 1,
 	.tWB = { 6, 12, 16, 20 },
 	.tADL = { 7, 15, 23, 31 },
 	.tWHR = { 7, 15, 23, 31 },
 	.tRHW = { 4, 8, 12, 20 },
 };
 
+static const struct sunxi_nfc_timings sun50i_h616_nfc_timings = {
+	.setup_cycles = 2,
+	.tWB = { 28, 44, 60, 76 },
+	.tADL = { 0, 12, 28, 44 },
+	.tWHR = { 0, 12, 28, 44 },
+	.tRHW = { 8, 24, 40, 56 },
+};
+
 static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 		u32 clk_period)
 {
@@ -1720,20 +1731,28 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -ENOTSUPP;
 
 	/* T1 <=> tCLS */
-	if (timings->tCLS_min > min_clk_period)
-		min_clk_period = timings->tCLS_min;
+	if (timings->tCLS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLS_min,
+					nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	if (timings->tCLH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLH_min,
+					nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	if (timings->tCS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCS_min,
+					nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	if (timings->tCH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCH_min,
+					nfc_timings->setup_cycles);
 
 	/* T5 <=> tWP */
 	if (timings->tWP_min > min_clk_period)
@@ -1744,8 +1763,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = timings->tWH_min;
 
 	/* T7 <=> tALS */
-	if (timings->tALS_min > min_clk_period)
-		min_clk_period = timings->tALS_min;
+	if (timings->tALS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tALS_min,
+					nfc_timings->setup_cycles);
 
 	/* T8 <=> tDS */
 	if (timings->tDS_min > min_clk_period)
@@ -1760,8 +1781,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tRR_min, 3);
 
 	/* T11 <=> tALH */
-	if (timings->tALH_min > min_clk_period)
-		min_clk_period = timings->tALH_min;
+	if (timings->tALH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tALH_min,
+					nfc_timings->setup_cycles);
 
 	/* T12 <=> tRP */
 	if (timings->tRP_min > min_clk_period)
@@ -2670,7 +2693,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
-	.timings = &sun4i_a10_nfc_timings,
+	.timings = &sun50i_h616_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
