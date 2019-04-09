Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE91C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B3E520857
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 11:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbNyop3W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B3E520857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbwXN0wBPBMrxG73AxkuvDrFxq7QCUdhl27e+78JSEc=; b=nbNyop3WsStI70
	83uc4XHX45GfJ0+QoNwA+bYN4ou99oM1kUzfwKWy1ojWvNKLG6RKBAFeGwHxI3NTO/NKRa0+6GusX
	aDv5nlafRqW6vnlmhX3yZD4pFgXKWCKc1hSoAVlmxc6w/oixbccCV28uQBw6Uu529+4QrL3zomIFt
	Y2yjqgx1HDDtaHwZSh5+SxKpCKeg7hCVM1DivnZU9NbiJ0QXkgvoTmaSxVsmrWFQFhbhTHvI1UQYC
	ikFhf+f9duk09FTX/4jNGWYk6p7gknA+Dp1pwGsygNKZJwwHg3V/6v6nB3Y7TfKPO3U+HhgHSF85r
	06bSglzcJJZk0CopVj/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDp29-0001kj-Qb; Tue, 09 Apr 2019 11:35:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDp1V-00089j-NJ
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 11:34:54 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1D-0001OU-Mv; Tue, 09 Apr 2019 13:34:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hDp1C-0001c5-Mg; Tue, 09 Apr 2019 13:34:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/14] mtd: rawnand: gpmi: use runtime PM to manage clocks
Date: Tue,  9 Apr 2019 13:34:16 +0200
Message-Id: <20190409113421.3037-10-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409113421.3037-1-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_043442_483588_D4C921C7 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The gpmi driver aggressively en/disables the clocks between operations
which has significant performance cost. Use runtime PM to get rid of
this bottleneck.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 69 ++++++++++++++--------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index bbf9e6a878b8..19adc8299490 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -14,6 +14,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include "gpmi-nand.h"
 #include "gpmi-regs.h"
 #include "bch-regs.h"
@@ -141,24 +142,11 @@ static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
 	return ret;
 }
 
-static int gpmi_enable_clk(struct gpmi_nand_data *this)
-{
-	return __gpmi_enable_clk(this, true);
-}
-
-static int gpmi_disable_clk(struct gpmi_nand_data *this)
-{
-	return __gpmi_enable_clk(this, false);
-}
-
 static int gpmi_init(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
 	int ret;
 
-	ret = gpmi_enable_clk(this);
-	if (ret)
-		return ret;
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
 		goto err_out;
@@ -191,10 +179,8 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	 */
 	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
-	gpmi_disable_clk(this);
 	return 0;
 err_out:
-	gpmi_disable_clk(this);
 	return ret;
 }
 
@@ -559,8 +545,8 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	page_size     = bch_geo->page_size;
 	gf_len        = bch_geo->gf_len;
 
-	ret = gpmi_enable_clk(this);
-	if (ret)
+	ret = pm_runtime_get_sync(this->dev);
+	if (ret < 0)
 		return ret;
 
 	/*
@@ -594,10 +580,11 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
 				r->bch_regs + HW_BCH_CTRL_SET);
 
-	gpmi_disable_clk(this);
-	return 0;
+	ret = 0;
 err_out:
-	gpmi_disable_clk(this);
+	pm_runtime_mark_last_busy(this->dev);
+	pm_runtime_put_autosuspend(this->dev);
+
 	return ret;
 }
 
@@ -1754,13 +1741,12 @@ static void gpmi_select_chip(struct nand_chip *chip, int chipnr)
 	 * die is selected/unselected.
 	 */
 	if (this->current_chip < 0 && chipnr >= 0) {
-		ret = gpmi_enable_clk(this);
-		if (ret)
+		ret = pm_runtime_get_sync(this->dev);
+		if (ret < 0)
 			dev_err(this->dev, "Failed to enable the clock\n");
 	} else if (this->current_chip >= 0 && chipnr < 0) {
-		ret = gpmi_disable_clk(this);
-		if (ret)
-			dev_err(this->dev, "Failed to disable the clock\n");
+		pm_runtime_mark_last_busy(this->dev);
+		pm_runtime_put_autosuspend(this->dev);
 	}
 
 	/*
@@ -2910,6 +2896,16 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_acquire_resources;
 
+	ret = __gpmi_enable_clk(this, true);
+	if (ret)
+		goto exit_nfc_init;
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
 	ret = gpmi_init(this);
 	if (ret)
 		goto exit_nfc_init;
@@ -2918,11 +2914,16 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_nfc_init;
 
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
 	dev_info(this->dev, "driver registered.\n");
 
 	return 0;
 
 exit_nfc_init:
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	release_resources(this);
 exit_acquire_resources:
 
@@ -2933,6 +2934,9 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
 
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	nand_release(&this->nand);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
@@ -2975,8 +2979,23 @@ static int gpmi_pm_resume(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
+static int __maybe_unused gpmi_runtime_suspend(struct device *dev)
+{
+	struct gpmi_nand_data *this = dev_get_drvdata(dev);
+
+	return __gpmi_enable_clk(this, false);
+}
+
+static int __maybe_unused gpmi_runtime_resume(struct device *dev)
+{
+	struct gpmi_nand_data *this = dev_get_drvdata(dev);
+
+	return __gpmi_enable_clk(this, true);
+}
+
 static const struct dev_pm_ops gpmi_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(gpmi_pm_suspend, gpmi_pm_resume)
+	SET_RUNTIME_PM_OPS(gpmi_runtime_suspend, gpmi_runtime_resume, NULL)
 };
 
 static struct platform_driver gpmi_nand_driver = {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
