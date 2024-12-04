Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF89E77171
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnCBsBbf4jJ8n++mYUS5749QKESqTZoNieSrZE4Y0Xs=; b=zhrzk4gY2YfkxU
	H+3tBMxLjZfh1IBq+9lpvNdP6NJ35nkVk088+GxJhVyHddBHT/AfE2AT9uhKNYmKDgvC/BRUO4IHP
	y8Z3zaxWhEenKPGcw/OgGom1h00oNfIzaA3Yezh+sTP7gSaZMeGDdFwJzCiWgw21HH1GfickK8L7X
	aSnE5NxtZx+uxUdLtARDpoden98+R3LcBY2j6hYJVXZUo8jgpaqX4ufxp2HOVhEKgwayywYrzEkVG
	K3UuuClvz99gKsVsb35wITCofKYKPl/wjIydNFBASjKSRim7sBDxjd+o5FkmnEvbU5ArOq3Gd7dEX
	8uALBjeDSn84LCACElTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlxl-0000000C6ID-0GKS;
	Wed, 04 Dec 2024 09:46:29 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlus-0000000C5ap-0BpJ
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:43:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55C016000E;
	Wed,  4 Dec 2024 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733305404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1dSLJh1SAr2vIT0aQ/N/d5yFBNgqA0SN9iaVBxJ+xc=;
	b=OgJ0OEh8TT0ynPArYFjdi8h19A0loT1wSX8taMnOcspK+yhepP4Tvx3hQP/enaBZPEy5+k
	D72w9HUkzUesJPkkry7zH147mZw+smiGbv+0rWfXhOyUPtn7DXS3p+5Ng4kB46QLk8Duh3
	6KsSlDZU3qfLi7IoNSLXBPpFw79RaolKfc6wLwcgc2ItV+Z7/+ZTxGo7fq470m4wGJrEbM
	U4jqDYarhXXWQasGwC935PGTaqAD4S6j68YPqTPPf3aON85Mdx59zuVkMP0YheGq7YlAk1
	FW5/+KCaji7nPFETh9KP7OKkKz6VwrMvP1BmzgK660ixyuXalLM/yILqbrBzuQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v5 3/9] memory: ti-aemif: Wrap CS timings into a struct
Date: Wed,  4 Dec 2024 10:43:13 +0100
Message-ID: <20241204094319.1050826-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_014330_400512_E6541422 
X-CRM114-Status: GOOD (  13.25  )
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

CS timings are store in the struct aemif_cs_data along with other CS
parameters. It isn't convenient for exposing CS timings to other drivers
without also exposing the other parameters.

Wrap the CS timings in a new struct aemif_cs_timings to simplify their
export in upcoming patches.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/ti-aemif.c | 57 ++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index a0e1a6b53256..1d1b30112af5 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -80,8 +80,7 @@
 				ASIZE_MAX)
 
 /**
- * struct aemif_cs_data: structure to hold cs parameters
- * @cs: chip-select number
+ * struct aemif_cs_timings: structure to hold CS timings
  * @wstrobe: write strobe width, number of cycles - 1
  * @rstrobe: read strobe width, number of cycles - 1
  * @wsetup: write setup width, number of cycles - 1
@@ -89,12 +88,8 @@
  * @rsetup: read setup width, number of cycles - 1
  * @rhold: read hold width, number of cycles - 1
  * @ta: minimum turn around time, number of cycles - 1
- * @enable_ss: enable/disable select strobe mode
- * @enable_ew: enable/disable extended wait mode
- * @asize: width of the asynchronous device's data bus
  */
-struct aemif_cs_data {
-	u8	cs;
+struct aemif_cs_timings {
 	u32	wstrobe;
 	u32	rstrobe;
 	u32	wsetup;
@@ -102,6 +97,19 @@ struct aemif_cs_data {
 	u32	rsetup;
 	u32	rhold;
 	u32	ta;
+};
+
+/**
+ * struct aemif_cs_data: structure to hold CS parameters
+ * @timings: timings configuration
+ * @cs: chip-select number
+ * @enable_ss: enable/disable select strobe mode
+ * @enable_ew: enable/disable extended wait mode
+ * @asize: width of the asynchronous device's data bus
+ */
+struct aemif_cs_data {
+	struct aemif_cs_timings timings;
+	u8	cs;
 	u8	enable_ss;
 	u8	enable_ew;
 	u8	asize;
@@ -179,9 +187,10 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 
-	set = TA(data->ta) |
-		RHOLD(data->rhold) | RSTROBE(data->rstrobe) | RSETUP(data->rsetup) |
-		WHOLD(data->whold) | WSTROBE(data->wstrobe) | WSETUP(data->wsetup);
+	set = TA(data->timings.ta) |
+		RHOLD(data->timings.rhold) | RSTROBE(data->timings.rstrobe) |
+		RSETUP(data->timings.rsetup) | WHOLD(data->timings.whold) |
+		WSTROBE(data->timings.wstrobe) | WSETUP(data->timings.wsetup);
 
 	set |= (data->asize & ACR_ASIZE_MASK);
 	if (data->enable_ew)
@@ -215,13 +224,13 @@ static void aemif_get_hw_params(struct platform_device *pdev, int csnum)
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 	val = readl(aemif->base + offset);
 
-	data->ta = TA_VAL(val);
-	data->rhold = RHOLD_VAL(val);
-	data->rstrobe = RSTROBE_VAL(val);
-	data->rsetup = RSETUP_VAL(val);
-	data->whold = WHOLD_VAL(val);
-	data->wstrobe = WSTROBE_VAL(val);
-	data->wsetup = WSETUP_VAL(val);
+	data->timings.ta = TA_VAL(val);
+	data->timings.rhold = RHOLD_VAL(val);
+	data->timings.rstrobe = RSTROBE_VAL(val);
+	data->timings.rsetup = RSETUP_VAL(val);
+	data->timings.whold = WHOLD_VAL(val);
+	data->timings.wstrobe = WSTROBE_VAL(val);
+	data->timings.wsetup = WSETUP_VAL(val);
 	data->enable_ew = EW_VAL(val);
 	data->enable_ss = SSTROBE_VAL(val);
 	data->asize = val & ASIZE_MAX;
@@ -272,7 +281,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->ta = ret;
+		data->timings.ta = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-read-hold-ns", &val)) {
@@ -280,7 +289,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->rhold = ret;
+		data->timings.rhold = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-read-strobe-ns", &val)) {
@@ -288,7 +297,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->rstrobe = ret;
+		data->timings.rstrobe = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-read-setup-ns", &val)) {
@@ -296,7 +305,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->rsetup = ret;
+		data->timings.rsetup = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-write-hold-ns", &val)) {
@@ -304,7 +313,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->whold = ret;
+		data->timings.whold = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-write-strobe-ns", &val)) {
@@ -312,7 +321,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->wstrobe = ret;
+		data->timings.wstrobe = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-write-setup-ns", &val)) {
@@ -320,7 +329,7 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		data->wsetup = ret;
+		data->timings.wsetup = ret;
 	}
 
 	if (!of_property_read_u32(np, "ti,cs-bus-width", &val))
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
