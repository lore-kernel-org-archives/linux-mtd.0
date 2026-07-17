Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D4C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHaRexjVdN2+fIWB3ZVtRK6IR8BZ//asxp/3TvDPI0c=; b=wkE87/b6XbBx7p
	qM+gLKvqkkm6LtGzwUlWl7EDWm4gsexDKNaVUwg1yom/ihLh2pGLeziF8EAm6JydXfUq5MHOOJriz
	mEIbfMsnwwtRX1ql6PXCnHi/sVP9vR77mY12iWfUMwF0RFauZRp7Y4VR5u7J8e480hFHwNDduLcOH
	ERuaVWpZZqofRzUxQdulzljUhm9dz3/tMk2zCZNdoXHz4aOXBXKSpmaZQL5vfUUdUMX6uGIsyk8ad
	WEdzO8d/xZxncY/HkKGW6jQwNqd2LDORxrk7vAotX4MHLXRpscqQKQl1AjUsm5sLpdXFQPD3nm1aH
	hWH0JlKl9bD7eiduG9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSJ-00000002tju-2LYZ;
	Fri, 17 Jul 2026 17:34:35 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSE-00000002teX-12Q6
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 17:34:31 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7eb6573bd52so4249153a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309669; x=1784914469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=;
        b=S6X8/FBeM+MvHGCjXye2YQ9gIGSR5FCASPVt9Kdt10LsEhd4fWPkBkuNm7iPCe8Y2d
         Rz8OUMK4rHExZ9PXA+LSRwae9IQdHcYbvZ93LKDZ5QvA0Lk3K33AZI4gDdLETSff5V2e
         lYVn0KqDaTMpvqIaj+DCvwem2m0s0+ujMoZ5pHSrokeOqLRnZJt9LDJu7NtkuzN0rnLY
         9Nu6HGWsg0vDY2XFvzv+1HO02z3ByuecR9x37GWa+7JvCef1xvguM9EaF2vnwzhp0dGl
         9B4z7frDT3Nb/nKd9E7OnY+j4nakBvhpd95YSWHrRghjqWtqoFhO3m+J3bj/EvTXH6cG
         W9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309669; x=1784914469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=;
        b=oHwynsy2jxscC3DgYYG+52d3SviSOJKPFs1wbMKuIlSt1XCbxjbmsMlH9xyTSL1iZV
         AGTGaPMJMz351n455jwrMoErdbGOL6RfhBmf5SYXATdTIupP+10NtuFo6hTpoQjHqno4
         0ZfUJAmxVOIvs41Nz/HQoJf+UurWgBSQYi5V7u8RSzz/0mJDnGBOQZzTZQe6MGxrhIff
         uV7zD5jbJqlArfzw3NH4KP893bfJFBu3feV/+fRVEZARf8SChPlZuYGf7/GXhOZvw9b7
         5m6vHIKaD8TDf3jv+l7TtnwPTRAniNfCaHAfLuQO7WKU6kzLVUyHC32W13mKiQuv9g05
         ViCQ==
X-Gm-Message-State: AOJu0Yy7beArGM4A+AzK+iz6YJYTYqTohfZ4jAdHs9ccwJtJMzLq4LDn
	UXPWHoryWIMhJiKXLNUOeSLwNxGHjPDwunnlwQUhPF5XbrEjFC2sxa6i
X-Gm-Gg: AfdE7cnjBRKCFX5VlDb8kMMdGLxx/zmiDZFKX1jhKWWKGXI4TsXgij5dzA7zsDs0zoN
	MrQEkkDVws5gKL+h6tA2WHgeWhgZYqAua5dpGHa193ww3MVmue9g68WcQH/4TgJ0ryk18nBbENY
	Gznk4Z+LbGQtkzspL93YYXrvxNnI24bwiphxXExk33jZlmxhbtB1opCZjrPub+2SbF/bEIKMGzk
	0qLQJaqz+C+DSmtmATfZMAgMwbbuFSabG9ALJHS6ud4xFiFpUicWxNOeu4dlCfDzioualPXHb2z
	AAnmIIAFSNdC7xRmxG+U0dzoEQ4kZA6iNVsaUtUK+WFRuNbOWNs/2v4gBjmO1GYAyOwYqzgdEYu
	9W4619BJzM4Es45TtWDkQwgOoKUpOxpK3KmTBhiepD5Q4IdhSJqW9neNW8TJRchnCtNv4Os9EPC
	ChJmfC2JIXITUYGKEOrLIF/fAX53wnzVJTHZYa3lVUUznHSjqKUrApJSUpdoBYwt81qRa2TZR8Z
	FXnuDPoAnxFL7L8hIiDDPpyu8EiK21uYmL867hDsaK0WQzOAACp8g==
X-Received: by 2002:a05:6830:4888:b0:7e9:cdf6:230d with SMTP id 46e09a7af769-7eda154706fmr1996146a34.24.1784309669083;
        Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:58 -0600
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
MIME-Version: 1.0
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-2-225515107640@gmail.com>
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
X-CRM114-CacheID: sfid-20260717_103430_351958_E889EF21 
X-CRM114-Status: GOOD (  13.18  )
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

Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d12cbb3c813c..791f495f6e82 100644
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
+				nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+	if (timings->tWHR_min >
+	    (min_clk_period * nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min,
+				nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
 
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
