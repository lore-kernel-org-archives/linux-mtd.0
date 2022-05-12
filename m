Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11207C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpq2VHvDUOrCSOTS16wlq6lXhx/d6JnSJ5DYkVv3ACc=; b=ZZvj9PYkXvWpVi
	4RaG7erbGWs9ppRobgDcBBoDnA3L5BqTObCmAqm65Cs9JZlFyroTp5p9vnWAB0tyzSwSYhSQxiDgc
	S5rxugOYdp+BfHp0wuqbhseoZSJb4ip1IYGAPklGXf9bh1oARO1AZ2RnFGWpe75wKwgwnkHiX2+fB
	rPkAGVWIdBMx0o6Kd2Age8oyOebCEULr3X0+ipVgF2aKSSenr4pbMr3W0e45yRrnFpqYmI6b7C8+u
	u05DZLj3Kq3440A0ov4bq3tSKoczUy7U3IJHwGwl1YCYxAE9z1aGH1MmlNV2iXth/Y5xKSC+zSIwI
	Pe7Q+zIb4nqq6xqMq1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npABV-00CVsy-MD; Thu, 12 May 2022 14:52:57 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npABN-00CVow-N2
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 14:52:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 568FFFF80B;
 Thu, 12 May 2022 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652367168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyAPKLax444UE/Ovddfs/2qOIeElJEV9UkmQQJ9oUjU=;
 b=dKoOD0xwp9h3COQ6Fy/MVyAbYgv6aB+Kg5NDgDKqx5RZy53A+4FmtvoBWqSB2gr634cSpX
 FXrB9J5axNP4k1L+stDJDyT6QduhXr0BSN8gWBV77iTJZppiJkd5UBOAWv0QcaxF8LPS8C
 WYoB8B+Fal0wkCSJ0Znl8KFGgrudqzyLQ/8csYRarOFmTP/CSZPm5uB5FNpxTbSyZP/mYb
 +6WN6yDYZfGuvllBS2LI9rzVKFV4/G0iuoaTZr3xWFzyeRjHeOqym7oLwGzjY6g2lSl/dP
 TAQl9iPJ8QRRIW1AkR8qWLKIl9Tm6W3wow/RTY0bLvOpmt4zcAB9Z9XwWns/zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/2] mtd: rawnand: renesas: Use runtime PM instead of the
 raw clock API
Date: Thu, 12 May 2022 16:52:40 +0200
Message-Id: <20220512145240.243469-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512145240.243469-1-miquel.raynal@bootlin.com>
References: <20220512145240.243469-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_075250_111274_1AF1CA79 
X-CRM114-Status: GOOD (  19.13  )
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

This NAND controller is part of a well defined power domain handled by
the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
and exclusively use the runtime PM API to enable/disable the clocks.

We still need to retrieve the external clock rate in order to derive the
NAND timings, but that is not a big deal, we can still do that in the
probe and just save this value to reuse it later.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../mtd/nand/raw/renesas-nand-controller.c    | 51 +++++++++----------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 6db063b230a9..c2fb6900de0c 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -16,6 +16,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #define COMMAND_REG 0x00
@@ -216,8 +217,7 @@ struct rnandc {
 	struct nand_controller controller;
 	struct device *dev;
 	void __iomem *regs;
-	struct clk *hclk;
-	struct clk *eclk;
+	unsigned long ext_clk_rate;
 	unsigned long assigned_cs;
 	struct list_head chips;
 	struct nand_chip *selected_chip;
@@ -891,7 +891,7 @@ static int rnandc_setup_interface(struct nand_chip *chip, int chipnr,
 {
 	struct rnand_chip *rnand = to_rnand(chip);
 	struct rnandc *rnandc = to_rnandc(chip->controller);
-	unsigned int period_ns = 1000000000 / clk_get_rate(rnandc->eclk);
+	unsigned int period_ns = 1000000000 / rnandc->ext_clk_rate;
 	const struct nand_sdr_timings *sdr;
 	unsigned int cyc, cle, ale, bef_dly, ca_to_data;
 
@@ -1319,6 +1319,7 @@ static int rnandc_chips_init(struct rnandc *rnandc)
 static int rnandc_probe(struct platform_device *pdev)
 {
 	struct rnandc *rnandc;
+	struct clk *eclk;
 	int irq, ret;
 
 	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
@@ -1335,29 +1336,26 @@ static int rnandc_probe(struct platform_device *pdev)
 	if (IS_ERR(rnandc->regs))
 		return PTR_ERR(rnandc->regs);
 
-	/* APB clock */
-	rnandc->hclk = devm_clk_get(&pdev->dev, "hclk");
-	if (IS_ERR(rnandc->hclk))
-		return PTR_ERR(rnandc->hclk);
-
-	/* External NAND bus clock */
-	rnandc->eclk = devm_clk_get(&pdev->dev, "eclk");
-	if (IS_ERR(rnandc->eclk))
-		return PTR_ERR(rnandc->eclk);
-
-	ret = clk_prepare_enable(rnandc->hclk);
-	if (ret)
+	devm_pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
 		return ret;
 
-	ret = clk_prepare_enable(rnandc->eclk);
-	if (ret)
-		goto disable_hclk;
+	/* The external NAND bus clock rate is needed for computing timings */
+	eclk = clk_get(&pdev->dev, "eclk");
+	if (IS_ERR(eclk)) {
+		ret = PTR_ERR(eclk);
+		goto dis_runtime_pm;
+	}
+
+	rnandc->ext_clk_rate = clk_get_rate(eclk);
+	clk_put(eclk);
 
 	rnandc_dis_interrupts(rnandc);
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -EPROBE_DEFER) {
 		ret = irq;
-		goto disable_eclk;
+		goto dis_runtime_pm;
 	} else if (irq < 0) {
 		dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
 		rnandc->use_polling = true;
@@ -1365,12 +1363,12 @@ static int rnandc_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
 				       "renesas-nand-controller", rnandc);
 		if (ret < 0)
-			goto disable_eclk;
+			goto dis_runtime_pm;
 	}
 
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
-		goto disable_eclk;
+		goto dis_runtime_pm;
 
 	rnandc_clear_fifo(rnandc);
 
@@ -1378,14 +1376,12 @@ static int rnandc_probe(struct platform_device *pdev)
 
 	ret = rnandc_chips_init(rnandc);
 	if (ret)
-		goto disable_eclk;
+		goto dis_runtime_pm;
 
 	return 0;
 
-disable_eclk:
-	clk_disable_unprepare(rnandc->eclk);
-disable_hclk:
-	clk_disable_unprepare(rnandc->hclk);
+dis_runtime_pm:
+	pm_runtime_put(&pdev->dev);
 
 	return ret;
 }
@@ -1396,8 +1392,7 @@ static int rnandc_remove(struct platform_device *pdev)
 
 	rnandc_chips_cleanup(rnandc);
 
-	clk_disable_unprepare(rnandc->eclk);
-	clk_disable_unprepare(rnandc->hclk);
+	pm_runtime_put(&pdev->dev);
 
 	return 0;
 }
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
