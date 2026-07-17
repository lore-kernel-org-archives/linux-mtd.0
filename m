Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAB9C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNecFs0KNXyw0QVTm0xNp3vxB/il377AlVJwfznu154=; b=vKPyNZMl263LSv
	ny16MLl7Av7ivlj3Sh7zRhAS3bxMRwJIiGpcYkEFQc0B0Rwd6BebGpXKOvEu22ZfZGZ2tVfwyPuSm
	TmmyqRxZyPsuWSnVRN7mhFofXbk8rGvRrQ65wFoMjEKxLVOr130jI5PjkGeJrk9dheFWfgyC73xzO
	+OK2MNhPTyAFjpRAe4x7KXdzbNC97GrS4+/gaZlWgiryQ13msYO6sJ4IaO/Gj3VI6eYeJl04TvD5L
	DZYf9MArXdd2/p/peXDLgXluhlZX75zXhD76kkfhwQIfAmJfJpdYsvRwgDV6i1vrmqNh8I6fkV0Dp
	NJ/sfjQT36poIckZSZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSF-00000002tfw-0Of6;
	Fri, 17 Jul 2026 17:34:31 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSC-00000002tdc-44VX
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 17:34:30 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7ec1e9d3359so3580995a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2026 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309668; x=1784914468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlsKLWHzuG2ZqAxSmlNnrAEdRDdQeGiW44cbYcWz6fU=;
        b=LtuGkxqHv8nwq/HhF06/Etw8EYrVuJ+q2hRK10g1MhZftNnn/0N132kdvybCOPlmlz
         Ep2/ZPmHUq1jvsnjH50SreZITs1UskObjnyzZNSn52iQYU8DYoO8WAnw0az6m8OpbYTf
         6rCYSRbzNBYgdoANcL3AYTEqDrcbGUJAyYawB9ZYd6yU6oS2yS/hjBEEn2heZDmiSXKM
         NLGW5d9egC4wFbXG9axiyuWqpa3yxPOPbePZJp2gVRSIf2w3CVpHxPsBaob48Y18q69c
         sg4xe67dx9/1MRQ5e3jBMTZDcmxDJ3D4mzt9gReYacBQPNoCIGl+/sbKxsLLQpgB1/63
         V5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309668; x=1784914468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VlsKLWHzuG2ZqAxSmlNnrAEdRDdQeGiW44cbYcWz6fU=;
        b=iFEDMhq2GIhZnjz93g7XhE8OBXNHk6wX7qrhtWG7xtraxJm8TqY89JOhu+q1u+idM+
         jQs4e1RPH6VFFB/B8+rdhMX1CrlJxDQElOqwiino9VPKsV1dVEGj4d4mN+GyrA/XIldB
         7eFhwzISSmb31l4zzzqXUZML0cIzHZqyXIUuVh8ryC/0AAvFJoEK0poF0cd9z4pcvrrB
         WquG14yxCZhjDNMd9W+gOZx8MS/y6GFOLqIGFa6kZgk29HQKDT8U13LhNPUIzGegVpyN
         ToXJIBAHJAHcYOqY7OekSZFaRT5L7GOOeoVPjk+1bqSTkLHsa+zYNPj9vf/XW7OVQzh3
         pLRg==
X-Gm-Message-State: AOJu0Yz3cnkBBRw3hi4PDQWn2NTmINBu4Mct7vhAVLxcbZFu5lMuOFdM
	weBs/wabCXEdEa8ub+4TcRiTVrsGt+gG237Ss5+EDAgWo0MctW2PdbHK
X-Gm-Gg: AfdE7cllr8sEgu7BVm74ajvn8jgPP3v+cQA7nsdEhYW6OiR12ZOptaWgcCar6DcaURQ
	TdQWrqb4E2UvCW25sedjJGM7SUZNiVconsE+INSqFjw0AgdD4XmFoaT9UhB8Wyw5XYw8UC0ejHk
	ZcgmILdCU1Z5iiACDf8iB5mG/Ru90lq30NmsTgqlj6jT7IuYzqhlbofDTBPA0XTK9Jx3YYP8kwv
	AIIQqyu/pH7oQajDqKLvIgJl1UKG3RmdnI3MnqtC7LcbZkLwIRyfirakK3TE6/0tlV2oCYLGpUS
	zA3H6zYDcPKP6JhgUAIocaAPWb/XWTgaZPg8Avt8qCImwJs+cxbI4gvQ9ZiFOYowW/foBms0r8z
	nujH11zNbhaikGIZyFMCATu8aq5s8R6OxIGFr6HoI6rdTOjFkS1T4kb3rx9pdPgfwiUMqHK0PV3
	7MoHCc52lX4a4bsqoY6zaGMCFif6KfeMqNLio0u6GDdAn4uq9RUSX8ExAXZjiczRhAIEJIHjoZp
	H6E1rVUFcU6djkizsGu294yWMoIxLTTNaefpy09J12f6a0C8Zjp/Q==
X-Received: by 2002:a05:6830:6afa:b0:7e6:f4a3:1df5 with SMTP id 46e09a7af769-7eda08ae511mr1817637a34.1.1784309667752;
        Fri, 17 Jul 2026 10:34:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:57 -0600
Subject: [PATCH v2 1/3] mtd: rawnand: sunxi: group controller delay tables
MIME-Version: 1.0
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-1-225515107640@gmail.com>
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
X-CRM114-CacheID: sfid-20260717_103429_039289_A6BEFDAF 
X-CRM114-Status: GOOD (  15.45  )
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

Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..d12cbb3c813c 100644
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
+				nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
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
+				nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]);
 
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
