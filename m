Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B4AD29FBF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NM4TZfDcI0HfbLb/RWNtfX2+9jQFhXgDfFfTEAmIzk8=; b=VL4IPQv76N88Zf
	Bhkfcf5yjR7NQBXbJwOvx6AFE4YbafVzqDiBDJHzXX6rdt5hLo5WiHGP9+B6kGiGpDwu0hM3q1ner
	HFOReMwcw1hgzLznx6YlVgYLgjtxdIs21/zTaboIzLfSzHRPa5IIIFpSK618LCIKL9j82uflnaMbV
	3f4h0CM0JPz+jRqxvrZNldbCVQx3jeuioB5A9EFfZtXPClT5IGCeQ25QNqFF7hdpSOdad/N1BaSMw
	IyRIrYzKCmqTv2VhofIf4LkdpQ/vvPk5wYEeVs19Hr+FmGclVGhj0JNiTDB1nj34zOnkR0DUy5KeN
	6KsPrLw8RbajU/ebrKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bov-00000002MbX-3sFt;
	Wed, 06 Nov 2024 08:55:21 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bor-00000002MXK-1kjw
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 08:55:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 13BE51C0006;
	Wed,  6 Nov 2024 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnTNOv2IUCnGeo4ueCgcKRKkmgfN7QyKHxPbRmRTdao=;
	b=BauBFOL9UNS92/kJNNktBTjDB8EcF6avG2E6SCuUiRg9doJzdU5xgoX6HzY7lEMBzqMVtE
	hkmhSI21B28Q0Us6TAJFl/WPPqbIZWJsbfoxxIcD0bsoeD+z2XtBdaP5tJtybg8+Y8mXmx
	RB2oncISyptybc8av8tBeICQAuWilVJFCeIDPllMVbzR2GqX9+VUsbXDM2s2CF+1vghj3D
	kZBiqtTOoxVp3kjjPK2ZHzWNzQAMl5Dinii9BfQIIM4iafG6jNz9MP0a/FssgF3u9rpalt
	G6fRFFfqFbv5fZvIMU64EtwtWNCWoYhGnC9rC5HqGoZffLX0mXEXJmcszrwXwQ==
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
Subject: [PATCH v2 1/6] memory: ti-aemif: Create aemif_set_cs_timings()
Date: Wed,  6 Nov 2024 09:55:02 +0100
Message-ID: <20241106085507.76425-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_005517_765110_F3EAFF47 
X-CRM114-Status: GOOD (  17.55  )
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

Create an aemif_set_cs_timings() function to isolate the setting of a
chip select timing configuration and ease its exportation.
Move the check of the configuration validity from aemif_calc_rate() to
this new function.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/memory/ti-aemif.c | 111 ++++++++++++++++++++++++++------------
 1 file changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index d54dc3cfff73..8d27b2513b2c 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -69,15 +69,15 @@
 #define ACR_SSTROBE_MASK	BIT(31)
 #define ASIZE_16BIT	1
 
-#define CONFIG_MASK	(TA(TA_MAX) | \
-				RHOLD(RHOLD_MAX) | \
-				RSTROBE(RSTROBE_MAX) |	\
-				RSETUP(RSETUP_MAX) | \
-				WHOLD(WHOLD_MAX) | \
-				WSTROBE(WSTROBE_MAX) | \
-				WSETUP(WSETUP_MAX) | \
-				EW(EW_MAX) | SSTROBE(SSTROBE_MAX) | \
-				ASIZE_MAX)
+#define TIMINGS_MASK	(TA(TA_MAX) | \
+			RHOLD(RHOLD_MAX) | \
+			RSTROBE(RSTROBE_MAX) |	\
+			RSETUP(RSETUP_MAX) | \
+			WHOLD(WHOLD_MAX) | \
+			WSTROBE(WSTROBE_MAX) | \
+			WSETUP(WSETUP_MAX))
+
+#define CONFIG_MASK	(EW(EW_MAX) | SSTROBE(SSTROBE_MAX) | ASIZE_MAX)
 
 /**
  * struct aemif_cs_data: structure to hold cs parameters
@@ -107,6 +107,27 @@ struct aemif_cs_data {
 	u8	asize;
 };
 
+/**
+ * struct aemif_cs_timings: structure to hold cs timing configuration
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
@@ -125,6 +146,44 @@ struct aemif_device {
 	struct aemif_cs_data cs_data[NUM_CS];
 };
 
+/**
+ * aemif_set_cs_timings - Set the timing configuration of a given chip select.
+ * @aemif: aemif device to configure
+ * @cs: index of the chip select to configure.
+ * @timings: timings configuration to set
+ *
+ * Returns 0 on success, else negative errno.
+ */
+static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
+{
+	unsigned int offset;
+	u32 val, set;
+
+	if (!timings || !aemif)
+		return -EINVAL;
+
+	if (cs > aemif->num_cs)
+		return -EINVAL;
+
+	if (timings->ta > TA_MAX || timings->rhold > RHOLD_MAX || timings->rstrobe > RSTROBE_MAX ||
+	    timings->rsetup > RSETUP_MAX || timings->whold > WHOLD_MAX ||
+	    timings->wstrobe > WSTROBE_MAX || timings->wsetup > WSETUP_MAX)
+		return -EINVAL;
+
+	set = TA(timings->ta) | RHOLD(timings->rhold) | RSTROBE(timings->rstrobe) |
+	      RSETUP(timings->rsetup) | WHOLD(timings->whold) |
+	      WSTROBE(timings->wstrobe) | WSETUP(timings->wsetup);
+
+	offset = A1CR_OFFSET + cs * 4;
+
+	val = readl(aemif->base + offset);
+	val &= ~TIMINGS_MASK;
+	val |= set;
+	writel(val, aemif->base + offset);
+
+	return 0;
+}
+
 /**
  * aemif_calc_rate - calculate timing data.
  * @pdev: platform device to calculate for
@@ -149,10 +208,6 @@ static int aemif_calc_rate(struct platform_device *pdev, int wanted,
 	if (result < 0)
 		result = 0;
 
-	/* ... But configuring tighter timings is not an option. */
-	else if (result > max)
-		result = -EINVAL;
-
 	return result;
 }
 
@@ -174,32 +229,22 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 {
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	struct aemif_cs_data *data = &aemif->cs_data[csnum];
-	int ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;
 	unsigned long clk_rate = aemif->clk_rate;
+	struct aemif_cs_timings timings;
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
-
-	set = TA(ta) | RHOLD(rhold) | RSTROBE(rstrobe) | RSETUP(rsetup) |
-		WHOLD(whold) | WSTROBE(wstrobe) | WSETUP(wsetup);
+	timings.ta = aemif_calc_rate(pdev, data->ta, clk_rate, TA_MAX);
+	timings.rhold = aemif_calc_rate(pdev, data->rhold, clk_rate, RHOLD_MAX);
+	timings.rstrobe = aemif_calc_rate(pdev, data->rstrobe, clk_rate, RSTROBE_MAX);
+	timings.rsetup = aemif_calc_rate(pdev, data->rsetup, clk_rate, RSETUP_MAX);
+	timings.whold = aemif_calc_rate(pdev, data->whold, clk_rate, WHOLD_MAX);
+	timings.wstrobe = aemif_calc_rate(pdev, data->wstrobe, clk_rate, WSTROBE_MAX);
+	timings.wsetup = aemif_calc_rate(pdev, data->wsetup, clk_rate, WSETUP_MAX);
 
-	set |= (data->asize & ACR_ASIZE_MASK);
+	set = (data->asize & ACR_ASIZE_MASK);
 	if (data->enable_ew)
 		set |= ACR_EW_MASK;
 	if (data->enable_ss)
@@ -210,7 +255,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	val |= set;
 	writel(val, aemif->base + offset);
 
-	return 0;
+	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &timings);
 }
 
 static inline int aemif_cycles_to_nsec(int val, unsigned long clk_rate)
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
