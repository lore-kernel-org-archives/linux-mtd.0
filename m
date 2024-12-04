Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FBDE77172
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XuqO3+MLK2b7gW98PdBUZurzfE4pvS6XCOXv/mLNbI=; b=m4PZdSrKHK7XAv
	Sg/KG6ARCE+pF8xfJL54+r3QLogphPRvqjifEusXGaHZEZGSvwrg9w0rKTVqIkE8it7p9HzDFukfx
	ewgr69KgNcZNhP321SBuNy2uGfw6FP7Yu0/pH8JO7G9WAOgmlr5JCFu2cUNGYX5rlt+WOarjUtpMY
	HmppyhcyS0vXCSFY+I2zcUn2Isaw6ZzGqlky/xSMeMd/3lTh4m0XyJkKHJBoRns4dGiRMBWpNysx6
	Eg/cf7XdOY0HD8u3FyH5sv/Q9g1SN7WdMuoiZdBdeJQNYw3x/JMB4jXEUEnkOz4ZHeKZtAwOTI+SL
	VbPSrlNT3WbI2uOSFBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlxi-0000000C6Gz-49Or;
	Wed, 04 Dec 2024 09:46:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIluq-0000000C5b0-0mPt
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:43:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E6B160013;
	Wed,  4 Dec 2024 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733305406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAob4BihDKEkDbqXMvJGubwY19e9hIjluMk6MjRGQNE=;
	b=hVPTKd6uqa9BTyCJRqa5ZyFK6E3Bh4QPizPq4qUtRo+gD6qj6/tyOsL8UyzdLn6QhjyHww
	Jt2ZOwQZ8fcgcPy7/At36TdilqQVe1q0gshNle7R2mDDdaMIwCrRFjM5enlI2R5NaFHnsW
	LSbuMHbk1QOul11KzpZ+htqpKQEYfDv0vA2hEw1Jz6O0xAoz7fnD6/IbTVEB2W66RxCqkx
	tS9P7qy7q+MDFKjhwpeq/JDz5PbEDv740+NIipzH705CWDK+7MBSF0yB2FxjzJWImzHgQC
	sN0dk0dLPOiB5Inc4ja4om9pjGdYQezuw60wXqqvf1I9BIub3Z0iuR7HZfrmrA==
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
Subject: [PATCH v5 6/9] memory: ti-aemif: Export aemif_*_cs_timings()
Date: Wed,  4 Dec 2024 10:43:16 +0100
Message-ID: <20241204094319.1050826-7-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_014328_483168_05EA624F 
X-CRM114-Status: GOOD (  19.19  )
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

Export the aemif_set_cs_timing() and aemif_check_cs_timing() symbols so
they can be used by other drivers

Add a mutex to protect the CS configuration register from concurrent
accesses between the AEMIF and its 'children'.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/ti-aemif.c       | 35 ++++++++++++---------------------
 include/linux/memory/ti-aemif.h | 32 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/memory/ti-aemif.h

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 83fb308a831b..541fc8b8b640 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -13,7 +13,9 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/memory/ti-aemif.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -79,26 +81,6 @@
 
 #define CONFIG_MASK	(EW(EW_MAX) | SSTROBE(SSTROBE_MAX) | ASIZE_MAX)
 
-/**
- * struct aemif_cs_timings: structure to hold CS timings
- * @wstrobe: write strobe width, number of cycles - 1
- * @rstrobe: read strobe width, number of cycles - 1
- * @wsetup: write setup width, number of cycles - 1
- * @whold: write hold width, number of cycles - 1
- * @rsetup: read setup width, number of cycles - 1
- * @rhold: read hold width, number of cycles - 1
- * @ta: minimum turn around time, number of cycles - 1
- */
-struct aemif_cs_timings {
-	u32	wstrobe;
-	u32	rstrobe;
-	u32	wsetup;
-	u32	whold;
-	u32	rsetup;
-	u32	rhold;
-	u32	ta;
-};
-
 /**
  * struct aemif_cs_data: structure to hold CS parameters
  * @timings: timings configuration
@@ -123,6 +105,7 @@ struct aemif_cs_data {
  * @num_cs: number of assigned chip-selects
  * @cs_offset: start number of cs nodes
  * @cs_data: array of chip-select settings
+ * @config_cs_lock: lock used to access CS configuration
  */
 struct aemif_device {
 	void __iomem *base;
@@ -131,6 +114,7 @@ struct aemif_device {
 	u8 num_cs;
 	int cs_offset;
 	struct aemif_cs_data cs_data[NUM_CS];
+	struct mutex config_cs_lock;
 };
 
 /**
@@ -139,7 +123,7 @@ struct aemif_device {
  *
  * @return: 0 if the timing configuration is valid, negative error number otherwise.
  */
-static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
+int aemif_check_cs_timings(struct aemif_cs_timings *timings)
 {
 	if (timings->ta > TA_MAX)
 		return -EINVAL;
@@ -164,6 +148,7 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(aemif_check_cs_timings);
 
 /**
  * aemif_set_cs_timings() - Set the timing configuration of a given chip select.
@@ -173,7 +158,7 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
  *
  * @return: 0 on success, else negative errno.
  */
-static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
+int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
 {
 	unsigned int offset;
 	u32 val, set;
@@ -195,13 +180,16 @@ static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_
 
 	offset = A1CR_OFFSET + cs * 4;
 
+	mutex_lock(&aemif->config_cs_lock);
 	val = readl(aemif->base + offset);
 	val &= ~TIMINGS_MASK;
 	val |= set;
 	writel(val, aemif->base + offset);
+	mutex_unlock(&aemif->config_cs_lock);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(aemif_set_cs_timings);
 
 /**
  * aemif_calc_rate - calculate timing data.
@@ -257,10 +245,12 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	if (data->enable_ss)
 		set |= ACR_SSTROBE_MASK;
 
+	mutex_lock(&aemif->config_cs_lock);
 	val = readl(aemif->base + offset);
 	val &= ~CONFIG_MASK;
 	val |= set;
 	writel(val, aemif->base + offset);
+	mutex_unlock(&aemif->config_cs_lock);
 
 	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &data->timings);
 }
@@ -399,6 +389,7 @@ static int aemif_probe(struct platform_device *pdev)
 	if (IS_ERR(aemif->base))
 		return PTR_ERR(aemif->base);
 
+	mutex_init(&aemif->config_cs_lock);
 	if (np) {
 		/*
 		 * For every controller device node, there is a cs device node
diff --git a/include/linux/memory/ti-aemif.h b/include/linux/memory/ti-aemif.h
new file mode 100644
index 000000000000..da94a9d985e7
--- /dev/null
+++ b/include/linux/memory/ti-aemif.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __MEMORY_TI_AEMIF_H
+#define __MEMORY_TI_AEMIF_H
+
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
+struct aemif_device;
+
+int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings);
+int aemif_check_cs_timings(struct aemif_cs_timings *timings);
+
+#endif // __MEMORY_TI_AEMIF_H
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
