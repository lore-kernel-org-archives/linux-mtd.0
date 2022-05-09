Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7C0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYn/rPkA20m/bJ+uGUkD3t0lyxJn9xV3QeN0k81abaI=; b=gjq5xKpweJq07O
	R5xkXZHbnVJINwlznZoSLrwdldOcySKEoevEUcQLAZkR7vQvVdxoPu4Lr3MfoG63mPlj6M/bvTiTQ
	/Tl4Rd5le6FfaSNxqY+EMTX+TV/Un1QrPMC1aXQ9xgq+fhuHOa6ZpNmSAVb6r++MqIjKEPJH8LS2/
	6AbUIoj4mk5X4YUiAPnXKtMBhjOgQP7qYPM6fX6tTAk3l6/auC10TwCV8i//Y2Z/OMSt2dE7d/44q
	H3OIc3QI5II4kmLeok6IbErr4DAQvQDOAw8d1oHqC/hOFeknEbW+3pM5uz8J7ITUIRAXXOo+uj2p2
	2umcnhjT6IH1IiCXA2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no5e2-00FCln-HE; Mon, 09 May 2022 15:49:58 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no5dy-00FCjm-3b
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 15:49:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5C4FFF808;
 Mon,  9 May 2022 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652111392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUUv6K9HUQMVxkSzrSE4KhjsJz1JhiINmm328pujPPw=;
 b=Lrru+TMTTVd1adxG9RLTHIBU+LKCG4GA4zd0DW4uuPIx7bBf1Dqvzcl0/J29bsLX5UXcrh
 10VKfQsU1+Vi0gU3v02cKsi74VZ7yKCtqz267L76de+ju2cYcBAL2rTvzSR0pMG1PdPShv
 4aUdahXFv7mzYYCWmSDbMJS2Ju3ZPs0W8HZZLOOtFibhWVuVL0TjWpAtkxYvMlL1UZW1Wh
 rQyI9AXqcJ7l/JaJSHanoTM+1nq8gpxn4LsmnCRicpXb7/2DkxLB2jQ+SIAbef0coe5aOC
 mRMv1+pEcnBFQwgP0RjT9BwMmFTy+yovPab8ozXEd3CXOLh6SPL7h03lmRi6SQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of the
 raw clock API
Date: Mon,  9 May 2022 17:49:43 +0200
Message-Id: <20220509154943.25422-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509154943.25422-1-miquel.raynal@bootlin.com>
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_084954_493371_2A839AAC 
X-CRM114-Status: GOOD (  20.12  )
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
 .../mtd/nand/raw/renesas-nand-controller.c    | 58 +++++++++----------
 1 file changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 6db063b230a9..432c7c22c16c 100644
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
@@ -1335,29 +1336,10 @@ static int rnandc_probe(struct platform_device *pdev)
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
-		return ret;
-
-	ret = clk_prepare_enable(rnandc->eclk);
-	if (ret)
-		goto disable_hclk;
-
 	rnandc_dis_interrupts(rnandc);
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -EPROBE_DEFER) {
-		ret = irq;
-		goto disable_eclk;
+		return irq;
 	} else if (irq < 0) {
 		dev_info(&pdev->dev, "No IRQ found, fallback to polling\n");
 		rnandc->use_polling = true;
@@ -1365,12 +1347,27 @@ static int rnandc_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
 				       "renesas-nand-controller", rnandc);
 		if (ret < 0)
-			goto disable_eclk;
+			return ret;
 	}
 
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
-		goto disable_eclk;
+		return ret;
+
+	devm_pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	/* The external NAND bus clock rate is needed for computing timings */
+	eclk = clk_get(&pdev->dev, "eclk");
+	if (IS_ERR(eclk)) {
+		ret = PTR_ERR(eclk);
+		goto dis_runtime_pm;
+	}
+
+	rnandc->ext_clk_rate = clk_get_rate(eclk);
+	clk_put(eclk);
 
 	rnandc_clear_fifo(rnandc);
 
@@ -1378,14 +1375,12 @@ static int rnandc_probe(struct platform_device *pdev)
 
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
@@ -1396,8 +1391,7 @@ static int rnandc_remove(struct platform_device *pdev)
 
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
