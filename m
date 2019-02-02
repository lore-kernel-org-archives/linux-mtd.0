Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1F3C282D7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C96E32084C
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 23:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxUEqgbT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="FuNKEcVz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C96E32084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ezgjf976Q52c8mn8LCseUrIrl9F+PyY/q/Mi87typSw=; b=GxUEqgbT4Zo1vFXwR1brOXAUhl
	NCgC71hWS9C5OL30nt7xlI2Qrw3wSTX8rM9Sl97DgTeufrLz/VeDcdeufJPML6Fv2mg/Ub8UGyROX
	sHdMwDFdxbgs/+e3VGp64CL1ey31PNg90Hhr7OBnR6YMiw3EHPPHThit4eVANUzsYZ1Wd7OMU23co
	Rc/8wZkQQfqvOXgUQsMAMzf6VrX52PqoqEIj/h5VcWaaEPDLbo7zTLY70slhQmR/7zs3sQ3AZt+Iz
	wSSNkku/F5AQBbZEDnHLJWnC8181koxk7x1BcNYylTl7yl+N3mvZ9PVY2rFTyaT+U1RG4C36MXKpA
	hgdB/nvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gq4fs-0002nh-Hi; Sat, 02 Feb 2019 23:26:12 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gq4aM-00080a-6s
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2019 23:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549149628; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=rQWGi6bxRhZ+hcQwMeZNHRO50VZkXa8L6uuZKP4pxHE=;
 b=FuNKEcVzJXDEBeuAXKQSnravMUP9uQOKhZ9vdEMlA2OdWwf2pUTbB7qlSGpixYyxHJNG3J
 Y2S/k+N1G9h4YAobJp30qYR8XJ3QeJmZcrsELqsMTJ7BoX7b9PMezTwr9ynji3MlnWpEPe
 n7TMGBy9k/OAscxEgfP7YwlwfihFyL4=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v2 8/9] mtd: rawnand: jz4780-bch: Add support for the JZ4725B
Date: Sat,  2 Feb 2019 20:19:25 -0300
Message-Id: <20190202231926.2444-9-paul@crapouillou.net>
In-Reply-To: <20190202231926.2444-1-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_152030_692907_0B0A68A6 
X-CRM114-Status: GOOD (  21.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mathieu Malaterre <malat@debian.org>, devicetree@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the backend code for the jz4780-bch driver to support the JZ4725B
SoC from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Changes:

v2: No changes

 drivers/mtd/nand/raw/ingenic/Makefile         |   2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c    | 234 ++++++++++++++++++
 .../mtd/nand/raw/ingenic/jz4780_bch_common.c  |   1 +
 .../nand/raw/ingenic/jz4780_bch_internal.h    |   1 +
 4 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c

diff --git a/drivers/mtd/nand/raw/ingenic/Makefile b/drivers/mtd/nand/raw/ingenic/Makefile
index c308062a6620..f38b467490cf 100644
--- a/drivers/mtd/nand/raw/ingenic/Makefile
+++ b/drivers/mtd/nand/raw/ingenic/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_MTD_NAND_JZ4740) += jz4740_nand.o
 obj-$(CONFIG_MTD_NAND_JZ4780) += jz4780_nand.o jz4780_bch_common.o \
-				 jz4780_bch.o
+				 jz4780_bch.o jz4725b_bch.o
diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
new file mode 100644
index 000000000000..54f9c5796e83
--- /dev/null
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * JZ4780 backend code for the jz4780-bch driver
+ *
+ * Copyright (C) 2018 Paul Cercueil <paul@crapouillou.net>
+ *
+ * Based on jz4780_bch.c
+ */
+
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/device.h>
+
+#include "jz4780_bch.h"
+#include "jz4780_bch_internal.h"
+
+#define BCH_BHCR			0x0
+#define BCH_BHCSR			0x4
+#define BCH_BHCCR			0x8
+#define BCH_BHCNT			0xc
+#define BCH_BHDR			0x10
+#define BCH_BHPAR0			0x14
+#define BCH_BHERR0			0x28
+#define BCH_BHINT			0x24
+#define BCH_BHINTES			0x3c
+#define BCH_BHINTEC			0x40
+#define BCH_BHINTE			0x38
+
+#define BCH_BHCR_BSEL_SHIFT		2
+#define BCH_BHCR_BSEL_MASK		(0x1 << BCH_BHCR_BSEL_SHIFT)
+#define BCH_BHCR_ENCE			BIT(3)
+#define BCH_BHCR_INIT			BIT(1)
+#define BCH_BHCR_BCHE			BIT(0)
+
+#define BCH_BHCNT_DEC_COUNT_SHIFT	16
+#define BCH_BHCNT_DEC_COUNT_MASK	(0x3ff << BCH_BHCNT_DEC_COUNT_SHIFT)
+#define BCH_BHCNT_ENC_COUNT_SHIFT	0
+#define BCH_BHCNT_ENC_COUNT_MASK	(0x3ff << BCH_BHCNT_ENC_COUNT_SHIFT)
+
+#define BCH_BHERR_INDEX0_SHIFT		0
+#define BCH_BHERR_INDEX0_MASK		(0x1fff << BCH_BHERR_INDEX0_SHIFT)
+#define BCH_BHERR_INDEX1_SHIFT		16
+#define BCH_BHERR_INDEX1_MASK		(0x1fff << BCH_BHERR_INDEX1_SHIFT)
+
+#define BCH_BHINT_ERRC_SHIFT		28
+#define BCH_BHINT_ERRC_MASK		(0xf << BCH_BHINT_ERRC_SHIFT)
+#define BCH_BHINT_TERRC_SHIFT		16
+#define BCH_BHINT_TERRC_MASK		(0x7f << BCH_BHINT_TERRC_SHIFT)
+#define BCH_BHINT_ALL_0			BIT(5)
+#define BCH_BHINT_ALL_F			BIT(4)
+#define BCH_BHINT_DECF			BIT(3)
+#define BCH_BHINT_ENCF			BIT(2)
+#define BCH_BHINT_UNCOR			BIT(1)
+#define BCH_BHINT_ERR			BIT(0)
+
+/* Timeout for BCH calculation/correction. */
+#define BCH_TIMEOUT_US			100000
+
+static void jz4725b_bch_init(struct jz4780_bch *bch,
+			     struct jz4780_bch_params *params, bool encode)
+{
+	u32 reg;
+
+	/* Clear interrupt status. */
+	writel(readl(bch->base + BCH_BHINT), bch->base + BCH_BHINT);
+
+	/* Initialise and enable BCH. */
+	writel(0x1f, bch->base + BCH_BHCCR);
+	writel(BCH_BHCR_BCHE, bch->base + BCH_BHCSR);
+
+	if (params->strength == 8)
+		writel(BCH_BHCR_BSEL_MASK, bch->base + BCH_BHCSR);
+	else
+		writel(BCH_BHCR_BSEL_MASK, bch->base + BCH_BHCCR);
+
+	if (encode)
+		writel(BCH_BHCR_ENCE, bch->base + BCH_BHCSR);
+	else
+		writel(BCH_BHCR_ENCE, bch->base + BCH_BHCCR);
+
+	writel(BCH_BHCR_INIT, bch->base + BCH_BHCSR);
+
+	/* Set up BCH count register. */
+	reg = params->size << BCH_BHCNT_ENC_COUNT_SHIFT;
+	reg |= (params->size + params->bytes) << BCH_BHCNT_DEC_COUNT_SHIFT;
+	writel(reg, bch->base + BCH_BHCNT);
+}
+
+static void jz4725b_bch_disable(struct jz4780_bch *bch)
+{
+	writel(readl(bch->base + BCH_BHINT), bch->base + BCH_BHINT);
+	writel(BCH_BHCR_BCHE, bch->base + BCH_BHCCR);
+}
+
+static void jz4725b_bch_write_data(struct jz4780_bch *bch, const u8 *buf,
+				   size_t size)
+{
+	while (size--)
+		writeb(*buf++, bch->base + BCH_BHDR);
+}
+
+static void jz4725b_bch_read_parity(struct jz4780_bch *bch, u8 *buf,
+				    size_t size)
+{
+	size_t size32 = size / sizeof(u32);
+	size_t size8 = size % sizeof(u32);
+	u32 *dest32;
+	u8 *dest8;
+	u32 val, offset = 0;
+
+	dest32 = (u32 *)buf;
+	while (size32--) {
+		*dest32++ = readl(bch->base + BCH_BHPAR0 + offset);
+		offset += sizeof(u32);
+	}
+
+	dest8 = (u8 *)dest32;
+	val = readl(bch->base + BCH_BHPAR0 + offset);
+	switch (size8) {
+	case 3:
+		dest8[2] = (val >> 16) & 0xff;
+	case 2:
+		dest8[1] = (val >> 8) & 0xff;
+	case 1:
+		dest8[0] = val & 0xff;
+		break;
+	}
+}
+
+static bool jz4725b_bch_wait_complete(struct jz4780_bch *bch, unsigned int irq,
+				     u32 *status)
+{
+	u32 reg;
+	int ret;
+
+	/*
+	 * While we could use interrupts here and sleep until the operation
+	 * completes, the controller works fairly quickly (usually a few
+	 * microseconds) and so the overhead of sleeping until we get an
+	 * interrupt quite noticeably decreases performance.
+	 */
+	ret = readl_poll_timeout(bch->base + BCH_BHINT, reg,
+				 (reg & irq) == irq, 0, BCH_TIMEOUT_US);
+	if (ret)
+		return false;
+
+	if (status)
+		*status = reg;
+
+	writel(reg, bch->base + BCH_BHINT);
+	return true;
+}
+
+static int jz4725b_calculate(struct jz4780_bch *bch,
+			     struct jz4780_bch_params *params,
+			     const u8 *buf, u8 *ecc_code)
+{
+	int ret = 0;
+
+	mutex_lock(&bch->lock);
+	jz4725b_bch_init(bch, params, true);
+	jz4725b_bch_write_data(bch, buf, params->size);
+
+	if (jz4725b_bch_wait_complete(bch, BCH_BHINT_ENCF, NULL)) {
+		jz4725b_bch_read_parity(bch, ecc_code, params->bytes);
+	} else {
+		dev_err(bch->dev, "timed out while calculating ECC\n");
+		ret = -ETIMEDOUT;
+	}
+
+	jz4725b_bch_disable(bch);
+	mutex_unlock(&bch->lock);
+	return ret;
+}
+
+static int jz4725b_correct(struct jz4780_bch *bch,
+			   struct jz4780_bch_params *params,
+			   u8 *buf, u8 *ecc_code)
+{
+	u32 reg, errors, bit;
+	unsigned int i;
+	int ret = 0;
+
+	mutex_lock(&bch->lock);
+
+	jz4725b_bch_init(bch, params, false);
+	jz4725b_bch_write_data(bch, buf, params->size);
+	jz4725b_bch_write_data(bch, ecc_code, params->bytes);
+
+	if (!jz4725b_bch_wait_complete(bch, BCH_BHINT_DECF, &reg)) {
+		dev_err(bch->dev, "timed out while correcting data\n");
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (reg & (BCH_BHINT_ALL_F | BCH_BHINT_ALL_0)) {
+		/* Data and ECC is all 0xff or 0x00 - nothing to correct */
+		ret = 0;
+		goto out;
+	}
+
+	if (reg & BCH_BHINT_UNCOR) {
+		/* Uncorrectable ECC error */
+		ret = -EBADMSG;
+		goto out;
+	}
+
+	errors = (reg & BCH_BHINT_ERRC_MASK) >> BCH_BHINT_ERRC_SHIFT;
+
+	/* Correct any detected errors. */
+	for (i = 0; i < errors; i++) {
+		if (i & 1) {
+			bit = (reg & BCH_BHERR_INDEX1_MASK) >> BCH_BHERR_INDEX1_SHIFT;
+		} else {
+			reg = readl(bch->base + BCH_BHERR0 + (i * 4));
+			bit = (reg & BCH_BHERR_INDEX0_MASK) >> BCH_BHERR_INDEX0_SHIFT;
+		}
+
+		buf[(bit >> 3)] ^= BIT(bit & 0x7);
+	}
+
+out:
+	jz4725b_bch_disable(bch);
+	mutex_unlock(&bch->lock);
+	return ret;
+}
+
+const struct jz4780_bch_ops jz4780_bch_jz4725b_ops = {
+	.disable = jz4725b_bch_disable,
+	.calculate = jz4725b_calculate,
+	.correct = jz4725b_correct,
+};
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
index 1c1fc418ce8e..f505816193a8 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
@@ -157,6 +157,7 @@ static int jz4780_bch_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id jz4780_bch_dt_match[] = {
+	{ .compatible = "ingenic,jz4725b-bch", .data = &jz4780_bch_jz4725b_ops},
 	{ .compatible = "ingenic,jz4780-bch", .data = &jz4780_bch_jz4780_ops },
 	{},
 };
diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h b/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
index f109b3c8d039..462aded811b1 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
@@ -30,6 +30,7 @@ struct jz4780_bch {
 	struct mutex lock;
 };
 
+extern const struct jz4780_bch_ops jz4780_bch_jz4725b_ops;
 extern const struct jz4780_bch_ops jz4780_bch_jz4780_ops;
 
 #endif /* __DRIVERS_MTD_NAND_JZ4780_BCH_INTERNAL_H__ */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
