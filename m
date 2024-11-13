Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F4DD41C2B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRzSzlHzE3URZ4A7ZkHC+AyvnZhJYC3m5rY3cXfrMK8=; b=Yb/htyZU4bI+zX
	/7lVY2BjAWnCi/d6aOhMRK+uFLnZ3IXhqe459yAxL7RZyCaMIgWo2BDW0SzatwWJPr49U2ot1aKso
	wvp60jynT2ESfpIJv409kns1Ee2EVdsj7JRc7YK11AxEVwYm43fZLXDl7eUHnMcjrEDLq2z+ESP+O
	bu9NGiupd6ZxUrLBDGGy15sYdLUEWBgkFg75rJNet6w2n+6Rp14KvTrCPssWraWHLfjgldwlpto6g
	SG5xvbwa7oktSku6LL11HRL098tITt7vaB26QzCJH3+e6lZulcxWd7/Dh02iIQMmGYLftQCFJEg44
	p/KpmhatTsEp8YaFFYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA91-00000006LJV-1mu5;
	Wed, 13 Nov 2024 09:58:39 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0Q-00000006IWx-3Qq8
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:49:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 44304C0010;
	Wed, 13 Nov 2024 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftvpwn96mp9ab3nuZr5CAWZJs/gZEbrT9Z+Np+LNnAM=;
	b=n6trIrospMQgZEq1BIu99SNM5abH5y0xz3gZAp+DtEcJarVmJhOTtczdlEMc8odqe6p74c
	6fGSAGEpuXisjfl7T0iDAstHe9fFwwmuYI9LrQETe/Lmu3mCR4BWw+aN8X0xdHuzQEtp4i
	gVNxLjABRCWchK7QCDWzkZ7vLVTvlP8QC0MpGf85tDLb8RydvhOBYRr/C/OZuZ5RHD2Ugu
	iHMwaw5TAkRLjKX5TaAwrcmwlVpY1OFWMylnIN+cpCWeQJJADZDT9hm1GgZAC3g7fHas8/
	0Eln6DaDFXHMlxPvlq5zmLGn4mzPyiUmWCfsb5sJ3zY59Op0RT/P5qUEeCca1w==
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
Subject: [PATCH v3 3/7] memory: ti-aemif: Export aemif_*_cs_timings()
Date: Wed, 13 Nov 2024 10:49:34 +0100
Message-ID: <20241113094938.44817-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014947_258359_E708E40F 
X-CRM114-Status: GOOD (  18.30  )
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
---
 drivers/memory/ti-aemif.c       | 36 ++++++++++++---------------------
 include/linux/memory/ti-aemif.h | 32 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/memory/ti-aemif.h

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index b1236cc9ce92..7f0ca256db3c 100644
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
@@ -107,27 +109,6 @@ struct aemif_cs_data {
 	u8	asize;
 };
 
-/**
- * struct aemif_cs_timings: structure to hold CS timing configuration
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
+	struct mutex config_cs_lock;
 };
 
 /**
@@ -152,7 +135,7 @@ struct aemif_device {
  *
  * @return: 0 if the timing configuration is valid, negative errno otherwise.
  */
-static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
+int aemif_check_cs_timings(struct aemif_cs_timings *timings)
 {
 	if (timings->ta > TA_MAX)
 		return -EINVAL;
@@ -177,6 +160,7 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
 
 	return 0;
 }
+EXPORT_SYMBOL(aemif_check_cs_timings);
 
 /**
  * aemif_set_cs_timings - Set the timing configuration of a given chip select.
@@ -186,7 +170,7 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
  *
  * @return: 0 on success, else negative errno.
  */
-static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
+int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
 {
 	unsigned int offset;
 	u32 val, set;
@@ -208,13 +192,16 @@ static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_
 
 	offset = A1CR_OFFSET + cs * 4;
 
+	mutex_lock(&aemif->config_cs_lock);
 	val = readl(aemif->base + offset);
 	val &= ~TIMINGS_MASK;
 	val |= set;
 	writel(val, aemif->base + offset);
+	mutex_unlock(&aemif->config_cs_lock);
 
 	return 0;
 }
+EXPORT_SYMBOL(aemif_set_cs_timings);
 
 /**
  * aemif_calc_rate - calculate timing data.
@@ -288,10 +275,12 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	if (data->enable_ss)
 		set |= ACR_SSTROBE_MASK;
 
+	mutex_lock(&aemif->config_cs_lock);
 	val = readl(aemif->base + offset);
 	val &= ~CONFIG_MASK;
 	val |= set;
 	writel(val, aemif->base + offset);
+	mutex_unlock(&aemif->config_cs_lock);
 
 	return aemif_set_cs_timings(aemif, data->cs - aemif->cs_offset, &timings);
 }
@@ -434,6 +423,7 @@ static int aemif_probe(struct platform_device *pdev)
 	if (IS_ERR(aemif->base))
 		return PTR_ERR(aemif->base);
 
+	mutex_init(&aemif->config_cs_lock);
 	if (np) {
 		/*
 		 * For every controller device node, there is a cs device node
diff --git a/include/linux/memory/ti-aemif.h b/include/linux/memory/ti-aemif.h
new file mode 100644
index 000000000000..0640d30f6321
--- /dev/null
+++ b/include/linux/memory/ti-aemif.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TI_AEMIF_H
+#define __TI_AEMIF_H
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
+#endif // __TI_AEMIF_H
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
