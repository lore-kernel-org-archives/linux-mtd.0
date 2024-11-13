Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03997D41C27
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gR6Ww4wDzAQSY9dIlGdys1JW6bPyAbKhgd9zMI1JTzM=; b=ZmSxc+1ot9660u
	4JMjLQsmJrPtF+eZuKoRTk2fq3iRTqXT9aoLZxeSUyYKP8CeDZq48nZMxwtlra0PwZeIMTKY+4fdX
	QMUgRZplNQ3xhive8gVO9XwUh9EiDIjYVp2aBSWD5Fr7nPt0bcWnGEPgNKdxpciQOcKhf8spsRbTQ
	fMlSPONAe56utuDQDV5i5pfHClRsGxgppsaud68L1qtY9VixJlYcY7MpwVtqz+gfgPgMje0w+M7uV
	4kp8xoIQgrDRkBMPpjThlOyKpF+HMQ1wQNRgCjLjVIo6wgvJSEg3vlBDiL0hCEZ/a0zrlDVm3f7FS
	pM729zSfbqriR8ZQx5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA92-00000006LKV-2aOz;
	Wed, 13 Nov 2024 09:58:40 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0Q-00000006IWw-30si
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:49:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id A4328C000D;
	Wed, 13 Nov 2024 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e12TUryYZQDpAftpWISfRSW9eY/LIPfb/YxlEWXq1Ws=;
	b=FUXEMt5AiYsS+gIvemKoLqcLfoQJvjqMiEkKNOc6wHWdbaJd4kP25/BBPEmmPxYV/9DX4h
	TgNcBqfOGP1xEGCujVlbVZh3dRXueMeDx3SflQk/D0BsE6pLwWKRTJa9kjhBce6Q/jMY7K
	1B5u8agXRk4xh7FKsmNQIZ45fkYsE1ODp+Ko6RdsG1vf6eYBKvvHg7G4KOGEZbfxqcSIPG
	ppM7klwgEjGwHVTfSpBeQXAJFqWzR2U1SXg1Em24syT2iQuaKKwoEjPRM/LgyuHseLohDU
	f3QYUHF+6CgKZMedpl2crfU2rXi/g91aRg1nwQFqV7a31S/N09z0USk729sNCQ==
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
Subject: [PATCH v3 2/7] memory: ti-aemif: Create aemif_set_cs_timings()
Date: Wed, 13 Nov 2024 10:49:33 +0100
Message-ID: <20241113094938.44817-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014947_151620_F0216F41 
X-CRM114-Status: GOOD (  13.34  )
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
---
 drivers/memory/ti-aemif.c | 64 ++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index eef086c8371b..b1236cc9ce92 100644
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
@@ -178,6 +178,44 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
 	return 0;
 }
 
+/**
+ * aemif_set_cs_timings - Set the timing configuration of a given chip select.
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
@@ -244,11 +282,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 		return ret;
 	}
 
-	set = TA(timings.ta) |
-		RHOLD(timings.rhold) | RSTROBE(timings.rstrobe) | RSETUP(timings.rsetup) |
-		WHOLD(timings.whold) | WSTROBE(timings.wstrobe) | WSETUP(timings.wsetup);
-
-	set |= (data->asize & ACR_ASIZE_MASK);
+	set = (data->asize & ACR_ASIZE_MASK);
 	if (data->enable_ew)
 		set |= ACR_EW_MASK;
 	if (data->enable_ss)
@@ -259,7 +293,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
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
