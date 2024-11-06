Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C0ED29FB8
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPZL5nWHuaUJtziWzAZ3AhVzWCPFlapkYN/Juspyqfg=; b=Cbk/+ru5yOMGBs
	sKJ1sBelA0e0w2Pkg/yvTP0+xpBnrAuKaVWkVPrA+Cjr3dO2l89ZWls1cp2wyhejRrBH3nDlNiy0r
	DTQYFPjZQuZKpZZQYuJLKiwfJBNMtKVoZ1uOSJ79Fsf5uD1HQJiUy7FiEhf3ughl/Jrl4ldhrhuSJ
	M0f2OSV+OYmCMQhHhIPlJor8Ae9E6HfT/959MalQ8C6zDc59QE48Au7GNLXVju2MfirDosh3IdRak
	RJPpiQibO7jfQiS+vdW3WiJFOMKTEBqz9yhLqRRhQXB4akgShSUOOH/AY8M7HPUas2h3Ofhq9rp62
	ujT9HJgLHFtWQjkG37fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bow-00000002Mc2-2Fst;
	Wed, 06 Nov 2024 08:55:22 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bor-00000002MXr-4Ahc
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 08:55:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 32CA31C000D;
	Wed,  6 Nov 2024 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+0pt+qgA3AeaxElP0RiAUhXdYVSmYqTnFBH1A+/viM=;
	b=F0SwiR+CYN9POeyxUNSZTLHnNidPv6k856mvl4/NeOBbuwNYouBjp15W862XgzPaAf4YpJ
	SOGzYUzwYA5OOu2F29bS1bGF7WFR6uwcv5/oMeF2PAtcButBZehQOhozEq5NTiwsFn0Ls2
	wqqQNXqyGP7/pwP9vONAvWSufRLEwF6GnD67SHt7W785h7AGp5zKyRZ7oAw1QJqm+7OkeG
	QjHRDfRELlMJwmoPnJdcj0Uv5DX1zhqhsLJXf7TipQMye+dLBRIVSNPHWxObSEtPu7ukuE
	QNo0mAhP5N7m0Yi1WOuHct2ZV9WVjr0vxGnnL9L8EVrok1gWNZuT2m8YnhTIAQ==
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
Subject: [PATCH v2 2/6] memory: ti-aemif: Export aemif_set_cs_timings()
Date: Wed,  6 Nov 2024 09:55:03 +0100
Message-ID: <20241106085507.76425-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
References: <20241106085507.76425-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_005518_322264_6E0D692C 
X-CRM114-Status: GOOD (  18.93  )
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

Export the aemif_set_cs_timing() symbol so it can be used by other
drivers

Add a spinlock to protect the CS configuration register from concurrent
accesses.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/memory/ti-aemif.c       | 35 ++++++++++++---------------------
 include/linux/memory/ti-aemif.h | 31 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/memory/ti-aemif.h

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 8d27b2513b2c..4587095aa703 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -13,10 +13,12 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/memory/ti-aemif.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 
 #define TA_SHIFT	2
 #define RHOLD_SHIFT	4
@@ -107,27 +109,6 @@ struct aemif_cs_data {
 	u8	asize;
 };
 
-/**
- * struct aemif_cs_timings: structure to hold cs timing configuration
- * values are expressed in number of clock cycles - 1
- * @ta: minimum turn around time
- * @rhold: read hold width
- * @rstrobe: read strobe width
- * @rsetup: read setup width
- * @whold: write hold width
- * @wstrobe: write strobe width
- * @wsetup: write setup width
- */
-struct aemif_cs_timings {
-	u32	ta;
-	u32	rhold;
-	u32	rstrobe;
-	u32	rsetup;
-	u32	whold;
-	u32	wstrobe;
-	u32	wsetup;
-};
-
 /**
  * struct aemif_device: structure to hold device data
  * @base: base address of AEMIF registers
@@ -136,6 +117,7 @@ struct aemif_cs_timings {
  * @num_cs: number of assigned chip-selects
  * @cs_offset: start number of cs nodes
  * @cs_data: array of chip-select settings
+ * @config_cs_lock: lock used to access CS configuration
  */
 struct aemif_device {
 	void __iomem *base;
@@ -144,6 +126,7 @@ struct aemif_device {
 	u8 num_cs;
 	int cs_offset;
 	struct aemif_cs_data cs_data[NUM_CS];
+	spinlock_t config_cs_lock;
 };
 
 /**
@@ -154,8 +137,9 @@ struct aemif_device {
  *
  * Returns 0 on success, else negative errno.
  */
-static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
+int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
 {
+	unsigned long flags;
 	unsigned int offset;
 	u32 val, set;
 
@@ -176,13 +160,16 @@ static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_
 
 	offset = A1CR_OFFSET + cs * 4;
 
+	spin_lock_irqsave(&aemif->config_cs_lock, flags);
 	val = readl(aemif->base + offset);
 	val &= ~TIMINGS_MASK;
 	val |= set;
 	writel(val, aemif->base + offset);
+	spin_unlock_irqrestore(&aemif->config_cs_lock, flags);
 
 	return 0;
 }
+EXPORT_SYMBOL(aemif_set_cs_timings);
 
 /**
  * aemif_calc_rate - calculate timing data.
@@ -231,6 +218,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	struct aemif_cs_data *data = &aemif->cs_data[csnum];
 	unsigned long clk_rate = aemif->clk_rate;
 	struct aemif_cs_timings timings;
+	unsigned long flags;
 	unsigned offset;
 	u32 set, val;
 
@@ -250,10 +238,12 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	if (data->enable_ss)
 		set |= ACR_SSTROBE_MASK;
 
+	spin_lock_irqsave(&aemif->config_cs_lock, flags);
 	val = readl(aemif->base + offset);
 	val &= ~CONFIG_MASK;
 	val |= set;
 	writel(val, aemif->base + offset);
+	spin_unlock_irqrestore(&aemif->config_cs_lock, flags);
 
 	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &timings);
 }
@@ -396,6 +386,7 @@ static int aemif_probe(struct platform_device *pdev)
 	if (IS_ERR(aemif->base))
 		return PTR_ERR(aemif->base);
 
+	spin_lock_init(&aemif->config_cs_lock);
 	if (np) {
 		/*
 		 * For every controller device node, there is a cs device node
diff --git a/include/linux/memory/ti-aemif.h b/include/linux/memory/ti-aemif.h
new file mode 100644
index 000000000000..809f0a68605a
--- /dev/null
+++ b/include/linux/memory/ti-aemif.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TI_AEMIF_H
+#define __TI_AEMIF_H
+
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
+struct aemif_device;
+
+int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings);
+
+#endif // __TI_AEMIF_H
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
