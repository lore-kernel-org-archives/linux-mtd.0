Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35A8E77179
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5aUyUTLDiM+iRUMDaU2VZ/BRX0CeZSWDEustiCPDrE=; b=wecgYG0K/NZHFn
	LKrEFa9pP/uDOIKuo9Zb2TK915hH0ZljODFSAUB9bQLEUDAfVJbmYD+TOovEsSLioBXRTvP+5ngrG
	P9Zmi8GLcNnJhSubqbwsnzn3JpP6aNurYOLsMvWQkhDdnObv6W8fwk8rQqDOuulyrXEyS94Da/8iO
	y5kBl1AQz/eZrGQmNwo3gI34I2Z4jVvdY+/CyG5VA6S9uI1yYzrVLTXw89WRD3lJr0PT7Lpd7o/a4
	Ra93pcDIB7vAIZgm6YBKIGePT4xouj8ysy5SllBfFbY1WAQm8AI+GI1lTq2T60s/9kUUruBccnqjc
	4TdQnXvhtkMtqgXSDExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlxj-0000000C6HG-2GCZ;
	Wed, 04 Dec 2024 09:46:27 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlup-0000000C5ax-2Bpo
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:43:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F6316000F;
	Wed,  4 Dec 2024 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733305406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26W5J7+Yyb1PTn8lfArcBq6GxlFwHGn4b3VkCGyRsbM=;
	b=o8wYqnOH1DMfcCzoQOQFdUQC1JNXWi4guIs74lBGant0SC9/Nllk+mNSuaFXdwTSvIV8ws
	4jmn4pS37WqPnJ5t1XNhHelo7RvAbG8JdPpNwIo3WJa7ycXdSGGXz0YyuSmZ/AT+9cJns5
	podr21V+Zlm3FCIcMvCBsN2QdddVxK79INTsIBZCXvZTjx8XxgnGVqNDnxY7NZOMbuxQEV
	Dl6Ae65kbkDoKXQekAeZHtexkUaki2gDilNeVhK/4zhMDQyYrioA3XWOFnIWaF0QnKVRvm
	ANinmKKNWiAda90pG/RcIugeUk8wnYGA+AmWjo9NGhJJnHxk4kQfBSAI9qqs6g==
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
Subject: [PATCH v5 5/9] memory: ti-aemif: Create aemif_set_cs_timings()
Date: Wed,  4 Dec 2024 10:43:15 +0100
Message-ID: <20241204094319.1050826-6-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_014327_824311_6A8DE68D 
X-CRM114-Status: GOOD (  13.20  )
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

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/ti-aemif.c | 65 +++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index ec770a2668e7..83fb308a831b 100644
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
  * struct aemif_cs_timings: structure to hold CS timings
@@ -165,6 +165,44 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
 	return 0;
 }
 
+/**
+ * aemif_set_cs_timings() - Set the timing configuration of a given chip select.
+ * @aemif: aemif device to configure
+ * @cs: index of the chip select to configure
+ * @timings: timings configuration to set
+ *
+ * @return: 0 on success, else negative errno.
+ */
+static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
+{
+	unsigned int offset;
+	u32 val, set;
+	int ret;
+
+	if (!timings || !aemif)
+		return -EINVAL;
+
+	if (cs > aemif->num_cs)
+		return -EINVAL;
+
+	ret = aemif_check_cs_timings(timings);
+	if (ret)
+		return ret;
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
@@ -213,12 +251,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 
-	set = TA(data->timings.ta) |
-		RHOLD(data->timings.rhold) | RSTROBE(data->timings.rstrobe) |
-		RSETUP(data->timings.rsetup) | WHOLD(data->timings.whold) |
-		WSTROBE(data->timings.wstrobe) | WSETUP(data->timings.wsetup);
-
-	set |= (data->asize & ACR_ASIZE_MASK);
+	set = (data->asize & ACR_ASIZE_MASK);
 	if (data->enable_ew)
 		set |= ACR_EW_MASK;
 	if (data->enable_ss)
@@ -229,7 +262,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	val |= set;
 	writel(val, aemif->base + offset);
 
-	return 0;
+	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &data->timings);
 }
 
 /**
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
