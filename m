Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF55E7716B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lh9bvRHmrJXjl+noiPRmcZPgm3uL6I6ArL4eybE/TdQ=; b=efkT6ka11r0gBx
	uDzg8YBWumcC54AMTulVfT6yfGY0mJXia2xPU1GVvA2uQt7NW2ERAF6uO0cPF82tEuq6S2CTo0bZk
	0cRZ0RCpMEUU4hcHTPEN6e9az6s9GstBH+jizU/1A6D7N1A7VkCwku48J3CjfWy2D+Jsm9F7TdLJn
	cyvPBbVHX4b0paWlBoSt2eTPivTRbTKIC/E6wnecjouftDhm2IF+50bNhkavUZPy0CNHxAQGDpGOL
	El3V7nwFrvl55BQ1B/NIdnps1GpUDrTntMN2rq3WoruwVvHOZ0OedlB+GHOxNbHKYBHDsi9X3jUMK
	poZE/axMlM4XcB6C67LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlxi-0000000C6GR-1ZEO;
	Wed, 04 Dec 2024 09:46:26 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlup-0000000C5ac-0RSk
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:43:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C32960006;
	Wed,  4 Dec 2024 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733305403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cG2pXBBYPaIu412ONqK9p/NnPgxaT89+ifg4qGZl7k=;
	b=hTlu/ZXIJqSB50d6jE/LErzqwyvOBI+zqGwCFx+VITaUHY0PxU/2HMEGawJPqU3Q2p4JTr
	A3Hh0ggsavNOxBmi7mlnHDrsqHlIv/5ekKrbpvtc42plHiJtc2yMGlWazyLEXY0Y2o4eJM
	ic/qJoGaa++V5T+TGAhWELwo2FFmubbVEdhULxKqqLkpAATRh00CPa2CgfD8uuIdoOPknY
	XeSVea/tt/rgk6qZ+JxD0c4/Uu8/6LfyBGTZtYqOiEv9Co1+YOHh1WI8tDeU6zShwbmGFW
	l+LCbaPQXqoo7j4XK6+gwSuEaDWBa+cWySFXkUcxqFXe2Gd8wbRSpRsykZ+rlg==
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
Subject: [PATCH v5 1/9] memory: ti-aemif: Store timings parameter in number of cycles - 1
Date: Wed,  4 Dec 2024 10:43:11 +0100
Message-ID: <20241204094319.1050826-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_014327_548718_D78F4A07 
X-CRM114-Status: GOOD (  15.15  )
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

The CS configuration register expects timings to be expressed in
'number of cycles - 1' but they are stored in ns in the struct
aemif_cs_data. So at init, the timings currently set are converted to ns
by aemif_get_hw_params(), updated with values from the device-tree
properties, and then converted back to 'number of cycles - 1' before
being applied.

Store the timings directly in 'number of cycles - 1' instead of
nanoseconds.
Perform the conversion from nanosecond during the device-tree parsing.
Remove aemif_cycles_to_nsec() as it isn't used anymore.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/ti-aemif.c | 135 ++++++++++++++++++++++----------------
 1 file changed, 79 insertions(+), 56 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index d54dc3cfff73..f23a549b219b 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -82,26 +82,26 @@
 /**
  * struct aemif_cs_data: structure to hold cs parameters
  * @cs: chip-select number
- * @wstrobe: write strobe width, ns
- * @rstrobe: read strobe width, ns
- * @wsetup: write setup width, ns
- * @whold: write hold width, ns
- * @rsetup: read setup width, ns
- * @rhold: read hold width, ns
- * @ta: minimum turn around time, ns
+ * @wstrobe: write strobe width, number of cycles - 1
+ * @rstrobe: read strobe width, number of cycles - 1
+ * @wsetup: write setup width, number of cycles - 1
+ * @whold: write hold width, number of cycles - 1
+ * @rsetup: read setup width, number of cycles - 1
+ * @rhold: read hold width, number of cycles - 1
+ * @ta: minimum turn around time, number of cycles - 1
  * @enable_ss: enable/disable select strobe mode
  * @enable_ew: enable/disable extended wait mode
  * @asize: width of the asynchronous device's data bus
  */
 struct aemif_cs_data {
 	u8	cs;
-	u16	wstrobe;
-	u16	rstrobe;
-	u8	wsetup;
-	u8	whold;
-	u8	rsetup;
-	u8	rhold;
-	u8	ta;
+	u32	wstrobe;
+	u32	rstrobe;
+	u32	wsetup;
+	u32	whold;
+	u32	rsetup;
+	u32	rhold;
+	u32	ta;
 	u8	enable_ss;
 	u8	enable_ew;
 	u8	asize;
@@ -175,26 +175,18 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	struct aemif_cs_data *data = &aemif->cs_data[csnum];
 	int ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;
-	unsigned long clk_rate = aemif->clk_rate;
 	unsigned offset;
 	u32 set, val;
 
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 
-	ta	= aemif_calc_rate(pdev, data->ta, clk_rate, TA_MAX);
-	rhold	= aemif_calc_rate(pdev, data->rhold, clk_rate, RHOLD_MAX);
-	rstrobe	= aemif_calc_rate(pdev, data->rstrobe, clk_rate, RSTROBE_MAX);
-	rsetup	= aemif_calc_rate(pdev, data->rsetup, clk_rate, RSETUP_MAX);
-	whold	= aemif_calc_rate(pdev, data->whold, clk_rate, WHOLD_MAX);
-	wstrobe	= aemif_calc_rate(pdev, data->wstrobe, clk_rate, WSTROBE_MAX);
-	wsetup	= aemif_calc_rate(pdev, data->wsetup, clk_rate, WSETUP_MAX);
-
-	if (ta < 0 || rhold < 0 || rstrobe < 0 || rsetup < 0 ||
-	    whold < 0 || wstrobe < 0 || wsetup < 0) {
-		dev_err(&pdev->dev, "%s: cannot get suitable timings\n",
-			__func__);
-		return -EINVAL;
-	}
+	ta	=  data->ta;
+	rhold	=  data->rhold;
+	rstrobe	=  data->rstrobe;
+	rsetup	=  data->rsetup;
+	whold	=  data->whold;
+	wstrobe	=  data->wstrobe;
+	wsetup	=  data->wsetup;
 
 	set = TA(ta) | RHOLD(rhold) | RSTROBE(rstrobe) | RSETUP(rsetup) |
 		WHOLD(whold) | WSTROBE(wstrobe) | WSETUP(wsetup);
@@ -213,11 +205,6 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	return 0;
 }
 
-static inline int aemif_cycles_to_nsec(int val, unsigned long clk_rate)
-{
-	return ((val + 1) * NSEC_PER_MSEC) / clk_rate;
-}
-
 /**
  * aemif_get_hw_params - function to read hw register values
  * @pdev: platform device to read for
@@ -231,19 +218,18 @@ static void aemif_get_hw_params(struct platform_device *pdev, int csnum)
 {
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	struct aemif_cs_data *data = &aemif->cs_data[csnum];
-	unsigned long clk_rate = aemif->clk_rate;
 	u32 val, offset;
 
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 	val = readl(aemif->base + offset);
 
-	data->ta = aemif_cycles_to_nsec(TA_VAL(val), clk_rate);
-	data->rhold = aemif_cycles_to_nsec(RHOLD_VAL(val), clk_rate);
-	data->rstrobe = aemif_cycles_to_nsec(RSTROBE_VAL(val), clk_rate);
-	data->rsetup = aemif_cycles_to_nsec(RSETUP_VAL(val), clk_rate);
-	data->whold = aemif_cycles_to_nsec(WHOLD_VAL(val), clk_rate);
-	data->wstrobe = aemif_cycles_to_nsec(WSTROBE_VAL(val), clk_rate);
-	data->wsetup = aemif_cycles_to_nsec(WSETUP_VAL(val), clk_rate);
+	data->ta = TA_VAL(val);
+	data->rhold = RHOLD_VAL(val);
+	data->rstrobe = RSTROBE_VAL(val);
+	data->rsetup = RSETUP_VAL(val);
+	data->whold = WHOLD_VAL(val);
+	data->wstrobe = WSTROBE_VAL(val);
+	data->wsetup = WSETUP_VAL(val);
 	data->enable_ew = EW_VAL(val);
 	data->enable_ss = SSTROBE_VAL(val);
 	data->asize = val & ASIZE_MAX;
@@ -261,7 +247,9 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 				      struct device_node *np)
 {
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
+	unsigned long clk_rate = aemif->clk_rate;
 	struct aemif_cs_data *data;
+	int ret;
 	u32 cs;
 	u32 val;
 
@@ -287,26 +275,61 @@ static int of_aemif_parse_abus_config(struct platform_device *pdev,
 	aemif_get_hw_params(pdev, aemif->num_cs++);
 
 	/* override the values from device node */
-	if (!of_property_read_u32(np, "ti,cs-min-turnaround-ns", &val))
-		data->ta = val;
+	if (!of_property_read_u32(np, "ti,cs-min-turnaround-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, TA_MAX);
+		if (ret < 0)
+			return ret;
 
-	if (!of_property_read_u32(np, "ti,cs-read-hold-ns", &val))
-		data->rhold = val;
+		data->ta = ret;
+	}
 
-	if (!of_property_read_u32(np, "ti,cs-read-strobe-ns", &val))
-		data->rstrobe = val;
+	if (!of_property_read_u32(np, "ti,cs-read-hold-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, RHOLD_MAX);
+		if (ret < 0)
+			return ret;
 
-	if (!of_property_read_u32(np, "ti,cs-read-setup-ns", &val))
-		data->rsetup = val;
+		data->rhold = ret;
+	}
 
-	if (!of_property_read_u32(np, "ti,cs-write-hold-ns", &val))
-		data->whold = val;
+	if (!of_property_read_u32(np, "ti,cs-read-strobe-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, RSTROBE_MAX);
+		if (ret < 0)
+			return ret;
 
-	if (!of_property_read_u32(np, "ti,cs-write-strobe-ns", &val))
-		data->wstrobe = val;
+		data->rstrobe = ret;
+	}
 
-	if (!of_property_read_u32(np, "ti,cs-write-setup-ns", &val))
-		data->wsetup = val;
+	if (!of_property_read_u32(np, "ti,cs-read-setup-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, RSETUP_MAX);
+		if (ret < 0)
+			return ret;
+
+		data->rsetup = ret;
+	}
+
+	if (!of_property_read_u32(np, "ti,cs-write-hold-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, WHOLD_MAX);
+		if (ret < 0)
+			return ret;
+
+		data->whold = ret;
+	}
+
+	if (!of_property_read_u32(np, "ti,cs-write-strobe-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, WSTROBE_MAX);
+		if (ret < 0)
+			return ret;
+
+		data->wstrobe = ret;
+	}
+
+	if (!of_property_read_u32(np, "ti,cs-write-setup-ns", &val)) {
+		ret = aemif_calc_rate(pdev, val, clk_rate, WSETUP_MAX);
+		if (ret < 0)
+			return ret;
+
+		data->wsetup = ret;
+	}
 
 	if (!of_property_read_u32(np, "ti,cs-bus-width", &val))
 		if (val == 16)
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
