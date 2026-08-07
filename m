Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526FAC2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+12RuZt3r007mxUVqUr4BIBeeT49Tit7VtpkIQB8lU=; b=Qz2BdNOx9aNG+v
	a6LKAoLQ2pnOFGhyZ7pJujBTCHpWOblsnlOkekXTm6oDUQ2tNk7FhcL04naPdvVajvXdEo3En4lvA
	BjuAcnWGf94ucvjN1GSuCisH5mdR2E+D4G6T060wgWO79ZVmi1j2VbVaNUiwnDEp3WNGJ2PI/h/J8
	MinKkLAd7y8AUDatMYV5Qedipf814EuvfL661V92Y7PBEnMcQW0KtyAc4jV1ZMr9jHc39QaIbBk6j
	VTmiyNLAtnLPOLxQgaKcKrUKvYIe6Gcv2Z+npR1JWtEnkEVkUIGqjPMwfkLnSvKH40+Dg8W+yWz27
	Yl1AZ4S7pSd/tg1bDrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfD-00000008M35-0eZM;
	Fri, 07 Aug 2026 15:39:15 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfA-00000008M0R-2wuU
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:13 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-497deab2d66so1736703b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117152; x=1786721952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=;
        b=bLtFfkHzEwZJEToCWe1dbcshMzC3x+keizL4IC5nQpuy/fyrFepLpokBL2BCWBKyVM
         qBcg5fjxxOc/yBi98Pg0MHZvMB0U8M1BeAGHYbpGtuo+1XjAqFGxVKNZbNT7QEfn+nyz
         S2qC/BgU1Hw3QnarYdH1NaAroQIn7OjSs36P/gRkm1YfDmXj0xyuQiwkoz9I+9aRA9l5
         YY93oFdt6FF/PAIDmMZbQa2Q8mdgsJJmLdrPkr09t59YWrXPxaMFgVri8RBYPnxTceTR
         FGQVrvxFYlOtmRXTpqrcUHyiCu8bfmrU6eU6eEaqmHoZ1VDxpPM0/ny2Ud+fvaiFjtPp
         nLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117152; x=1786721952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=;
        b=F1k6COJl2ub+UJ05lARJQyd7fN6GzLEsrhfza8W3gisCW+JPsFe8X/OaN65ra+9YJW
         zVWFcXNmxfSQXPfbcdDcitanw5Qqbc4bOBNuNSK+4NMI3v/hYqtqQZkjvjJdZJV7G8lA
         n3OoQ08Jtzo8OCm0CuowSjvVDbUk8sTcTEHui5M8gyeWBHk546VGvlKS/b4qxKmppEgt
         1HGkIoV3JtVPZCXjpmtTR1R9ZSWpOJeJcUi9SePObdlR1Gn65CZCsTtY6v9HVfNEpPC8
         srzgXNTZiChG6SHYpd9+rxQEfqwP0AxK8NJkmeU6YSvlHJBDOV+JCQDIDLIn9L5CTIFN
         5mOQ==
X-Gm-Message-State: AOJu0YzjZ26GrWc5TelTDZsC3qveujRRbI4ZeUIlMJaGhTM16E4KgLcA
	xICoK9V1reJjMU9Iyg12Mj7RVifNpp3F+uilefn6/LgBV0KdzvcmC8B6
X-Gm-Gg: AR+sD12pviT19bLiOf5ZjuYjhO87HigMkJY53TDJBKtuCSUsihpVURSette5DBfAAEO
	ZM46bq739zUWyoiuNutUW4a1iUVel3adFzgXJZVvqO1Q5p8eUEOxXNBADCLyNR/kYAl3WsWOvMK
	aq/ajJsYyiQMyHPfIu7MCN5rWh0zgPOuK3igHoQXQ9PNxqqibOzblXlYb5iUPh197fTuagOL2E4
	SnIxJqWxBilz+mnjHuq1nxDnFXTT7gkFljBDFSVMW7xxNRBqrybJ+/u82bZxYMciyfGTESc7B3T
	dxPwSNsiFuUlQKlwYWW8xFdN8r45b3FFqWRWvAi6bvMwXbgh5xOxjIrPecHlkfGIhTnPrXxp5AV
	v49JKV/FNXvhQqslwrtD8Uds9S/HSFdSKk9OB0MbIVYF371IH+14WJ4251WdL/0q4KbQosXySLc
	O2C0lPRXxNdxomcRKQZfRo/vF/9ZbovmcjytbOLjopYSLgnEpCJav1feMdDvfAAiHyTiH05FsLw
	E3XpbI/HyNrMVDm7n1pqHePpcnnuMI5YBXrf6JsB2e8NhNQB9GM5SIe8GdJzrxktN8OyYwVg1dn
	3TFXDOY/sUbmoC04fMHk0WmeWEOd1TaT1tPw19OHDp6WwhZ+j1t+9Nrw99tdwD1TYfjPnh9SF/l
	lVq1xMhTice67jcKT
X-Received: by 2002:a05:6808:ec9:b0:4a4:cedc:6859 with SMTP id 5614622812f47-4afc4df6419mr8781396b6e.4.1786117151816;
        Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:39:01 -0600
Subject: [PATCH v3 3/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
MIME-Version: 1.0
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-3-91287b543f41@gmail.com>
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
X-CRM114-CacheID: sfid-20260807_083912_761433_F9AB4149 
X-CRM114-Status: GOOD (  14.08  )
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
index df52501c1285..ca74c9c333e7 100644
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
+					      nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	if (timings->tCLH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	if (timings->tCS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	if (timings->tCH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCH_min,
+					      nfc_timings->setup_cycles);
 
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
+					      nfc_timings->setup_cycles);
 
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
+					      nfc_timings->setup_cycles);
 
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
