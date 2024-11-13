Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA93D41C2D
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7TK4/WRjQGOIfAYxDTsonE8lrBVzHu88t43Z3O1Mgg=; b=EqgzIkJR2ZIqwv
	57hWqogutXab/amZbiFmtqlCQQ5xwpNGxoabZuUkgp+ataKc+rktm/zt01FRqXYr+OWWanacyvOgB
	mcB0mbXp596vA2rz7kt7yFMV4kvzyIBWbkWHAgzEOV2MxClgluU354ipGFlUw3wVLAOSvEvwtNGEi
	vlnfM6G+yXOhVdpgLnIPFssdXtzu+lmMktL7DVA3s8AiRbG1kPaIq4DzF+fAgreniHxHHmDkAzWQr
	RI6JjaNMLAqnMfd4Y3/kwATez05nnKcFmf4Jl+bTQOyjWNqptVXnH61CApGp1RCL4EQk1DUtQTxuZ
	1cJGnnzSQTQjawHyxhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA90-00000006LIv-0rZd;
	Wed, 13 Nov 2024 09:58:38 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0Q-00000006IWl-2xWp
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:49:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 1AAB1C0009;
	Wed, 13 Nov 2024 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DboNf32L7z0z0SUhP1AY5oAny3hFWKZHz0IZ1px16rw=;
	b=RpX7YP4xy23C0dEMl+n1w4m1fJ9N6NKulXQmrzL7D671API6QHv+ABkN1mUokm7dXspswo
	4XFC038lVVCNTF0DKZx9RS+tCKHYn4eHyNLN7DMAjsYAx7rIOhatNDzXeYY4gUWetAVjTQ
	DdGmTpHSUhN98RDqi19W4SNoowRQg2/5wO3TtWpMsDQ34pbuhQ3aAdUpztR2bkRlgI1AuX
	K5VFcvQrW8S4rg/P7omNy2H49noPDYbjpvYNox7mEnzOYgroaFzNc8lAOy0tdhX6pv0XKK
	L52cBSK7NIlmvPw/wXj/nlMP21FfvQ5UFJrEuER4GG0uLfvp1Nm14oE3QO+Rzg==
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
Subject: [PATCH v3 1/7] memory: ti-aemif: Create aemif_check_cs_timings()
Date: Wed, 13 Nov 2024 10:49:32 +0100
Message-ID: <20241113094938.44817-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014947_116765_0FADC2F9 
X-CRM114-Status: GOOD (  17.13  )
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

aemif_calc_rate() check the validity of a new computed timing against a
'max' value given as input. This isn't convenient if we want to check
the CS timing configuration somewhere else in the code.

Wrap the verification of all the chip select's timing configuration into a
single function to ease its exportation in upcoming patches.
Remove the 'max' input from aemif_calc_rate() as it's no longer used.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/memory/ti-aemif.c | 89 ++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index d54dc3cfff73..eef086c8371b 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -107,6 +107,27 @@ struct aemif_cs_data {
 	u8	asize;
 };
 
+/**
+ * struct aemif_cs_timings: structure to hold CS timing configuration
+ * values are expressed in number of clock cycles - 1
+ * @ta: minimum turn around time
+ * @rhold: read hold width
+ * @rstrobe: read strobe width
+ * @rsetup: read setup width
+ * @whold: write hold width
+ * @wstrobe: write strobe width
+ * @wsetup: write setup width
+ */
+struct aemif_cs_timings {
+	u32	ta;
+	u32	rhold;
+	u32	rstrobe;
+	u32	rsetup;
+	u32	whold;
+	u32	wstrobe;
+	u32	wsetup;
+};
+
 /**
  * struct aemif_device: structure to hold device data
  * @base: base address of AEMIF registers
@@ -125,18 +146,48 @@ struct aemif_device {
 	struct aemif_cs_data cs_data[NUM_CS];
 };
 
+/**
+ * aemif_check_cs_timings - Check the validity of a CS timing configuration.
+ * @timings: timings configuration
+ *
+ * @return: 0 if the timing configuration is valid, negative errno otherwise.
+ */
+static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
+{
+	if (timings->ta > TA_MAX)
+		return -EINVAL;
+
+	if (timings->rhold > RHOLD_MAX)
+		return -EINVAL;
+
+	if (timings->rstrobe > RSTROBE_MAX)
+		return -EINVAL;
+
+	if (timings->rsetup > RSETUP_MAX)
+		return -EINVAL;
+
+	if (timings->whold > WHOLD_MAX)
+		return -EINVAL;
+
+	if (timings->wstrobe > WSTROBE_MAX)
+		return -EINVAL;
+
+	if (timings->wsetup > WSETUP_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * aemif_calc_rate - calculate timing data.
  * @pdev: platform device to calculate for
  * @wanted: The cycle time needed in nanoseconds.
  * @clk: The input clock rate in kHz.
- * @max: The maximum divider value that can be programmed.
  *
  * On success, returns the calculated timing value minus 1 for easy
  * programming into AEMIF timing registers, else negative errno.
  */
-static int aemif_calc_rate(struct platform_device *pdev, int wanted,
-			   unsigned long clk, int max)
+static int aemif_calc_rate(struct platform_device *pdev, int wanted, unsigned long clk)
 {
 	int result;
 
@@ -149,10 +200,6 @@ static int aemif_calc_rate(struct platform_device *pdev, int wanted,
 	if (result < 0)
 		result = 0;
 
-	/* ... But configuring tighter timings is not an option. */
-	else if (result > max)
-		result = -EINVAL;
-
 	return result;
 }
 
@@ -174,30 +221,32 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 {
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	struct aemif_cs_data *data = &aemif->cs_data[csnum];
-	int ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;
 	unsigned long clk_rate = aemif->clk_rate;
+	struct aemif_cs_timings timings;
 	unsigned offset;
 	u32 set, val;
+	int ret;
 
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 
-	ta	= aemif_calc_rate(pdev, data->ta, clk_rate, TA_MAX);
-	rhold	= aemif_calc_rate(pdev, data->rhold, clk_rate, RHOLD_MAX);
-	rstrobe	= aemif_calc_rate(pdev, data->rstrobe, clk_rate, RSTROBE_MAX);
-	rsetup	= aemif_calc_rate(pdev, data->rsetup, clk_rate, RSETUP_MAX);
-	whold	= aemif_calc_rate(pdev, data->whold, clk_rate, WHOLD_MAX);
-	wstrobe	= aemif_calc_rate(pdev, data->wstrobe, clk_rate, WSTROBE_MAX);
-	wsetup	= aemif_calc_rate(pdev, data->wsetup, clk_rate, WSETUP_MAX);
+	timings.ta = aemif_calc_rate(pdev, data->ta, clk_rate);
+	timings.rhold = aemif_calc_rate(pdev, data->rhold, clk_rate);
+	timings.rstrobe = aemif_calc_rate(pdev, data->rstrobe, clk_rate);
+	timings.rsetup = aemif_calc_rate(pdev, data->rsetup, clk_rate);
+	timings.whold = aemif_calc_rate(pdev, data->whold, clk_rate);
+	timings.wstrobe = aemif_calc_rate(pdev, data->wstrobe, clk_rate);
+	timings.wsetup = aemif_calc_rate(pdev, data->wsetup, clk_rate);
 
-	if (ta < 0 || rhold < 0 || rstrobe < 0 || rsetup < 0 ||
-	    whold < 0 || wstrobe < 0 || wsetup < 0) {
+	ret = aemif_check_cs_timings(&timings);
+	if (ret) {
 		dev_err(&pdev->dev, "%s: cannot get suitable timings\n",
 			__func__);
-		return -EINVAL;
+		return ret;
 	}
 
-	set = TA(ta) | RHOLD(rhold) | RSTROBE(rstrobe) | RSETUP(rsetup) |
-		WHOLD(whold) | WSTROBE(wstrobe) | WSETUP(wsetup);
+	set = TA(timings.ta) |
+		RHOLD(timings.rhold) | RSTROBE(timings.rstrobe) | RSETUP(timings.rsetup) |
+		WHOLD(timings.whold) | WSTROBE(timings.wstrobe) | WSETUP(timings.wsetup);
 
 	set |= (data->asize & ACR_ASIZE_MASK);
 	if (data->enable_ew)
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
