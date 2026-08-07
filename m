Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E30C5AC82
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElXO0rY4CDzWeuqWsBbWR9JhbQ06LrsnaGo6LMkpm2M=; b=aRCSZduSUmIUjO
	VIQLm4rGNLXlsAiIgn5cztmoNp88U/Daw8NBH26doffPCkyRb9l7HcZNxvZ2f6ty596sKXLsWc/q5
	WBQkR6qLwQJGzZM6GREWiyVaEBNz7lwUkeea3/zS29KuZnaxzYdcNXK6QB85xOnFVDaSK9xq2KmvC
	SBNQzdTfe9dujxcFxYEBy55pMwumlR47yVHbJxv5obGvrxK4syMsbyimkg0n3WV93GY1TrkF5jMIg
	FN+qP0k0GtYTr+W/1XVcAiqddUYOAyBg4YvN2buBGw7VKXL49OI3BQ3E5hmJSgwEsmcHClzosgm+r
	cZekQiAEN5JCQK4jJsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfC-00000008M1l-2SZa;
	Fri, 07 Aug 2026 15:39:14 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMf8-00000008Lyu-3qAR
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:12 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4ab47c40e7eso1472002b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117150; x=1786721950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BH5d83nxZVwUU/yrlx0wCDcJDqfJzuP8B2aoypwvUDg=;
        b=pgiKQ6nDwPrKPsTuYYPmzAPSmsIG7DjMbUD7vzCdqjp/ZdnCCLf+qQ7bZm9yuaSC1X
         q11T6H3cUW8bPH+iRclPU/Inzw+np4/6hipD4K7emNAko6PoCfW66ZqyXLGYLU5xVTr9
         q0+yhUXLzD7QUlEzd5QUq/YHD3cAbWracZDKgi8W7MVK/SO2sWBpq2YsBWu+6trRBfIf
         dXPH0n8CuErtgyjWysLqSgs9BKeuE3uNhQgfxhngShjlhSFQsRq3+UqBuVoQNGcTIaBB
         JEbbo2TCO6wxJWuvNrm+88jnjdoxeQbfumllLL1cTDFxZajakTgp70co3KLDRu9Pzffe
         ifQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117150; x=1786721950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BH5d83nxZVwUU/yrlx0wCDcJDqfJzuP8B2aoypwvUDg=;
        b=tQcbFNjTf1lTBfU9j0KYbbUSq4T+qU1ln6JrPk18oJ4SctTgMp7Q/FBBdsbfi910hp
         GwSN2m5ExociCENafuWjBj21J9UODj4okrPUCdVdX10holhbkidm0Gj/U6JrZ9fSHlOu
         pgapZdCa/MuvCK1aTdWLIhp3V5kXLmyC4idh9aQs4DLF2akhLHstWDZ4FG+qsbnZUbxr
         CETe3Eh5pKgkXxng/nLW+NOip2QN8TLe4zgREYpwhmUkiBXY1HJTbi6G50BmjKkTPtu6
         MH8LeY+HaMG2kMaLDR58DkRExwcwn8386lPyYZvcgkAMqzRpRTvTGX7zbJ8ySJGO4ple
         H74Q==
X-Gm-Message-State: AOJu0YzydYarjS1gRpd0pa8Kn89GZLznzvje2nu5eBcWEAT1JBH4VDt6
	YiWnOKDvkyQoeKIQUGJ4549vHnBlYP89ZvcCEcvN7DI9aV42ce5DCiYz
X-Gm-Gg: AR+sD12EwyxB7AThqEPYm0o3x5xMKt8mQfbSkTFXv0aIyBLukp+5qR8ERVor4Gpfy9y
	07sGnvKr3xgA2BnVMvS2+EUK/zDryPX7tPr+S2BAv/BGept8rbb+K43ZbyK7ZR7m65nrt/fD5aI
	PeJxOxv4GO41ZGM4BnHh4CjBHBXkuvI+KbM4ygjV0knhnSKUhEPeoiAYLXVB+NJc1WA30jEEdJA
	K7YqBPskVmmggd67tuLGkPMhahP67Jl6jc/WgbYXsYA+1fsxIUPtWJBW6Z+Nt5aBfWb9iPrcuov
	vhItNbF2XDid+icDT4dNReEqw6J6W96f8OSepQ2/LyxBkSR9nYof//TfJ4j42WuOXtJCXK0nCC2
	sO+d1DpNAoAPcQ21idOD1ERqxAj03HmmmTP+3X5j4uT+8sjDQYDQWVEiYyl6P8odrMw9vtXwg34
	7odjBvpeTOs1fX4cOuseu1s1M4Y635NxfQDD7EfZWgB/kw4CnGLYglGk4HGw8z9KHS38PYwWS9h
	J3u6BIkMeXD6bHwbsbjDLzZcDGWn1jHuSTpSePc9Dgee85/fdDdfge2n7fT64ZHmV/d4DctJwFF
	8asL3lsrT/FqZlQIjejBNmKFAAXhIeRd5Ndwvq8i3j/GvDBcAfV6LxG5S3qsI7WMPAQ43Y7H1iw
	cGEiXSK9BDNcXv/DM
X-Received: by 2002:a05:6808:ec3:b0:4a4:a693:9d87 with SMTP id 5614622812f47-4afadf0e523mr11310972b6e.5.1786117150060;
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:38:59 -0600
Subject: [PATCH v3 1/3] mtd: rawnand: sunxi: group controller delay tables
MIME-Version: 1.0
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-1-91287b543f41@gmail.com>
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
X-CRM114-CacheID: sfid-20260807_083910_985567_18C0384E 
X-CRM114-Status: GOOD (  15.63  )
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

The tWB and tRHW timing field encodings are controller properties, but
they currently live in standalone lookup tables.

Group them in a timing descriptor selected through the controller
capability data. Point every existing controller at the legacy values so
this is a pure preparation change.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..9885248c9b85 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -237,6 +237,14 @@ struct sunxi_nand_hw_ecc {
 	u32 ecc_ctl;
 };
 
+#define SUNXI_NFC_TIMING_STEPS	4
+
+/* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
+struct sunxi_nfc_timings {
+	s32 tWB[SUNXI_NFC_TIMING_STEPS];
+	s32 tRHW[SUNXI_NFC_TIMING_STEPS];
+};
+
 /**
  * struct sunxi_nand_chip - stores NAND chip device related information
  *
@@ -301,6 +309,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			bytes to write
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
+ * @timings:		Controller timing characteristics
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -327,6 +336,7 @@ struct sunxi_nfc_caps {
 	unsigned int nuser_data_tab;
 	unsigned int max_ecc_steps;
 	int sram_size;
+	const struct sunxi_nfc_timings *timings;
 };
 
 /**
@@ -1667,8 +1677,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 	return nand_prog_page_end_op(nand);
 }
 
-static const s32 tWB_lut[] = {6, 12, 16, 20};
-static const s32 tRHW_lut[] = {4, 8, 12, 20};
+static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.tWB = { 6, 12, 16, 20 },
+	.tRHW = { 4, 8, 12, 20 },
+};
 
 static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 		u32 clk_period)
@@ -1693,6 +1705,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
+	const struct sunxi_nfc_timings *nfc_timings = nfc->caps->timings;
 	const struct nand_sdr_timings *timings;
 	u32 min_clk_period = 0;
 	s32 tWB, tADL, tWHR, tRHW, tCAD;
@@ -1763,8 +1776,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tWC_min, 2);
 
 	/* T16 - T19 + tCAD */
-	if (timings->tWB_max > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tWB_max, 20);
+	if (timings->tWB_max >
+	    (min_clk_period * nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWB_max,
+					      nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	if (timings->tADL_min > (min_clk_period * 32))
 		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
@@ -1772,8 +1787,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	if (timings->tWHR_min > (min_clk_period * 32))
 		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
 
-	if (timings->tRHW_min > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tRHW_min, 20);
+	if (timings->tRHW_min >
+	    (min_clk_period * nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tRHW_min,
+					      nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	/*
 	 * In non-EDO, tREA should be less than tRP to guarantee that the
@@ -1789,7 +1806,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	if (timings->tREA_max > min_clk_period && !timings->tRLOH_min)
 		min_clk_period = timings->tREA_max;
 
-	tWB  = sunxi_nand_lookup_timing(tWB_lut, timings->tWB_max,
+	tWB  = sunxi_nand_lookup_timing(nfc_timings->tWB, timings->tWB_max,
 					min_clk_period);
 	if (tWB < 0) {
 		dev_err(nfc->dev, "unsupported tWB\n");
@@ -1808,7 +1825,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -EINVAL;
 	}
 
-	tRHW = sunxi_nand_lookup_timing(tRHW_lut, timings->tRHW_min,
+	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,
 					min_clk_period);
 	if (tRHW < 0) {
 		dev_err(nfc->dev, "unsupported tRHW\n");
@@ -2595,6 +2612,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2617,6 +2635,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2641,6 +2660,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
